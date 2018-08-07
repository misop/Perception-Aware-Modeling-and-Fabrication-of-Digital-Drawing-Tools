function [] = ProcessMeasurements()
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

cpn = 403.2; %force sensor counts per newton

nib_dir = 'real tools/';

files = dir(nib_dir);
fileIndex = find(~[files.isdir]);

mus = cell(length(fileIndex), 3);
figure;
hold on
fnames = cell(length(fileIndex),1);
Nplots = ceil(sqrt(length(fileIndex)));
for i = 1:length(fileIndex)
    % get info from file name    
    fileName = files(fileIndex(i)).name;
    fnames{i} = fileName;
    desc = strsplit(fileName, '_');
    desc{3} = desc{3}(1:end-1);
    d = csvread(strcat(nib_dir, fileName), 1, 1);
    F = d(5e3:20e3,3);
    mus{i, 1} = desc{1};
    mus{i, 2} = desc{2};
    mus{i, 3} = mean((F/(cpn*str2num(desc{4}))) / str2num(desc{3}));
    
    F = d(:,3) / cpn / str2num(desc{4});
    
    subplot(Nplots,Nplots,i);
    plot(linspace(0,255, length(F)),F);
    ylim([0, 1]);
    xlabel('Velocity (mm/s)');
    ylabel('Force (N)');
    title([desc{1},' ',desc{2}]);
end
hold off
legend(fnames);
title('Velocity vs. Coulomb Friction')

save('mus.mat', 'mus');
end

