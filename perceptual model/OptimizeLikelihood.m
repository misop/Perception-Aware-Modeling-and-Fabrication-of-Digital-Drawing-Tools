function [ x, fvals, its ] = OptimizeLikelihood( t, N, D, phys_desc, lambda, evals, render )
%OptimizeLikelihood Finds a D-dimensional perceptual space of N elements
%that satisfies the conducted experiment
%   t - conducted experiment as triplets with selections, format: Sample1, Reference, Sample2, #Picked 1, #Picked 2
%   N - number of elements in space, if empty will use experiment data
%   D - dimensionality of the desired space
%	phys_desc - physical descriptors to correlate with space axis
%	lambda - tunable variable to affect how strong the correlation should be
%   evals - allowed number of evaluations of the objective function
%	render - specifies if minimization progress should be visualized

% basic setup

if nargin < 2
    N = max(max(t(:,1:3)));
end
if nargin < 3
    D = 2;
end
if nargin < 4
    phys_desc = [];
end
if nargin < 5
    lambda = 1;
end
if nargin < 6
    evals = 100000;
end
if nargin < 7
    render = false;
end
N = N - 1;
% prepare function and constraints
fun = f(N, t);

% set function options
its = 0;
fvals = [];
if render
    options = optimoptions('fmincon', 'Display','none', 'SpecifyObjectiveGradient',false, 'MaxFunctionEvaluations',Inf, 'MaxIterations',evals, 'PlotFcn',@optimplotfval);
else
    options = optimoptions('fmincon', 'Display','none', 'SpecifyObjectiveGradient',false, 'MaxFunctionEvaluations',Inf, 'MaxIterations',evals, 'PlotFcn',[]);
end

x = fmincon(@fOpt, rand(N, D), [], [], [], [], [], [], [], options); % unconstrained

    function [f] = fOpt(x)
        f = fun(x);
        
        xx = [x; zeros(1,D)];
        for i=1:min(D, size(phys_desc, 2))
            c = 1 - abs(corr(xx(:,i), phys_desc(:,i)));
            f = f + lambda*c;
        end
    end
end

function [fun] = f(N, t)
    N = N + 1;
    str = '@(x)';    
    M = size(t, 1);
    for m=1:M
        i = t(m, 1);
        r = t(m, 2);
        j = t(m, 3);
        cij = num2str(t(m, 4));
        cji = num2str(t(m, 5));
        [x1, x2, ~, ~] = x_str(i, r, j, N);
        row = strcat('-',cij,'*2*log((1/(exp(-358*0.6667*(',x2,')/23+111*atan(37*0.6667*(',x2,')/294))+1)))-',cji,'*2*log((1/(exp(-358*0.6667*(',x1,')/23+111*atan(37*0.6667*(',x1,')/294))+1)))');%1=0.75
        str = strcat(str, row);
    end
    
    fun = str2func(str);
end

function [x1, x2, dri, drj] = x_str(i, r, j, N)
    if r == N
        dri= strcat('norm(x(',num2str(i),',:))');
        drj= strcat('norm(x(',num2str(j),',:))');
    elseif i == N
        dri= strcat('norm(x(',num2str(r),',:))');
        drj= strcat('norm(x(',num2str(j),',:)-x(',num2str(r),',:))');
    elseif j == N
        dri= strcat('norm(x(',num2str(i),',:)-x(',num2str(r),',:))');
        drj= strcat('norm(x(',num2str(r),',:))');
    else
        dri= strcat('norm(x(',num2str(i),',:)-x(',num2str(r),',:))');
        drj= strcat('norm(x(',num2str(j),',:)-x(',num2str(r),',:))');
    end
    x1 = strcat('(',dri,'-',drj,')');
    x2 = strcat('(',drj,'-',dri,')');
end