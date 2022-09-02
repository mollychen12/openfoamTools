clear all
clc

phiList = [0 1 2 3 4];
freqlist = [500 1000 2000 3000 4000];
prepath = 'AnalysisMethod/';
midpath = 'phase/';
for f = freqlist   
        figure(f)
        ipath = [prepath midpath]
            i = 1
            ifile = [ipath 'f' num2str(f) '_phi' num2str(i) '.txt'];
            inputName = ['phi' num2str(i) 'freq' num2str(f)];
            inputData = readmatrix(ifile);
            pName = [inputName 'p'];
            xName = [inputName 'x'];
            x_coord = inputData(:,1);
            p_perturb = inputData(:,4);
            p_perturb_mod = zeros(size(x_coord,1),1);
            for j = 1:size(x_coord,1)
                p_perturb_mod(j,1) = abs(p_perturb(j,1));
            end
            assignin('base', xName, x_coord);
            assignin('base', pName, p_perturb_mod);
            p = plot(x_coord, p_perturb_mod,'o');
            hold on
        legend show
        xlabel ('x /m');
        ylabel ('|p''|')
        title(['freq' num2str(f) 'pressure magnitude']);
end