function [] = ProcessVibrations()
    load('processed.mat');
    names = {'pen', 'p2h', 'p8b', 'fine', 'charc', 'cryon', 'stab'};
    papers = {'office','note','stone'};
    vibs = cell(0,0);
    for i=1:numel(names)
        for j=1:numel(papers)
            ds = map('arm', names{i}, papers{j}, 'b2');
            vibs{end+1,1} = names{i};
            vibs{end,2} = papers{j};
            vibs{end,3}=zeros(6,500);
            for k=1:6
                vibs{end,3}(k,:) = interp1(ds{2}, ds{1}(k,:), 1:500, 'linear', 'extrap');
            end
        end
    end
    names = {'vero', 'DM95', 'DM85', 'teflon'};
    tips = {'1', '2', '4'};
    papers = {'office','note','stone'};
    for i=1:numel(names)
        for j=1:numel(tips)
            for k=1:numel(papers)
                ds = map('arm', 'plain', names{i}, tips{j}, papers{k}, 'b2');
                vibs{end+1,1} = [names{i},tips{j}];
                vibs{end,2} = papers{k};
                vibs{end,3}=zeros(6,500);
                for l=1:6
                    vibs{end,3}(l,:) = interp1(ds{2}, ds{1}(l,:), 1:500, 'linear', 'extrap');
                end
            end
        end
    end
    names = {'apencil', 'm2h', 'mhb', 'mb', 'wnylon', 'wfelt', 'wrubber'};
    papers = {'glass', 'paperlike'};
    for i=1:numel(names)
        for j=1:numel(papers)
            ds = map('arm', names{i}, papers{j}, 'b2');
            vibs{end+1,1} = names{i};
            vibs{end,2} = papers{j};
            vibs{end,3}=zeros(6,500);
            for k=1:6
                vibs{end,3}(k,:) = interp1(ds{2}, ds{1}(k,:), 1:500, 'linear', 'extrap');
            end
        end
    end
    names = {'vero', 'DM95', 'DM85'};
    tips = {'1', '2', '4'};
    papers = {'glass', 'paperlike', 'protector', 'laser'};
    for i=1:numel(names)
        for j=1:numel(tips)
            for k=1:numel(papers)
                ds = map('arm', 'plain', names{i}, tips{j}, papers{k}, 'b2');
                vibs{end+1,1} = [names{i},tips{j}];
                vibs{end,2} = papers{k};
                vibs{end,3}=zeros(6,500);
                for l=1:6
                    vibs{end,3}(l,:) = interp1(ds{2}, ds{1}(l,:), 1:500, 'linear', 'extrap');
                end
            end
        end
    end
    save('descriptor_vibation.mat', 'vibs');
end