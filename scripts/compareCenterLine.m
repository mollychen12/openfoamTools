clear
clc

mu1 = readmatrix('AnalysisMethod/centerLineVaribles/mu1.txt');
mu2 = readmatrix('AnalysisMethod/centerLineVaribles/mu2.txt');
mu3 = readmatrix('AnalysisMethod/centerLineVaribles/mu3.txt');
mu4 = readmatrix('AnalysisMethod/centerLineVaribles/mu4.txt');


P1 = readmatrix('AnalysisMethod/centerLineVaribles/P1.txt');
P2 = readmatrix('AnalysisMethod/centerLineVaribles/P2.txt');
P3 = readmatrix('AnalysisMethod/centerLineVaribles/P3.txt');
P4 = readmatrix('AnalysisMethod/centerLineVaribles/P4.txt');

U1 = readmatrix('AnalysisMethod/centerLineVaribles/U1.txt');
U2 = readmatrix('AnalysisMethod/centerLineVaribles/U2.txt');
U3 = readmatrix('AnalysisMethod/centerLineVaribles/U3.txt');
U4 = readmatrix('AnalysisMethod/centerLineVaribles/U4.txt');

figure(1)
subplot(3,1,1);
plot (mu1(:,1), mu1(:,4), 'k-','LineWidth',1.5)sed -i '1,8d' ${file}
hold on
plot (mu2(:,1), mu2(:,4), '--','Color',[0 0.4470 0.7410],'LineWidth',1.5)
hold on
plot (mu3(:,1), mu3(:,4), ':','Color',[0.8500 0.3250 0.0980],'LineWidth',1.5)
hold on
plot (mu4(:,1), mu4(:,4), '-.','Color',[0.4660 0.6740 0.1880],'LineWidth',1.5)
hold on
ylim([-0.001,0.009])
xlabel("x coordinate, m");
ylabel("turbulence viscosity coefficient \mu_t");
% title('Orifice down edge  velocity profile');
legend show

subplot(3,1,2);
plot (P1(:,1), P1(:,4), 'k-','LineWidth',1.5)
hold on
plot (P2(:,1), P2(:,4), '--','Color',[0 0.4470 0.7410],'LineWidth',1.5)
hold on
plot (P3(:,1), P3(:,4), ':','Color',[0.8500 0.3250 0.0980],'LineWidth',1.5)
hold on
plot (P4(:,1), P4(:,4), '-.','Color',[0.4660 0.6740 0.1880],'LineWidth',1.5)
hold on
% xlim([-0.5,21])
xlabel("x coordinate, m");
ylabel("flow mean pressure,Pa");

subplot(3,1,3);
plot (U1(:,1), U1(:,4), 'k-','LineWidth',1.5)
hold on
plot (U2(:,1), U2(:,4), '--','Color',[0 0.4470 0.7410],'LineWidth',1.5)
hold on
plot (U3(:,1), U3(:,4), ':','Color',[0.8500 0.3250 0.0980],'LineWidth',1.5)
hold on
plot (U4(:,1), U4(:,4), '-.','Color',[0.4660 0.6740 0.1880],'LineWidth',1.5)
hold on
% xlim([-0.5,21])
xlabel("x coordinate, m");
ylabel("flow mean velocity,m/s");

