clear
clc
% DDES_inlet = readmatrix('OF_cwy-0230/FuqiOrifice1/inlet.csv');
DDES_up1 = readmatrix('OF_cwy-0230/FuqiOrifice1/orificeUp.csv');
DDES_down1 = readmatrix('OF_cwy-0230/FuqiOrifice1/orificeDown.csv');
DDES_downstream1 = readmatrix('OF_cwy-0230/FuqiOrifice1/downstream0.5D.csv');
DDES_downstream4D1 = readmatrix('OF_cwy-0230/FuqiOrifice1/downstream4D.csv');

% comsolKepsilon_inlet  = readmatrix('AnalysisMethod/Orifice1/cfd-uxcrossline/inlet_ux.txt');
comsolKepsilon_up1 = readmatrix('AnalysisMethod/Orifice1/cfd-uxcrossline/orificeup.txt');
comsolKepsilon_down1  = readmatrix('AnalysisMethod/Orifice1/cfd-uxcrossline/orificedown.txt');
comsolKepsilon_downstream1 = readmatrix('AnalysisMethod/Orifice1/cfd-uxcrossline/downstream.txt');
comsolKepsilon_downstream4D1 = readmatrix('AnalysisMethod/Orifice1/cfd-uxcrossline/downstream4D.txt');

DDES_up2 = readmatrix('OF_cwy-0230/FuqiOrifice4/orificeUp.csv');
DDES_down2 = readmatrix('OF_cwy-0230/FuqiOrifice4/orificeDown.csv');
DDES_downstream2 = readmatrix('OF_cwy-0230/FuqiOrifice4/downstream0.5D.csv');
DDES_downstream4D2 = readmatrix('OF_cwy-0230/FuqiOrifice4/downstream4D.csv');

comsolKepsilon_up2 = readmatrix('AnalysisMethod/Orifice4/cfd-uxcrossline/orificeup.txt');
comsolKepsilon_down2  = readmatrix('AnalysisMethod/Orifice4/cfd-uxcrossline/orificedown.txt');
comsolKepsilon_downstream2 = readmatrix('AnalysisMethod/Orifice4/cfd-uxcrossline/downstream.txt');
comsolKepsilon_downstream4D2 = readmatrix('AnalysisMethod/Orifice4/cfd-uxcrossline/downstream4D.txt');

DDES_up3 = readmatrix('OF_cwy-0230/FuqiOrifice5/orificeUp.csv');
DDES_down3 = readmatrix('OF_cwy-0230/FuqiOrifice5/orificeDown.csv');
DDES_downstream3 = readmatrix('OF_cwy-0230/FuqiOrifice5/downstream0.5D.csv');
DDES_downstream4D3 = readmatrix('OF_cwy-0230/FuqiOrifice5/downstream4D.csv');

comsolKepsilon_up3 = readmatrix('AnalysisMethod/Orifice5/cfd-uxcrossline/orificeup.txt');
comsolKepsilon_down3  = readmatrix('AnalysisMethod/Orifice5/cfd-uxcrossline/orificedown.txt');
comsolKepsilon_downstream3 = readmatrix('AnalysisMethod/Orifice5/cfd-uxcrossline/downstream.txt');
comsolKepsilon_downstream4D3 = readmatrix('AnalysisMethod/Orifice5/cfd-uxcrossline/downstream4D.txt');

DDES_up4 = readmatrix('OF_cwy-0230/FuqiOrifice6/orificeUp.csv');
DDES_down4 = readmatrix('OF_cwy-0230/FuqiOrifice6/orificeDown.csv');
DDES_downstream4 = readmatrix('OF_cwy-0230/FuqiOrifice6/downstream0.5D.csv');
DDES_downstream4D4 = readmatrix('OF_cwy-0230/FuqiOrifice6/downstream4D.csv');

comsolKepsilon_up4 = readmatrix('AnalysisMethod/Orifice6/cfd-uxcrossline/orificeup.txt');
comsolKepsilon_down4  = readmatrix('AnalysisMethod/Orifice6/cfd-uxcrossline/orificedown.txt');
comsolKepsilon_downstream4 = readmatrix('AnalysisMethod/Orifice6/cfd-uxcrossline/downstream.txt');
comsolKepsilon_downstream4D4 = readmatrix('AnalysisMethod/Orifice6/cfd-uxcrossline/downstream4D.txt');

R = 0.025;
% figure(1)
% plot (DDES_inlet(:,5), DDES_inlet(:,21)/R, 'k-','LineWidth',1.5)
% hold on
% %- col 5 is ma0.01;col4 is ma0.00817 
% plot (comsolKepsilon_inlet(:,4), (comsolKepsilon_inlet(:,2)-R)/R, 'ro','LineWidth',1.5) 
% xlabel("Axial velocity, m/s");
% ylabel("r/R");
% legend show
% title('Inlet');

% figure(2)
% plot (DDES_up1(:,5), DDES_up1(:,21)/R,'-','Color',[0 0 0],'LineWidth',1.5)
% hold on
% plot (comsolKepsilon_up1(:,4), (comsolKepsilon_up1(:,2)-R)/R, 'ko','LineWidth',1.5)
% hold on
% plot (DDES_up2(:,5), DDES_up2(:,21)/R, '--','Color',[0 0.4470 0.7410],'LineWidth',1.5);
% hold on
% plot (comsolKepsilon_up2(:,4), (comsolKepsilon_up2(:,2)-R)/R, '^','Color',[0 0.4470 0.7410],'LineWidth',1.5)
% hold on
% plot (DDES_up3(:,5), DDES_up3(:,21)/R, ':','Color',[0.8500 0.3250 0.0980],'LineWidth',1.5);
% hold on
% plot (comsolKepsilon_up3(:,4), (comsolKepsilon_up3(:,2)-R)/R, 's','Color',[0.8500 0.3250 0.0980],'LineWidth',1.5)
% hold on
% plot (DDES_up4(:,5), DDES_up4(:,21)/R, '-.','Color',[0.4660 0.6740 0.1880],'LineWidth',1.5);
% hold on
% plot (comsolKepsilon_up4(:,4), (comsolKepsilon_up4(:,2)-R)/R, '+','Color',[0.4660 0.6740 0.1880],'LineWidth',1.5)
% xlabel("Axial velocity, m/s");
% ylabel("r/R");
% legend show
% xlim([0,18])
% title('Orifice upstream edge');
% 
figure(3)
plot (DDES_down1(:,5), DDES_down1(:,21)/R, 'k-','LineWidth',1.5)
hold on
plot (comsolKepsilon_down1(:,4), (comsolKepsilon_down1(:,2)-R)/R, 'ko','LineWidth',1.5)
hold on
plot (DDES_down2(:,5), DDES_down2(:,21)/R, '--','Color',[0 0.4470 0.7410],'LineWidth',1.5)
hold on
plot (comsolKepsilon_down2(:,4), (comsolKepsilon_down2(:,2)-R)/R, '^','Color',[0 0.4470 0.7410],'LineWidth',1.5)
hold on
plot (DDES_down3(:,5), DDES_down3(:,21)/R, ':','Color',[0.8500 0.3250 0.0980],'LineWidth',1.5)
hold on
plot (comsolKepsilon_down3(:,4), (comsolKepsilon_down3(:,2)-R)/R, 's','Color',[0.8500 0.3250 0.0980],'LineWidth',1.5)
hold on
plot (DDES_down4(:,5), DDES_down4(:,21)/R, '-.','Color',[0.4660 0.6740 0.1880],'LineWidth',1.5)
hold on
plot (comsolKepsilon_down4(:,4), (comsolKepsilon_down4(:,2)-R)/R, '+','Color',[0.4660 0.6740 0.1880],'LineWidth',1.5)
xlim([-0.5,21])
xlabel("Axial velocity, m/s");
ylabel("r/R");
title('Orifice down edge  velocity profile');

% figure(4)
% plot (DDES_downstream1(:,5), DDES_downstream1(:,21)/R, 'k-','LineWidth',1.5)
% hold on
% plot (comsolKepsilon_downstream1(:,4), (comsolKepsilon_downstream1(:,2)-R)/R, 'ko','LineWidth',1.5)
% hold on
% plot (DDES_downstream2(:,5), DDES_downstream2(:,21)/R, '--','Color',[0 0.4470 0.7410],'LineWidth',1.5)
% hold on
% plot (comsolKepsilon_downstream2(:,4), (comsolKepsilon_downstream2(:,2)-R)/R, '^','Color',[0 0.4470 0.7410],'LineWidth',1.5)
% hold on
% plot (DDES_downstream3(:,5), DDES_downstream3(:,21)/R, ':','Color',[0.8500 0.3250 0.0980],'LineWidth',1.5)
% hold on
% plot (comsolKepsilon_downstream3(:,4), (comsolKepsilon_downstream3(:,2)-R)/R, 's','Color',[0.8500 0.3250 0.0980],'LineWidth',1.5)
% hold on
% plot (DDES_downstream4(:,5), DDES_downstream4(:,21)/R, '-.','Color',[0.4660 0.6740 0.1880],'LineWidth',1.5)
% hold on
% plot (comsolKepsilon_downstream4(:,4), (comsolKepsilon_downstream4(:,2)-R)/R, '+','Color',[0.4660 0.6740 0.1880],'LineWidth',1.5)
% xlabel("Axial velocity, m/s");
% ylabel("r/R");
% xlim([-3,20])
% % legend show
% title('Downstream distance=0.025m');
% % 
% figure(5)
% plot (DDES_downstream4D1(:,5), DDES_downstream4D1(:,21)/R, 'k-','LineWidth',1.5)
% hold on
% plot (comsolKepsilon_downstream4D1(:,4), (comsolKepsilon_downstream4D1(:,2)-R)/R, 'ko','LineWidth',1.5)
% hold on
% plot (DDES_downstream4D2(:,5), DDES_downstream4D2(:,21)/R, '--','Color',[0 0.4470 0.7410],'LineWidth',1.5)
% hold on
% plot (comsolKepsilon_downstream4D2(:,4), (comsolKepsilon_downstream4D2(:,2)-R)/R, '^','Color',[0 0.4470 0.7410],'LineWidth',1.5)
% hold on
% plot (DDES_downstream4D3(:,5), DDES_downstream4D3(:,21)/R, ':','Color',[0.8500 0.3250 0.0980],'LineWidth',1.5)
% hold on
% plot (comsolKepsilon_downstream4D3(:,4), (comsolKepsilon_downstream4D3(:,2)-R)/R, 's','Color',[0.8500 0.3250 0.0980],'LineWidth',1.5)
% hold on
% plot (DDES_downstream4D4(:,5), DDES_downstream4D4(:,21)/R, '-.','Color',[0.4660 0.6740 0.1880],'LineWidth',1.5)
% hold on
% plot (comsolKepsilon_downstream4D4(:,4), (comsolKepsilon_downstream4D4(:,2)-R)/R, '+','Color',[0.4660 0.6740 0.1880],'LineWidth',1.5)
% xlabel("Axial velocity, m/s");
% ylabel("r/R");
% % legend show
% title('Downstream distance=0.2m');

% figure(5)
% plot (DDES(:,5), DDES(:,21)/R, 'k-','LineWidth',1.5)
% hold on
% plot (comsolKepsilon2(:,4), (comsolKepsilon2(:,2)-R)/R, 'ro','LineWidth',1.5)
% xlabel("Axial velocity, m/s");
% ylabel("r/R");
% legend show
% title('DownStream D = 0.025m');
% 
% figure(6)
% plot (DDES_inlet(:,5), DDES_inlet(:,22)/R, 'k-','LineWidth',1.5)
% hold on
% plot (comsolKepsilon_inlet2(:,4), (comsolKepsilon_inlet2(:,2)-R)/R, 'ro','LineWidth',1.5)
% xlabel("Axial velocity, m/s");
% ylabel("r/R");
% legend show
% title('Inlet');

