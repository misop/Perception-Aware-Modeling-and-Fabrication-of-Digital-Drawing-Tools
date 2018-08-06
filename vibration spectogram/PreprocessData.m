function [] = PreprocessData( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
map = MapN();

%% new bench
[S, F] = AverageReadings2(ArmPenOilB2(), false);
map('arm', 'pen', 'oil', 'b2') = {S, F};
[S, F] = AverageReadings2(ArmPenOfficeB2(), false);
map('arm', 'pen', 'office', 'b2') = {S, F};
[S, F] = AverageReadings2(ArmPenNoteB2(), false);
map('arm', 'pen', 'note', 'b2') = {S, F};
[S, F] = AverageReadings2(ArmPenStoneB2(), false);
map('arm', 'pen', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings2(ArmFineOilB2(), false);
map('arm', 'fine', 'oil', 'b2') = {S, F};
[S, F] = AverageReadings2(ArmFineOfficeB2(), false);
map('arm', 'fine', 'office', 'b2') = {S, F};
[S, F] = AverageReadings2(ArmFineNoteB2(), false);
map('arm', 'fine', 'note', 'b2') = {S, F};
[S, F] = AverageReadings2(ArmFineStoneB2(), false);
map('arm', 'fine', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings2(ArmP8bOilB2(), false);
map('arm', 'p8b', 'oil', 'b2') = {S, F};
[S, F] = AverageReadings2(ArmP8bOfficeB2(), false);
map('arm', 'p8b', 'office', 'b2') = {S, F};
[S, F] = AverageReadings2(ArmP8bNoteB2(), false);
map('arm', 'p8b', 'note', 'b2') = {S, F};
[S, F] = AverageReadings2(ArmP8bStoneB2(), false);
map('arm', 'p8b', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings2(ArmP2hOilB2(), false);
map('arm', 'p2h', 'oil', 'b2') = {S, F};
[S, F] = AverageReadings2(ArmP2hOfficeB2(), false);
map('arm', 'p2h', 'office', 'b2') = {S, F};
[S, F] = AverageReadings2(ArmP2hNoteB2(), false);
map('arm', 'p2h', 'note', 'b2') = {S, F};
[S, F] = AverageReadings2(ArmP2hStoneB2(), false);
map('arm', 'p2h', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings2(ArmCharcOilB2(), false);
map('arm', 'charc', 'oil', 'b2') = {S, F};
[S, F] = AverageReadings2(ArmCharcOfficeB2(), false);
map('arm', 'charc', 'office', 'b2') = {S, F};
[S, F] = AverageReadings2(ArmCharcNoteB2(), false);
map('arm', 'charc', 'note', 'b2') = {S, F};
[S, F] = AverageReadings2(ArmCharcStoneB2(), false);
map('arm', 'charc', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmCryonOffice());
map('arm', 'cryon', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmCryonNote());
map('arm', 'cryon', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmCryonStone());
map('arm', 'cryon', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmStabOffice());
map('arm', 'stab', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmStabNote());
map('arm', 'stab', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmStabStone());
map('arm', 'stab', 'stone', 'b2') = {S, F};
%% 3D prints on new bench
[S, F] = AverageReadings3(ArmPlainVero4Office());
map('arm', 'plain', 'vero', '4', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainVero4Note());
map('arm', 'plain', 'vero', '4', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainVero4Stone());
map('arm', 'plain', 'vero', '4', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainVero2Office());
map('arm', 'plain', 'vero', '2', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainVero2Note());
map('arm', 'plain', 'vero', '2', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainVero2Stone());
map('arm', 'plain', 'vero', '2', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainVero1Office());
map('arm', 'plain', 'vero', '1', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainVero1Note());
map('arm', 'plain', 'vero', '1', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainVero1Stone());
map('arm', 'plain', 'vero', '1', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainDM954Office());
map('arm', 'plain', 'DM95', '4', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainDM954Note());
map('arm', 'plain', 'DM95', '4', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainDM954Stone());
map('arm', 'plain', 'DM95', '4', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainDM952Office());
map('arm', 'plain', 'DM95', '2', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainDM952Note());
map('arm', 'plain', 'DM95', '2', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainDM952Stone());
map('arm', 'plain', 'DM95', '2', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainDM951Office());
map('arm', 'plain', 'DM95', '1', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainDM951Note());
map('arm', 'plain', 'DM95', '1', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainDM951Stone());
map('arm', 'plain', 'DM95', '1', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainDM854Office());
map('arm', 'plain', 'DM85', '4', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainDM854Note());
map('arm', 'plain', 'DM85', '4', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainDM854Stone());
map('arm', 'plain', 'DM85', '4', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainDM852Office());
map('arm', 'plain', 'DM85', '2', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainDM852Note());
map('arm', 'plain', 'DM85', '2', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainDM852Stone());
map('arm', 'plain', 'DM85', '2', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainDM851Office());
map('arm', 'plain', 'DM85', '1', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainDM851Note());
map('arm', 'plain', 'DM85', '1', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPlainDM851Stone());
map('arm', 'plain', 'DM85', '1', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPenhDM95Office());
map('arm', 'penh', 'DM95', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPenhDM95Note());
map('arm', 'penh', 'DM95', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPenhDM95Stone());
map('arm', 'penh', 'DM95', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPenhDM85Office());
map('arm', 'penh', 'DM85', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPenhDM85Note());
map('arm', 'penh', 'DM85', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmPenhDM85Stone());
map('arm', 'penh', 'DM85', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmHoleDM954Office());
map('arm', 'hole', 'DM95', '4', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmHoleDM954Note());
map('arm', 'hole', 'DM95', '4', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmHoleDM954Stone());
map('arm', 'hole', 'DM95', '4', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmHoleDM952Office());
map('arm', 'hole', 'DM95', '2', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmHoleDM952Note());
map('arm', 'hole', 'DM95', '2', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmHoleDM952Stone());
map('arm', 'hole', 'DM95', '2', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmHoleDM951Office());
map('arm', 'hole', 'DM95', '1', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmHoleDM951Note());
map('arm', 'hole', 'DM95', '1', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmHoleDM951Stone());
map('arm', 'hole', 'DM95', '1', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmHoleDM854Nail1Note());
map('arm', 'plain', 'DM85', '4', 'nail1', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmHoleDM854Nail2Note());
map('arm', 'plain', 'DM85', '4', 'nail2', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmHoleDM852Nail1Note());
map('arm', 'plain', 'DM85', '2', 'nail1', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmHoleDM852Nail2Note());
map('arm', 'plain', 'DM85', '2', 'nail2', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmHoleDM851Nail1Note());
map('arm', 'plain', 'DM85', '1', 'nail1', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmHoleDM851Nail2Note());
map('arm', 'plain', 'DM85', '1', 'nail2', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmTeflon1Office());
map('arm', 'plain', 'teflon', '1', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmTeflon1Note());
map('arm', 'plain', 'teflon', '1', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmTeflon1Stone());
map('arm', 'plain', 'teflon', '1', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmTeflon2Office());
map('arm', 'plain', 'teflon', '2', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmTeflon2Note());
map('arm', 'plain', 'teflon', '2', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmTeflon2Stone());
map('arm', 'plain', 'teflon', '2', 'stone', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmTeflon4Office());
map('arm', 'plain', 'teflon', '4', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmTeflon4Note());
map('arm', 'plain', 'teflon', '4', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmTeflon4Stone());
map('arm', 'plain', 'teflon', '4', 'stone', 'b2') = {S, F};
%% glass measurements
[S, F] = AverageReadings3(ArmVero1Glass());
map('arm', 'plain', 'vero', '1', 'glass', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmVero2Glass());
map('arm', 'plain', 'vero', '2', 'glass', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmVero4Glass());
map('arm', 'plain', 'vero', '4', 'glass', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmDM951Glass());
map('arm', 'plain', 'DM95', '1', 'glass', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmDM952Glass());
map('arm', 'plain', 'DM95', '2', 'glass', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmDM954Glass());
map('arm', 'plain', 'DM95', '4', 'glass', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmDM851Glass());
map('arm', 'plain', 'DM85', '1', 'glass', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmDM852Glass());
map('arm', 'plain', 'DM85', '2', 'glass', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmDM854Glass());
map('arm', 'plain', 'DM85', '4', 'glass', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmApencilGlass());
map('arm', 'apencil', 'glass', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmM2hGlass());
map('arm', 'm2h', 'glass', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmMhbGlass());
map('arm', 'mhb', 'glass', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmMbGlass());
map('arm', 'mb', 'glass', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmWnylonGlass());
map('arm', 'wnylon', 'glass', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmWfeltGlass());
map('arm', 'wfelt', 'glass', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmWrubberGlass());
map('arm', 'wrubber', 'glass', 'b2') = {S, F};
%% paperlike measurements
[S, F] = AverageReadings3(ArmVero1Paperlike());
map('arm', 'plain', 'vero', '1', 'paperlike', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmVero2Paperlike());
map('arm', 'plain', 'vero', '2', 'paperlike', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmVero4Paperlike());
map('arm', 'plain', 'vero', '4', 'paperlike', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmDM951Paperlike());
map('arm', 'plain', 'DM95', '1', 'paperlike', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmDM952Paperlike());
map('arm', 'plain', 'DM95', '2', 'paperlike', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmDM954Paperlike());
map('arm', 'plain', 'DM95', '4', 'paperlike', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmDM851Paperlike());
map('arm', 'plain', 'DM85', '1', 'paperlike', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmDM852Paperlike());
map('arm', 'plain', 'DM85', '2', 'paperlike', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmDM854Paperlike());
map('arm', 'plain', 'DM85', '4', 'paperlike', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmWnylonPaperlike());
map('arm', 'wnylon', 'paperlike', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmWfeltPaperlike());
map('arm', 'wfelt', 'paperlike', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmWrubberPaperlike());
map('arm', 'wrubber', 'paperlike', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmM2hPaperlike());
map('arm', 'm2h', 'paperlike', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmMhbPaperlike());
map('arm', 'mhb', 'paperlike', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmMbPaperlike());
map('arm', 'mb', 'paperlike', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmApencilPaperlike());
map('arm', 'apencil', 'paperlike', 'b2') = {S, F};
%% mixtures
[S, F] = AverageReadings3(ArmMixture1Note());
map('arm', 'plain', 'mixture', '1', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmMixture2Note());
map('arm', 'plain', 'mixture', '2', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmMixture3Note());
map('arm', 'plain', 'mixture', '3', 'note', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmMixture4Office());
map('arm', 'plain', 'mixture', '4', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmMixture5Office());
map('arm', 'plain', 'mixture', '5', 'office', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmMixture6Office());
map('arm', 'plain', 'mixture', '6', 'office', 'b2') = {S, F};
% protector
[S, F] = AverageReadings3(ArmVero1Protector());
map('arm', 'plain', 'vero', '1', 'protector', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmVero2Protector());
map('arm', 'plain', 'vero', '2', 'protector', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmVero4Protector());
map('arm', 'plain', 'vero', '4', 'protector', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmDM951Protector());
map('arm', 'plain', 'DM95', '1', 'protector', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmDM952Protector());
map('arm', 'plain', 'DM95', '2', 'protector', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmDM954Protector());
map('arm', 'plain', 'DM95', '4', 'protector', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmDM851Protector());
map('arm', 'plain', 'DM85', '1', 'protector', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmDM852Protector());
map('arm', 'plain', 'DM85', '2', 'protector', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmDM854Protector());
map('arm', 'plain', 'DM85', '4', 'protector', 'b2') = {S, F};
[S, F] = AverageReadings3(ArmMicture8Protector());
map('arm', 'plain', 'micture', '8', 'protector', 'b2') = {S, F};

%% save to file
save('processed.mat', 'map');
end

%% averaging
function [S, F] = AverageReadings2(ds, normalB)
    if nargin < 2
        normalB = false;
    end
    Fs = 1000;
    N = size(ds, 1);
    M = size(ds, 2);
    L = N;
    
    S = zeros(floor(L/2000), 741);%491
    S = zeros(6, 741);
    idx = 1;
    idx2 = 1;

    for i=1:2000:L-2000
        MY = zeros(741, 1);

        for j=1:M
            y = ds(i+250:i+1749, j);
            y = y - mean(y);
            NFFT = length(y);
            Y = fft(y,NFFT);
            F = ((0:1/NFFT:1-1/NFFT)*Fs).';
            F = F(10:floor(NFFT/2));
            magY = abs(Y) * 2 / NFFT;        % Magnitude of the FFT
            magY = magY(10:floor(NFFT/2));
            MY = MY + magY;
        end
        MY = MY ./ M;
        
        MY = smooth(MY, 5);
        if normalB
            MY = MY ./ max(MY); % normalization
        end

        if mod(idx, 10) == 0
            S(idx2,:) = MY;
            idx2 = idx2 + 1;
        end
        idx = idx + 1;
    end
end

function [S, F] = AverageReadings3(ds)
    Fs = 1000;
    N = size(ds, 1);
    M = size(ds, 2);
    
    S = zeros(6, 741);
    idx = 1;

    for i=2000:2000:N-2000
        MY = zeros(741, 1);

        for j=1:M
            y = ds(i+250:i+1749, j);
            y = y - mean(y);
            NFFT = length(y);
            Y = fft(y,NFFT);
            F = ((0:1/NFFT:1-1/NFFT)*Fs).';
            F = F(10:floor(NFFT/2));
            magY = abs(Y) * 2 / NFFT;        % Magnitude of the FFT
            magY = magY(10:floor(NFFT/2));
            MY = MY + magY;
        end
        MY = MY ./ M;
        
        MY = smooth(MY, 5);
        S(idx,:) = MY;
        idx = idx + 1;
    end
end

%% loading
function [d] = Load(fileName, range)
    d = csvread(strcat('data/', fileName), 1, 1);
%     figure
%     plot(d(:, 2));
    d = d(range, 2);
    d = d - mean(d);
end
%% bench 2.0 measurements
function [ds] = ArmPenOilB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_pen_oil_1.csv', 3854:123854);
    ds(:,2) = Load('arm2/arm_pen_oil_2.csv', 4141:124141);
    ds(:,3) = Load('arm2/arm_pen_oil_3.csv', 3716:123716);
end
function [ds] = ArmPenOfficeB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_pen_paper_1.csv', 3753:123753);
    ds(:,2) = Load('arm2/arm_pen_paper_2.csv', 3739:123739);
    ds(:,3) = Load('arm2/arm_pen_paper_3.csv', 3737:123737);
end
function [ds] = ArmPenNoteB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_pen_note_1.csv', 3783:123783);
    ds(:,2) = Load('arm2/arm_pen_note_2.csv', 3897:123897);
    ds(:,3) = Load('arm2/arm_pen_note_3.csv', 4004:124004);
end
function [ds] = ArmPenStoneB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_pen_stone_1.csv', 3862:123862);
    ds(:,2) = Load('arm2/arm_pen_stone_2.csv', 4017:124017);
    ds(:,3) = Load('arm2/arm_pen_stone_3.csv', 3227:123227);
end
function [ds] = ArmFineOilB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_fine_oil_1.csv', 3012:123012);
    ds(:,2) = Load('arm2/arm_fine_oil_2.csv', 3234:123234);
    ds(:,3) = Load('arm2/arm_fine_oil_3.csv', 3213:123213);
end
function [ds] = ArmFineOfficeB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_fine_office_1.csv', 3448:123448);
    ds(:,2) = Load('arm2/arm_fine_office_2.csv', 3184:123184);
    ds(:,3) = Load('arm2/arm_fine_office_3.csv', 3282:123282);
end
function [ds] = ArmFineNoteB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_fine_note_1.csv', 3311:123311);
    ds(:,2) = Load('arm2/arm_fine_note_2.csv', 3147:123147);
    ds(:,3) = Load('arm2/arm_fine_note_3.csv', 3006:123006);
end
function [ds] = ArmFineStoneB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_fine_stone_1.csv', 3107:123107);
    ds(:,2) = Load('arm2/arm_fine_stone_2.csv', 3205:123205);
    ds(:,3) = Load('arm2/arm_fine_stone_3.csv', 3337:123337);
end
function [ds] = ArmP8bOilB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_p8b_oil_1.csv', 3362:123362);
    ds(:,2) = Load('arm2/arm_p8b_oil_2.csv', 3301:123301);
    ds(:,3) = Load('arm2/arm_p8b_oil_3.csv', 3057:123057);
end
function [ds] = ArmP8bOfficeB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_p8b_office_1.csv', 2834:122834);
    ds(:,2) = Load('arm2/arm_p8b_office_2.csv', 3645:123645);
    ds(:,3) = Load('arm2/arm_p8b_office_3.csv', 3244:123244);
end
function [ds] = ArmP8bNoteB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_p8b_note_1.csv', 4297:124297);
    ds(:,2) = Load('arm2/arm_p8b_note_2.csv', 3691:123691);
    ds(:,3) = Load('arm2/arm_p8b_note_3.csv', 4480:124480);
end
function [ds] = ArmP8bStoneB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_p8b_stone_1.csv', 3609:123609);
    ds(:,2) = Load('arm2/arm_p8b_stone_2.csv', 3248:123248);
    ds(:,3) = Load('arm2/arm_p8b_stone_3.csv', 4072:124072);
end
function [ds] = ArmP2hOilB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_p2h_oil_1.csv', 3956:123956);
    ds(:,2) = Load('arm2/arm_p2h_oil_2.csv', 3640:123640);
    ds(:,3) = Load('arm2/arm_p2h_oil_3.csv', 3685:123685);
end
function [ds] = ArmP2hOfficeB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_p2h_office_1.csv', 3313:123313);
    ds(:,2) = Load('arm2/arm_p2h_office_2.csv', 3286:123286);
    ds(:,3) = Load('arm2/arm_p2h_office_3.csv', 3528:123528);
end
function [ds] = ArmP2hNoteB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_p2h_note_1.csv', 3418:123418);
    ds(:,2) = Load('arm2/arm_p2h_note_2.csv', 3676:123676);
    ds(:,3) = Load('arm2/arm_p2h_note_3.csv', 3983:123983);
end
function [ds] = ArmP2hStoneB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_fine_stone_1.csv', 3090:123090);
    ds(:,2) = Load('arm2/arm_fine_stone_2.csv', 3219:123219);
    ds(:,3) = Load('arm2/arm_fine_stone_3.csv', 3351:123351);
end
function [ds] = ArmCharcOilB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_charc_oil_1.csv', 4392:124392);
    ds(:,2) = Load('arm2/arm_charc_oil_2.csv', 4538:124538);
    ds(:,3) = Load('arm2/arm_charc_oil_3.csv', 4174:124174);
end
function [ds] = ArmCharcOfficeB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_charc_office_1.csv', 3680:123680);
    ds(:,2) = Load('arm2/arm_charc_office_2.csv', 4360:124360);
    ds(:,3) = Load('arm2/arm_charc_office_3.csv', 4641:124641);
end
function [ds] = ArmCharcNoteB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_charc_note_1.csv', 3555:123555);
    ds(:,2) = Load('arm2/arm_charc_note_2.csv', 4002:124002);
    ds(:,3) = Load('arm2/arm_charc_note_3.csv', 3620:123620);
end
function [ds] = ArmCharcStoneB2()
    ds = zeros(120001, 3);
    ds(:,1) = Load('arm2/arm_charc_stone_1.csv', 3958:123958);
    ds(:,2) = Load('arm2/arm_charc_stone_2.csv', 3356:123356);
    ds(:,3) = Load('arm2/arm_charc_stone_3.csv', 3546:123546);
end
function [ds] = ArmCryonOffice()
    ds = Load('arm2/arm_cryon_office.csv', 5317:47316);
    ds = Split(ds);
end
function [ds] = ArmCryonNote()
    ds = Load('arm2/arm_cryon_note.csv', 5290:47289);
    ds = Split(ds);
end
function [ds] = ArmCryonStone()
    ds = Load('arm2/arm_cryon_stone.csv', 5235:47234);
    ds = Split(ds);
end
function [ds] = ArmStabOffice()
    ds = Load('arm2/arm_stab_office.csv', 5314:47313);
    ds = Split(ds);
end
function [ds] = ArmStabNote()
    ds = Load('arm2/arm_stab_note.csv', 5386:47385);
    ds = Split(ds);
end
function [ds] = ArmStabStone()
    ds = Load('arm2/arm_stab_stone.csv', 5319:47318);
    ds = Split(ds);
end
%% prints on new bench
function [ds] = Split(ds)
    ds = reshape(ds, 14000, 3);
end
function [ds] = ArmPlainVero4Office()
    ds = Load('prints/arm_plain_vero_4_office.csv', 4:42003);
    ds = Split(ds);
end
function [ds] = ArmPlainVero4Note()
    ds = Load('prints/arm_plain_vero_4_note.csv', 4:42003);
    ds = Split(ds);
end
function [ds] = ArmPlainVero4Stone()
    ds = Load('prints/arm_plain_vero_4_stone.csv', 4:42003);
    ds = Split(ds);
end
function [ds] = ArmPlainVero2Office()
    ds = Load('prints/arm_plain_vero_2_office.csv', 4:42003);
    ds = Split(ds);
end
function [ds] = ArmPlainVero2Note()
    ds = Load('prints/arm_plain_vero_2_note.csv', 4:42003);
    ds = Split(ds);
end
function [ds] = ArmPlainVero2Stone()
    ds = Load('prints/arm_plain_vero_2_stone.csv', 4:42003);
    ds = Split(ds);
end
function [ds] = ArmPlainVero1Office()
    ds = Load('prints/arm_plain_vero_1_office.csv', 4:42003);
    ds = Split(ds);
end
function [ds] = ArmPlainVero1Note()
    ds = Load('prints/arm_plain_vero_1_note.csv', 4:42003);
    ds = Split(ds);
end
function [ds] = ArmPlainVero1Stone()
    ds = Load('prints/arm_plain_vero_1_stone.csv', 4:42003);
    ds = Split(ds);
end
function [ds] = ArmPlainDM954Office()
    ds = Load('prints/arm_plain_DM95_4_office.csv', 5952:47951);
    ds = Split(ds);
end
function [ds] = ArmPlainDM954Note()
    ds = Load('prints/arm_plain_DM95_4_note.csv', 4:42003);
    ds = Split(ds);
end
function [ds] = ArmPlainDM954Stone()
    ds = Load('prints/arm_plain_DM95_4_stone.csv', 6247:48246);
    ds = Split(ds);
end
function [ds] = ArmPlainDM952Office()
    ds = Load('prints/arm_plain_DM95_2_office.csv', 7657:49656);
    ds = Split(ds);
end
function [ds] = ArmPlainDM952Note()
    ds = Load('prints/arm_plain_DM95_2_note.csv', 5509:47508);
    ds = Split(ds);
end
function [ds] = ArmPlainDM952Stone()
    ds = Load('prints/arm_plain_DM95_2_stone.csv', 6341:48340);
    ds = Split(ds);
end
function [ds] = ArmPlainDM951Office()
    ds = Load('prints/arm_plain_DM95_1_office.csv', 6761:48760);
    ds = Split(ds);
end
function [ds] = ArmPlainDM951Note()
    ds = Load('prints/arm_plain_DM95_1_note.csv', 6531:48530);
    ds = Split(ds);
end
function [ds] = ArmPlainDM951Stone()
    ds = Load('prints/arm_plain_DM95_1_stone.csv', 7007:49006);
    ds = Split(ds);
end
function [ds] = ArmPlainDM854Office()
    ds = Load('prints/arm_plain_DM85_4_office.csv', 6312:48311);
    ds = Split(ds);
end
function [ds] = ArmPlainDM854Note()
    ds = Load('prints/arm_plain_DM85_4_note.csv', 6497:48496);
    ds = Split(ds);
end
function [ds] = ArmPlainDM854Stone()
    ds = Load('prints/arm_plain_DM85_4_stone.csv', 6661:48660);
    ds = Split(ds);
end
function [ds] = ArmPlainDM852Office()
    ds = Load('prints/arm_plain_DM85_2_office.csv', 6198:48197);
    ds = Split(ds);
end
function [ds] = ArmPlainDM852Note()
    ds = Load('prints/arm_plain_DM85_2_note.csv', 6809:48808);
    ds = Split(ds);
end
function [ds] = ArmPlainDM852Stone()
    ds = Load('prints/arm_plain_DM85_2_stone.csv', 6423:48422);
    ds = Split(ds);
end
function [ds] = ArmPlainDM851Office()
    ds = Load('prints/arm_plain_DM85_1_office.csv', 6698:48697);
    ds = Split(ds);
end
function [ds] = ArmPlainDM851Note()
    ds = Load('prints/arm_plain_DM85_1_note.csv', 5987:47986);
    ds = Split(ds);
end
function [ds] = ArmPlainDM851Stone()
    ds = Load('prints/arm_plain_DM85_1_stone.csv', 6744:48743);
    ds = Split(ds);
end
function [ds] = ArmPenhDM95Office()
    ds = Load('prints/arm_penh_DM95_office.csv', 6686:48685);
    ds = Split(ds);
end
function [ds] = ArmPenhDM95Note()
    ds = Load('prints/arm_penh_DM95_note.csv', 6005:48004);
    ds = Split(ds);
end
function [ds] = ArmPenhDM95Stone()
    ds = Load('prints/arm_penh_DM95_stone.csv', 6577:48576);
    ds = Split(ds);
end
function [ds] = ArmPenhDM85Office()
    ds = Load('prints/arm_penh_DM85_office.csv', 7105:49104);
    ds = Split(ds);
end
function [ds] = ArmPenhDM85Note()
    ds = Load('prints/arm_penh_DM85_note.csv', 6416:48415);
    ds = Split(ds);
end
function [ds] = ArmPenhDM85Stone()
    ds = Load('prints/arm_penh_DM85_stone.csv', 6744:48743);
    ds = Split(ds);
end
function [ds] = ArmHoleDM954Office()
    ds = Load('prints/arm_hole_DM95_4_office.csv', 6329:48328);
    ds = Split(ds);
end
function [ds] = ArmHoleDM954Note()
    ds = Load('prints/arm_hole_DM95_4_note.csv', 6114:48113);
    ds = Split(ds);
end
function [ds] = ArmHoleDM954Stone()
    ds = Load('prints/arm_hole_DM95_4_stone.csv', 3:42002);
    ds = Split(ds);
end
function [ds] = ArmHoleDM952Office()
    ds = Load('prints/arm_hole_DM95_2_office.csv', 5435:47434);
    ds = Split(ds);
end
function [ds] = ArmHoleDM952Note()
    ds = Load('prints/arm_hole_DM95_2_note.csv', 6393:48392);
    ds = Split(ds);
end
function [ds] = ArmHoleDM952Stone()
    ds = Load('prints/arm_hole_DM95_2_stone.csv', 7100:49099);
    ds = Split(ds);
end
function [ds] = ArmHoleDM951Office()
    ds = Load('prints/arm_hole_DM95_1_office.csv', 7063:49062);
    ds = Split(ds);
end
function [ds] = ArmHoleDM951Note()
    ds = Load('prints/arm_hole_DM95_1_note.csv', 6452:48451);
    ds = Split(ds);
end
function [ds] = ArmHoleDM951Stone()
    ds = Load('prints/arm_hole_DM95_1_stone.csv', 6270:48269);
    ds = Split(ds);
end
function [ds] = ArmHoleDM854Nail1Note()
    ds = Load('prints/arm_plain_DM85_4_nail1_note.csv', 7876:49875);
    ds = Split(ds);
end
function [ds] = ArmHoleDM854Nail2Note()
    ds = Load('prints/arm_plain_DM85_4_nail2_note.csv', 6467:48466);
    ds = Split(ds);
end
function [ds] = ArmHoleDM852Nail1Note()
    ds = Load('prints/arm_plain_DM85_2_nail1_note.csv', 6051:48050);
    ds = Split(ds);
end
function [ds] = ArmHoleDM852Nail2Note()
    ds = Load('prints/arm_plain_DM85_2_nail2_note.csv', 6376:48375);
    ds = Split(ds);
end
function [ds] = ArmHoleDM851Nail1Note()
    ds = Load('prints/arm_plain_DM85_1_nail1_note.csv',6048:48047);
    ds = Split(ds);
end
function [ds] = ArmHoleDM851Nail2Note()
    ds = Load('prints/arm_plain_DM85_1_nail2_note.csv',3:42002);
    ds = Split(ds);
end
function [ds] = ArmTeflon1Office()
    ds = Load('prints/arm_teflon_1_office.csv',6103:48102);
    ds = Split(ds);
end
function [ds] = ArmTeflon1Note()
    ds = Load('prints/arm_teflon_1_note.csv',6327:48326);
    ds = Split(ds);
end
function [ds] = ArmTeflon1Stone()
    ds = Load('prints/arm_teflon_1_stone.csv',5875:47874);
    ds = Split(ds);
end
function [ds] = ArmTeflon2Office()
    ds = Load('prints/arm_teflon_2_office.csv',6445:48444);
    ds = Split(ds);
end
function [ds] = ArmTeflon2Note()
    ds = Load('prints/arm_teflon_2_note.csv',6320:48319);
    ds = Split(ds);
end
function [ds] = ArmTeflon2Stone()
    ds = Load('prints/arm_teflon_2_stone.csv',6234:48233);
    ds = Split(ds);
end
function [ds] = ArmTeflon4Office()
    ds = Load('prints/arm_teflon_4_office.csv',6271:48270);
    ds = Split(ds);
end
function [ds] = ArmTeflon4Note()
    ds = Load('prints/arm_teflon_4_note.csv',6579:48578);
    ds = Split(ds);
end
function [ds] = ArmTeflon4Stone()
    ds = Load('prints/arm_teflon_4_stone.csv',6038:48037);
    ds = Split(ds);
end
%% glass
function [ds] = ArmVero1Glass()
    ds = Load('arm2/glass/arm_vero_1_glass.csv',6420:48419)*1.15;
    ds = Split(ds);
end
function [ds] = ArmVero2Glass()
    ds = Load('arm2/glass/arm_vero_2_glass.csv',6716:48715)*1.15;
    ds = Split(ds);
end
function [ds] = ArmVero4Glass()
    ds = Load('arm2/glass/arm_vero_4_glass.csv',6749:48748)*1.15;
    ds = Split(ds);
end
function [ds] = ArmDM951Glass()
    ds = Load('arm2/glass/arm_DM95_1_glass.csv',6472:48471)*1.15;
    ds = Split(ds);
end
function [ds] = ArmDM952Glass()
    ds = Load('arm2/glass/arm_DM95_2_glass.csv',6082:48081)*1.15;
    ds = Split(ds);
end
function [ds] = ArmDM954Glass()
    ds = Load('arm2/glass/arm_DM95_4_glass.csv',7286:49285)*1.15;
    ds = Split(ds);
end
function [ds] = ArmDM851Glass()
    ds = Load('arm2/glass/arm_DM85_1_glass.csv',6466:48465)*1.15;
    ds = Split(ds);
end
function [ds] = ArmDM852Glass()
    ds = Load('arm2/glass/arm_DM85_2_glass.csv',6409:48408)*1.15;
    ds = Split(ds);
end
function [ds] = ArmDM854Glass()
    ds = Load('arm2/glass/arm_DM85_4_glass.csv',6403:48402)*1.15;
    ds = Split(ds);
end
function [ds] = ArmApencilGlass()
    ds = Load('arm2/glass/arm_apencil_glass.csv',6584:48583)*0.88;
    ds = Split(ds);
end
function [ds] = ArmM2hGlass()
    ds = Load('arm2/glass/arm_m2h_glass.csv',6078:48077);
    ds = Split(ds);
end
function [ds] = ArmMhbGlass()
    ds = Load('arm2/glass/arm_mhb_glass.csv',6346:48345);
    ds = Split(ds);
end
function [ds] = ArmMbGlass()
    ds = Load('arm2/glass/arm_mb_glass.csv',6935:48934);
    ds = Split(ds);
end
function [ds] = ArmWnylonGlass()
    ds = Load('arm2/glass/arm_wnylon_glass.csv',6184:48183);
    ds = Split(ds);
end
function [ds] = ArmWfeltGlass()
    ds = Load('arm2/glass/arm_wfelt_glass.csv',6784:48783);
    ds = Split(ds);
end
function [ds] = ArmWrubberGlass()
    ds = Load('arm2/glass/arm_wrubber_glass.csv',6558:48557);
    ds = Split(ds);
end
%% paperlike
function [ds] = ArmVero1Paperlike()
    ds = Load('arm2/paperlike/arm_vero_1_paperlike.csv',6111:48110);
    ds = Split(ds);
end
function [ds] = ArmVero2Paperlike()
    ds = Load('arm2/paperlike/arm_vero_2_paperlike.csv',6601:48600);
    ds = Split(ds);
end
function [ds] = ArmVero4Paperlike()
    ds = Load('arm2/paperlike/arm_vero_4_paperlike.csv',6534:48533);
    ds = Split(ds);
end
function [ds] = ArmDM951Paperlike()
    ds = Load('arm2/paperlike/arm_DM95_1_paperlike.csv',5916:47915);
    ds = Split(ds);
end
function [ds] = ArmDM952Paperlike()
    ds = Load('arm2/paperlike/arm_DM95_2_paperlike.csv',6057:48056);
    ds = Split(ds);
end
function [ds] = ArmDM954Paperlike()
    ds = Load('arm2/paperlike/arm_DM95_4_paperlike.csv',6588:48587);
    ds = Split(ds);
end
function [ds] = ArmDM851Paperlike()
    ds = Load('arm2/paperlike/arm_DM85_1_paperlike.csv',6101:48100);
    ds = Split(ds);
end
function [ds] = ArmDM852Paperlike()
    ds = Load('arm2/paperlike/arm_DM85_2_paperlike.csv',6314:48313);
    ds = Split(ds);
end
function [ds] = ArmDM854Paperlike()
    ds = Load('arm2/paperlike/arm_DM85_4_paperlike.csv',6013:48012);
    ds = Split(ds);
end
function [ds] = ArmWnylonPaperlike()
    ds = Load('arm2/paperlike/arm_wnylon_paperlike.csv',6356:48355);
    ds = Split(ds);
end
function [ds] = ArmWfeltPaperlike()
    ds = Load('arm2/paperlike/arm_wfelt_paperlike.csv',6263:48262);
    ds = Split(ds);
end
function [ds] = ArmWrubberPaperlike()
    ds = Load('arm2/paperlike/arm_wrubber_paperlike.csv',6439:48438);
    ds = Split(ds);
end
function [ds] = ArmM2hPaperlike()
    ds = Load('arm2/paperlike/arm_m2h_paperlike.csv',6927:48926);
    ds = Split(ds);
end
function [ds] = ArmMhbPaperlike()
    ds = Load('arm2/paperlike/arm_mhb_paperlike.csv',6555:48554);
    ds = Split(ds);
end
function [ds] = ArmMbPaperlike()
    ds = Load('arm2/paperlike/arm_mb_paperlike.csv',6059:48058);
    ds = Split(ds);
end
function [ds] = ArmApencilPaperlike()
    ds = Load('arm2/paperlike/arm_apencil_paperlike.csv',6490:48489);
    ds = Split(ds);
end
%% mixtures
function [ds] = ArmMixture1Note()
    ds = Load('arm2/mixtures/arm_DM85_75_vero_25_1_note_2.csv',7035:49034);
    ds = Split(ds);
end
function [ds] = ArmMixture2Note()
    ds = Load('arm2/mixtures/arm_DM85_50_vero_50_1_note_3.csv',6224:48223);
    ds = Split(ds);
end
function [ds] = ArmMixture3Note()
    ds = Load('arm2/mixtures/arm_DM85_25_vero_75_1_note_2.csv',5721:47720);
    ds = Split(ds);
end
function [ds] = ArmMixture4Office()
    ds = Load('arm2/mixtures/arm_DM85_75_vero_25_4_office_2.csv',6213:48212);
    ds = Split(ds);
end
function [ds] = ArmMixture5Office()
    ds = Load('arm2/mixtures/arm_DM85_50_vero_50_2_office.csv',5963:47962);
    ds = Split(ds);
end
function [ds] = ArmMixture6Office()
    ds = Load('arm2/mixtures/arm_DM85_25_vero_75_1_office_2.csv',7416:49415);
    ds = Split(ds);
end
%% protector
function [ds] = ArmVero1Protector()
    ds = Load('protector/arm_vero_1_protector.csv',5773:47772);
    ds = Split(ds);
end
function [ds] = ArmVero2Protector()
    ds = Load('protector/arm_vero_2_protector.csv',5971:47970);
    ds = Split(ds);
end
function [ds] = ArmVero4Protector()
    ds = Load('protector/arm_vero_4_protector.csv',6477:48476);
    ds = Split(ds);
end
function [ds] = ArmDM951Protector()
    ds = Load('protector/arm_DM95_1_protector.csv',5739:47738);
    ds = Split(ds);
end
function [ds] = ArmDM952Protector()
    ds = Load('protector/arm_DM95_2_protector.csv',6320:48319);
    ds = Split(ds);
end
function [ds] = ArmDM954Protector()
    ds = Load('protector/arm_DM95_4_protector.csv',5972:47971);
    ds = Split(ds);
end
function [ds] = ArmDM851Protector()
    ds = Load('protector/arm_DM85_1_protector.csv',6100:48099);
    ds = Split(ds);
end
function [ds] = ArmDM852Protector()
    ds = Load('protector/arm_DM85_2_protector.csv',6176:48175);
    ds = Split(ds);
end
function [ds] = ArmDM854Protector()
    ds = Load('protector/arm_DM85_4_protector.csv',5181:47180);
    ds = Split(ds);
end
function [ds] = ArmMicture8Protector()
    ds = Load('protector/arm_mixture_8_protector.csv',5992:47991);
    ds = Split(ds);
end
