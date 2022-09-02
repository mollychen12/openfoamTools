clear all
clc
nOrifice = 1;
freq = 200;
c0 = 343.2;
rho0 = 1.19;
Ma = 0.00817;
oriList = [1 4 5 6];
freqlist = [200 500 1000 1500 2000 3000 4000];
prepath = 'AnalysisMethod/';
midpath = '/pdecompose-xline/';
for f = freqlist   
    for i = oriList
        figure(f+i)
        inputName = ['Orifice' num2str(i) 'freq' num2str(f)];
        pnName = [inputName 'pneg'];
        ppName = [inputName 'ppos'];
        pName = [inputName 'p'];
        uName = [inputName 'u'];
        xName = [inputName 'x'];
        ipath = [prepath 'Orifice' num2str(i) midpath];
        ifile = [ipath 'Lsrc_xline_f' num2str(f) '.txt'];
        inputData = readmatrix(ifile);
        x_coord = inputData(:,1);
        p_perturb = inputData(:,4);
        u_perturb = inputData(:,5);
        p_positive = 0.5 * (p_perturb + rho0*c0*u_perturb);
        p_negative = 0.5 * (p_perturb - rho0*c0*u_perturb);

        p_perturb_mod = zeros(size(x_coord,1),1);
        p_negative_mod = zeros(size(x_coord,1),1);
        p_positive_mod  = zeros(size(x_coord,1),1);
        for j = 1:size(x_coord,1)
            p_perturb_mod(j,1) = abs(p_perturb(j,1));
            p_negative_mod(j,1) = abs(p_negative(j,1));
            p_positive_mod(j,1) = abs(p_positive(j,1));
        end
%         assignin('base', xName, x_coord);
%         assignin('base', pName, p_perturb_mod);
%         assignin('base',pnName, p_negative_mod);
%         assignin('base', ppName, p_positive_mod);
    p1 = plot (x_coord, p_perturb_mod,'+');
    hold on
    p2 = plot (x_coord, p_positive_mod,'s');
    hold on
    p3 = plot (x_coord, p_negative_mod,'^');
    hold on    
    lgdstr = {'|p''|','|p+''|', '|p-''|'};
    legend([p1,p2,p3],lgdstr,'location','best');
    xlabel ('x /m');
    ylabel ('|p''|')
    title(['freq' num2str(f) 'orifice' num2str(i) 'pressure decomposition']);
    end
end

% figure(1)
% plot (Orifice1freq1000x,Orifice1freq1000p,'o');
% hold on
% plot (Orifice1freq1000x,Orifice1freq1000ppos,'+');
% hold on
% plot (Orifice1freq1000x,Orifice1freq1000pneg,'s');




