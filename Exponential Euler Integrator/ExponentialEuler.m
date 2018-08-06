function [outs] = ExponentialEuler(M, K, V, BCs, options, varargin)
%	M - mass matrix
%	K - stiffness matrix
%	V - degrees of freedom
%	BCs - boundary conditions
%	options - options for simulator and force term selection, documented by structure fields
%	varargin - remaining arguments as required by a specific forcing term
addpath('expokit');
addpath('exportfig');
addpath('expmv');
addpath('SuiteSparse/UMFPACK/MATLAB');
addpath('SuiteSparse/AMD/MATLAB');

N = length(V)*3;
if isempty(options)
    options = struct(...
        'forcingTerm', 'sin',...
        'method', 'iterative',...
        't_max', 1,...
        'h', 1e-3,...
        'X0', zeros(2*N),...
        'X0d', zeros(2*N),...
        'D', false,...
        'fname', 'debug.mat');
end
% time variables
t = 0;
h = options.h;
t_max = options.t_max;
% initial state
X = options.X0;
Xd = options.X0d;
% prepare BCs
P = diag(abs(BCs-1)); 
P(sum(P,2) == 0,:) = [];
P = kron(P, eye(3,3));
MKp = (P*M*P')\(P*K*P');
Ndof = size(P,1);
% damping matrix
if options.D
%     D = diag(ones(Ndof,1)*options.damping) + options.damping*MKp;
    D = options.damping*MKp;
    U = [zeros(Ndof, Ndof), eye(Ndof, Ndof); MKp D];
else
    U = [zeros(Ndof, Ndof), eye(Ndof, Ndof); MKp zeros(Ndof, Ndof)];
end
Pbig = [P zeros(size(P)); zeros(size(P)) P];
PbigT = Pbig';
% sparsify BCs
U = sparse(U);
Pbig = sparse(Pbig);
PbigT = sparse(PbigT);
% pick forcing term
switch options.forcingTerm
    case 'none'
        Finput = NoInput(Pbig, PbigT, U);
        if strcmp(options.method, 'iterative')
            Ffun = @NoIterative;
        elseif strcmp(options.method, 'precomputed')
            Ffun = @NoPrecomputed;
        else
            Ffun = @NoParallel;
        end
    case 'constant'
        Finput = ConstInput(Pbig, PbigT, U, varargin{1}, varargin{2}, N, M, V);
        if strcmp(options.method, 'iterative')
            Ffun = @ConstIterative;
        elseif strcmp(options.method, 'precomputed')
            Ffun = @ConstPrecomputed;
            [dL, dU, dP, dQ, dR] = lu(U, [0.5 0.005]);
            Finput.dL = dL;
            Finput.dU = dU;
            Finput.dP = dP;
            Finput.dQ = dQ;
            Finput.dR = dR;
        else
            Ffun = @ConstParallel;
        end
    case 'sin'
        Finput = SinInput(Pbig, PbigT, U, Ndof, varargin{1}, varargin{2}, varargin{3}, N, M, V);
        if strcmp(options.method, 'iterative')
            Ffun = @SinIterative;
        elseif strcmp(options.method, 'precomputed')
            Ffun = @SinPrecomputed;
            sol = (Finput.Omega2 + Finput.U2);
            [dL, dU, dP, dQ, dR] = lu(sol, [0.5 0.005]);
            Finput.dL = dL;
            Finput.dU = dU;
            Finput.dP = dP;
            Finput.dQ = dQ;
            Finput.dR = dR;
        else
            Ffun = @SinParallel;
        end
    case 'impulse'
        if strcmp(options.method, 'iterative')
        elseif strcmp(options.method, 'precomputed')
        else
        end
end
% simulate with a stepper
if strcmp(options.method, 'iterative')
    outs = IterativeIntegrator(X, Xd, t, h, t_max, Ffun, Finput);
elseif strcmp(options.method, 'parallel')
    outs = ParallelIntegrator(X, Xd, h, t_max, Ffun, Finput);
elseif strcmp(options.method, 'precomputed')
    if isfield(options, 'E') && isempty(options.E) == 0
        E = options.E;
    elseif isfield(options, 'Dname') && isempty(options.Dname)==0 && exist(options.Dname, 'file')==2
        load(options.Dname);
        E = E;
    else
        E = expm(h*U);
        if isfield(options, 'Dname') && isempty(options.Dname)==0
            save(options.Dname, 'E');
        end
    end
    outs = PrecomputedIntegrator(E, X, Xd, t, h, t_max, Ffun, Finput);
else
    outs = OneshotIntegrator(X, Xd, h, t_max, Ffun, Finput);
end
% save result
if isempty(options.fname)==0
    save(options.fname, 'outs');
end
end

%% Integrators
function [outs] = OneshotIntegrator(X0, Xd, h, t_max, Ffun, Finput)
    t_steps = ceil(t_max / h);
    N = length(X0) / 2;
    outs = zeros(N*4, t_steps+1);
    outs(1:N*2,1) = X0;
    outs(N*2+1:end,1) = Xd;    
    % oneshot integration
    for i=1:t_steps
        t = i*h;
        [X, Xd] = Ffun(X0, t, Finput);
        outs(:, i+1) = [X; Xd];
    end
end

function [outs] = ParallelIntegrator(X0, Xd, h, t_max, Ffun, Finput)
    t_steps = ceil(t_max / h);
    N = length(X0) / 2;
    outs = zeros(N*4, t_steps+1);
    outs(1:N*2,1) = X0;
    outs(N*2+1:end,1) = Xd;    
    % initiate parpool
    p = parpool(feature('numcores'));
    % parallel integration
    parfor i=1:t_steps
        t = i*h;
        [X, Xd] = Ffun(X0, t, Finput);
        outs(:, i+1) = [X; Xd];
    end
    % cleanup parpool
    delete(p);
end

function [outs] = IterativeIntegrator(X, Xd, t, h, t_max, Ffun, Finput)
    t_steps = ceil(t_max / h);
    N = length(X) / 2;
    outs = zeros(N*4, t_steps+1);
    outs(1:N*2,1) = X;
    outs(N*2+1:end,1) = Xd;
    sim_idx = 2;
    % iterative integration
    while t <= t_max
        % update next step
        [X, Xd] = Ffun(X, t, h, Finput);
        % move time
        t = t + h;
        outs(1:N*2,sim_idx) = X;
        outs(N*2+1:end,sim_idx) = Xd;
        sim_idx = sim_idx + 1;
    end
end

function [outs] = PrecomputedIntegrator(E, X, Xd, t, h, t_max, Ffun, Finput)
    t_steps = ceil(t_max / h);
    N = length(X) / 2;
    outs = zeros(N*4, t_steps+1);
    outs(1:N*2,1) = X;
    outs(N*2+1:end,1) = Xd;
    sim_idx = 2;
    % iterative integration
    while t <= t_max
        % update next step
        [X, Xd] = Ffun(E, X, t, h, Finput);
        % move time
        t = t + h;
        outs(1:N*2,sim_idx) = X;
        outs(N*2+1:end,sim_idx) = Xd;
        sim_idx = sim_idx + 1;
    end
end

%% no force
function [Finput] = NoInput(Pbig, PbigT, U)
    Finput = struct(...
        'Pbig', Pbig,...
        'PbigT', PbigT,...
        'U', U);
end

function [X, Xd] = NoIterative(X, t, h, I)
    X = I.PbigT*expmv(h, I.U, I.Pbig*X);
    Xd = I.PbigT*I.U*I.Pbig*X;
end

function [X, Xd] = NoPrecomputed(E, X, t, h, I)
    X = I.PbigT*(E*(I.Pbig*X));
    Xd = I.PbigT*(I.U*(I.Pbig*X));
end

function [X, Xd] = NoParallel(X0, t, I)
    X = I.PbigT*expmv(t, I.U, I.Pbig*X0);
    Xd = I.PbigT*I.U*I.Pbig*X;
end

%% constant force
function [Finput] = ConstInput(Pbig, PbigT, U, amplitude, Gamma, N, M, V)
    Finput = struct(...
        'Pbig', Pbig,...
        'PbigT', PbigT,...
        'U', U,...
        'amplitude', amplitude,...
        'Gamma', Gamma,...
        'N', N,...
        'M', M,...
        'V', V);
end

function [X, Xd] = ConstIterative(X, t, h, I)
    f = I.Gamma(I.amplitude, I.N, I.M, I.V);
    
    X = I.PbigT*expmv(h, I.U, I.Pbig*X) + I.PbigT*(I.U\(expmv(h, I.U, I.Pbig*f)-I.Pbig*f));
    Xd = I.PbigT*I.U*I.Pbig*X + I.PbigT*I.Pbig*f;
end

function [X, Xd] = ConstPrecomputed(E, X, t, h, I)
    f = I.Gamma(I.amplitude, I.N, I.M, I.V);
    
    X = I.PbigT*(E*(I.Pbig*X)) + I.PbigT*(I.dQ*(I.dU\(I.dL\(I.dP*(I.dR\(E*(I.Pbig*f)-I.Pbig*f))))));
    Xd = I.PbigT*(I.U*(I.Pbig*X)) + I.PbigT*(I.Pbig*f);
end

function [X, Xd] = ConstParallel(X0, t, I)
    f = I.Gamma(I.amplitude, I.N, I.M, I.V);
    
    X = I.PbigT*(I.U\(expmv(t, I.U, I.Pbig*f)-I.Pbig*f)) + I.PbigT*expmv(t, I.U, I.Pbig*X0);
    Xd = I.PbigT*I.U*I.Pbig*X + I.PbigT*I.Pbig*f;
end

%% sinusoidal force
function [Finput] = SinInput(Pbig, PbigT, U, Ndof, phase, amplitude, Gammaf, N, M, V)
    phase = phase * 2 *pi;
    Omega1 = (phase)*eye(Ndof*2);
    Omega2 = (phase^2)*eye(Ndof*2);
    U2 = U * U;
    % sparsify
    Omega1 = sparse(Omega1);
    Omega2 = sparse(Omega2);
    U2 = sparse(U2);

    Finput = struct(...
        'Pbig', Pbig,...
        'PbigT', PbigT,...
        'U', U,...
        'phase', phase,...
        'amplitude', amplitude,...
        'Gammaf', Gammaf,...
        'N', N,...
        'M', M,...
        'V', V,...
        'Omega1', Omega1,...
        'Omega2', Omega2,...
        'U2', U2);
end

function [X, Xd] = SinIterative(X, t, h, I)
    cost = I.Gammaf(@cos, t, I.phase, I.amplitude, I.N, I.M, I.V);
    costh = I.Gammaf(@cos, t+h, I.phase, I.amplitude, I.N, I.M, I.V);
    sint = I.Gammaf(@sin, t, I.phase, I.amplitude, I.N, I.M, I.V);
    sinth = I.Gammaf(@sin, t+h, I.phase, I.amplitude, I.N, I.M, I.V);
    sol = (I.Omega2 + I.U2);
    
    X = I.PbigT*expmv(h,I.U,I.Pbig*X) + I.PbigT*(sol\(expmv(h,I.U, I.Omega1*I.Pbig*cost + I.U*I.Pbig*sint) - I.Omega1*I.Pbig*costh - I.U*I.Pbig*sinth));
    Xd = I.PbigT*I.U*I.Pbig*X + I.PbigT*I.Pbig*sinth;
end

function [X, Xd] = SinPrecomputed(E, X, t, h, I)
    cost = I.Gammaf(@cos, t, I.phase, I.amplitude, I.N, I.M, I.V);
    costh = I.Gammaf(@cos, t+h, I.phase, I.amplitude, I.N, I.M, I.V);
    sint = I.Gammaf(@sin, t, I.phase, I.amplitude, I.N, I.M, I.V);
    sinth = I.Gammaf(@sin, t+h, I.phase, I.amplitude, I.N, I.M, I.V);
     
    % GPU version
    X = I.PbigT*(gather(E*(I.Pbig*X))) + I.PbigT*(I.dQ*(cs_usolve(I.dU,cs_lsolve(I.dL,(I.dP*(cs_lsolve(I.dR,gather(E*(I.Omega1*I.Pbig*cost + I.U*I.Pbig*sint)) - I.Omega1*(I.Pbig*costh) - I.U*(I.Pbig*sinth))))))));
    Xd = I.PbigT*(I.U*(I.Pbig*X)) + I.PbigT*(I.Pbig*sinth);

    % CPU versiom
%     X = I.PbigT*(E*(I.Pbig*X)) + I.PbigT*(I.dQ*(cs_usolve(I.dU,cs_lsolve(I.dL,(I.dP*(cs_lsolve(I.dR,E*(I.Omega1*I.Pbig*cost + I.U*I.Pbig*sint) - I.Omega1*(I.Pbig*costh) - I.U*(I.Pbig*sinth))))))));
%     Xd = I.PbigT*I.U*I.Pbig*X + I.PbigT*I.Pbig*sinth;
end

function [X, Xd] = SinParallel(X0, t, I)
    cost0 = I.Gammaf(@cos, 0, I.phase, I.amplitude, I.N, I.M, I.V);
    cost = I.Gammaf(@cos, t, I.phase, I.amplitude, I.N, I.M, I.V);
    sint0 = I.Gammaf(@sin, 0, I.phase, I.amplitude, I.N, I.M, I.V);
    sint = I.Gammaf(@sin, t, I.phase, I.amplitude, I.N, I.M, I.V);
    sol = (I.Omega2 + I.U2);
    
    X = I.PbigT*expmv(t,I.U,sol\(I.Omega1*(I.Pbig*cost0) + I.U*(I.Pbig*sint0) - expmv(-t, I.U, I.Omega1*I.Pbig*cost + I.U*I.Pbig*sint))) + I.PbigT*expmv(t, I.U, I.Pbig*X0);    
    Xd = I.PbigT*I.U*I.Pbig*X + I.PbigT*I.Pbig*sint;
end