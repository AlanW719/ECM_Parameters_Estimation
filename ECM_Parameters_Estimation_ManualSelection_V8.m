clc;clear;close all;
addpath(genpath('D:\MATLAB_Functions'));
set(0,'defaulttextinterpreter','latex');
load('EIS_Test_allData.mat');
%% Nyquist Plot - LG
figure;
subplot(2,4,1)
Nyquist_plot(EISData_LG01_Dis,'LG01',0);
subplot(2,4,5)
Nyquist_plot(EISData_LG01_Cha,'LG01',1);

subplot(2,4,2)
Nyquist_plot(EISData_LG02_Dis,'LG02',0);
subplot(2,4,6)
Nyquist_plot(EISData_LG02_Cha,'LG02',1);

subplot(2,4,3)
Nyquist_plot(EISData_LG03_Dis,'LG03',0);
subplot(2,4,7)
Nyquist_plot(EISData_LG03_Cha,'LG03',1);

subplot(2,4,4)
Nyquist_plot(EISData_LG04_Dis,'LG04',0);
subplot(2,4,8)
Nyquist_plot(EISData_LG04_Cha,'LG04',1);

%% Nyquist Plot - Molicel
figure;
subplot(2,4,1)
Nyquist_plot(EISData_MCL01_Dis,'MCL01',0);
subplot(2,4,5)
Nyquist_plot(EISData_MCL01_Cha,'MCL01',1);

subplot(2,4,2)
Nyquist_plot(EISData_MCL02_Dis,'MCL02',0);
subplot(2,4,6)
Nyquist_plot(EISData_MCL02_Cha,'MCL02',1);

subplot(2,4,3)
Nyquist_plot(EISData_MCL03_Dis,'MCL03',0);
subplot(2,4,7)
Nyquist_plot(EISData_MCL03_Cha,'MCL03',1);

subplot(2,4,4)
Nyquist_plot(EISData_MCL04_Dis,'MCL04',0);
subplot(2,4,8)
Nyquist_plot(EISData_MCL04_Cha,'MCL04',1);

%% Plot Resistance vs. SOC
% lgnd_LG = {'LG01(Estimation)','LG01(Measured by Arbin)',...
%     'LG02(Estimation)','LG02(Measured by Arbin)',...
%     'LG03(Estimation)','LG03(Measured by Arbin)',...
%     'LG04(Estimation)','LG04(Measured by Arbin)'};
% lgnd_MCL = {'MCL01(Estimation)','MCL01(Measured by Arbin)'...
%     'MCL02(Estimation)','MCL02(Measured by Arbin)'...
%     'MCL03(Estimation)','MCL03(Measured by Arbin)'...
%     'MCL04(Estimation)','MCL04(Measured by Arbin)'};
lgnd_LG = {'LG01','LG02','LG03','LG04'};
lgnd_MCL = {'MCL01','MCL02','MCL03','MCL04'};
figure;
subplot(2,1,1)
R0_LG01 = RvsSOC(Data_LG01_Dis,Data_LG01_Cha);
R0_LG02 = RvsSOC(Data_LG02_Dis,Data_LG02_Cha);
R0_LG03 = RvsSOC(Data_LG03_Dis,Data_LG03_Cha);
R0_LG04 = RvsSOC(Data_LG04_Dis,Data_LG04_Cha);
lgds1 = legend(lgnd_LG,'Location','eastoutside');
lgds1.FontSize = 10;
lgds1.ItemTokenSize = [10,1];
title({'Eestimated Internal resistance $R_0$ at each SOC';...
    'when discharging {\bfseries LG batteries} from 100\% to 0\% and then charging from 0\% to 100\%'},...
    'Interpreter', 'latex');

subplot(2,1,2)
R0_MCL01 = RvsSOC(Data_MCL01_Dis,Data_MCL01_Cha);
R0_MCL02 = RvsSOC(Data_MCL02_Dis,Data_MCL02_Cha);
R0_MCL03 = RvsSOC(Data_MCL03_Dis,Data_MCL03_Cha);
R0_MCL04 = RvsSOC(Data_MCL04_Dis,Data_MCL04_Cha);
lgds2 = legend(lgnd_MCL,'Location','eastoutside');
lgds2.FontSize = 10;
lgds2.ItemTokenSize = [10,1];
title({'Estimated Internal resistance $R_0$ at each SOC';...
    'when discharging {\bfseries Molicel batteries} from 100\% to 0\% and then charging from 0\% to 100\%'},...
    'Interpreter', 'latex');


%% EIS Parameters
ECM_Paras_LG01_Dis = ECM_Est_NLS_Approach(EISData_LG01_Dis);
ECM_Paras_LG02_Dis = ECM_Est_NLS_Approach(EISData_LG02_Dis);
ECM_Paras_LG03_Dis = ECM_Est_NLS_Approach(EISData_LG03_Dis);
ECM_Paras_LG04_Dis = ECM_Est_NLS_Approach(EISData_LG04_Dis);

ECM_Paras_LG01_Cha = ECM_Est_NLS_Approach(EISData_LG01_Cha);
ECM_Paras_LG02_Cha = ECM_Est_NLS_Approach(EISData_LG02_Cha);
ECM_Paras_LG03_Cha = ECM_Est_NLS_Approach(EISData_LG03_Cha);
ECM_Paras_LG04_Cha = ECM_Est_NLS_Approach(EISData_LG04_Cha);

ECM_Paras_MCL01_Dis = ECM_Est_NLS_Approach(EISData_MCL01_Dis);
ECM_Paras_MCL02_Dis = ECM_Est_NLS_Approach(EISData_MCL02_Dis);
ECM_Paras_MCL03_Dis = ECM_Est_NLS_Approach(EISData_MCL03_Dis);
ECM_Paras_MCL04_Dis = ECM_Est_NLS_Approach(EISData_MCL04_Dis);

ECM_Paras_MCL01_Cha = ECM_Est_NLS_Approach(EISData_MCL01_Cha);
ECM_Paras_MCL02_Cha = ECM_Est_NLS_Approach(EISData_MCL02_Cha);
ECM_Paras_MCL03_Cha = ECM_Est_NLS_Approach(EISData_MCL03_Cha);
ECM_Paras_MCL04_Cha = ECM_Est_NLS_Approach(EISData_MCL04_Cha);

%% Tabulate Parameters
TabulateParas(ECM_Paras_LG01_Dis,0,'LG01');
TabulateParas(ECM_Paras_LG02_Dis,0,'LG02');
TabulateParas(ECM_Paras_LG03_Dis,0,'LG03');
TabulateParas(ECM_Paras_LG04_Dis,0,'LG04');

TabulateParas(ECM_Paras_LG01_Cha,1,'LG01');
TabulateParas(ECM_Paras_LG02_Cha,1,'LG02');
TabulateParas(ECM_Paras_LG03_Cha,1,'LG03');
TabulateParas(ECM_Paras_LG04_Cha,1,'LG04');

TabulateParas(ECM_Paras_MCL01_Dis,0,'MCL01');
TabulateParas(ECM_Paras_MCL02_Dis,0,'MCL02');
TabulateParas(ECM_Paras_MCL03_Dis,0,'MCL03');
TabulateParas(ECM_Paras_MCL04_Dis,0,'MCL04');

TabulateParas(ECM_Paras_MCL01_Cha,1,'MCL01');
TabulateParas(ECM_Paras_MCL02_Cha,1,'MCL02');
TabulateParas(ECM_Paras_MCL03_Cha,1,'MCL03');
TabulateParas(ECM_Paras_MCL04_Cha,1,'MCL04');

%% Plot R and R_Ohm+R_SEI+R_CT VS. SOC
% LG
figure;
subplot(4,2,1);
plotRvsSOC(R0_LG01,ECM_Paras_LG01_Dis,0,'LG01');
subplot(4,2,3);
plotRvsSOC(R0_LG02,ECM_Paras_LG02_Dis,0,'LG02');
subplot(4,2,5);
plotRvsSOC(R0_LG03,ECM_Paras_LG03_Dis,0,'LG03');
subplot(4,2,7);
plotRvsSOC(R0_LG04,ECM_Paras_LG04_Dis,0,'LG04');

subplot(4,2,2);
plotRvsSOC(R0_LG01,ECM_Paras_LG01_Cha,1,'LG01');
subplot(4,2,4);
plotRvsSOC(R0_LG02,ECM_Paras_LG02_Cha,1,'LG02');
subplot(4,2,6);
plotRvsSOC(R0_LG03,ECM_Paras_LG03_Cha,1,'LG03');
subplot(4,2,8);
plotRvsSOC(R0_LG04,ECM_Paras_LG04_Cha,1,'LG04');
% Molicel
figure;
subplot(4,2,1);
plotRvsSOC(R0_MCL01,ECM_Paras_MCL01_Dis,0,'MCL01');
subplot(4,2,3);
plotRvsSOC(R0_MCL02,ECM_Paras_MCL02_Dis,0,'MCL02');
subplot(4,2,5);
plotRvsSOC(R0_MCL03,ECM_Paras_MCL03_Dis,0,'MCL03');
subplot(4,2,7);
plotRvsSOC(R0_MCL04,ECM_Paras_MCL04_Dis,0,'MCL04');

subplot(4,2,2);
plotRvsSOC(R0_MCL01,ECM_Paras_MCL01_Cha,1,'MCL01');
subplot(4,2,4);
plotRvsSOC(R0_MCL02,ECM_Paras_MCL02_Cha,1,'MCL02');
subplot(4,2,6);
plotRvsSOC(R0_MCL03,ECM_Paras_MCL03_Cha,1,'MCL03');
subplot(4,2,8);
plotRvsSOC(R0_MCL04,ECM_Paras_MCL04_Cha,1,'MCL04');

%% Plot Resistance Error(%) VS. SOC
% LG
figure;
subplot(2,2,1);
plotErrorvsSOC(R0_LG01,ECM_Paras_LG01_Dis,0,'LG');
plotErrorvsSOC(R0_LG02,ECM_Paras_LG02_Dis,0,'LG');
plotErrorvsSOC(R0_LG03,ECM_Paras_LG03_Dis,0,'LG');
plotErrorvsSOC(R0_LG04,ECM_Paras_LG04_Dis,0,'LG');
legend(lgnd_LG);
subplot(2,2,2);
plotErrorvsSOC(R0_LG01,ECM_Paras_LG01_Cha,1,'LG');
plotErrorvsSOC(R0_LG02,ECM_Paras_LG02_Cha,1,'LG');
plotErrorvsSOC(R0_LG03,ECM_Paras_LG03_Cha,1,'LG');
plotErrorvsSOC(R0_LG04,ECM_Paras_LG04_Cha,1,'LG');
legend(lgnd_LG);

% Molicel
subplot(2,2,3);
plotErrorvsSOC(R0_MCL01,ECM_Paras_MCL01_Dis,0,'Molicel');
plotErrorvsSOC(R0_MCL02,ECM_Paras_MCL02_Dis,0,'Molicel');
plotErrorvsSOC(R0_MCL03,ECM_Paras_MCL03_Dis,0,'Molicel');
plotErrorvsSOC(R0_MCL04,ECM_Paras_MCL04_Dis,0,'Molicel');
legend(lgnd_MCL);
subplot(2,2,4);
plotErrorvsSOC(R0_MCL01,ECM_Paras_MCL01_Cha,1,'Molicel');
plotErrorvsSOC(R0_MCL02,ECM_Paras_MCL02_Cha,1,'Molicel');
plotErrorvsSOC(R0_MCL03,ECM_Paras_MCL03_Cha,1,'Molicel');
plotErrorvsSOC(R0_MCL04,ECM_Paras_MCL04_Cha,1,'Molicel');
legend(lgnd_MCL);

%% Box plots
ylab = {'$$R_{\Omega}(m \Omega)$$',...
    'L (nH)',...
    '$$R_{SEI}(m \Omega)$$',...
    '$$C_{SEI}(F)$$',...
    '$$R_{CT}(m \Omega)$$',...
    '$$C_{DL}(F)$$',...
    '$$\sigma\left(\times 10^{-3}\right)$$'};
paraLab = {'$$R_{\Omega}$$',...
    'L',...
    '$$R_{SEI}$$',...
    '$$C_{SEI}$$',...
    '$$R_{CT}$$',...
    '$$C_{DL}$$',...
    '$$\sigma$$'};

% % R_Ohm
figure;
subplot(2,2,1)
boxplt_RvsBattery(ECM_Paras_LG01_Dis,ECM_Paras_LG01_Cha,...
    ECM_Paras_LG02_Dis,ECM_Paras_LG02_Cha,...
    ECM_Paras_LG03_Dis,ECM_Paras_LG03_Cha,...
    ECM_Paras_LG04_Dis,ECM_Paras_LG04_Cha,'LG',ylab(1),paraLab(1),1)

subplot(2,2,2)
boxplt_RvsSOC(ECM_Paras_LG01_Dis,ECM_Paras_LG01_Cha,...
    ECM_Paras_LG02_Dis,ECM_Paras_LG02_Cha,...
    ECM_Paras_LG03_Dis,ECM_Paras_LG03_Cha,...
    ECM_Paras_LG04_Dis,ECM_Paras_LG04_Cha,'LG',ylab(1),paraLab(1),1);

subplot(2,2,3)
boxplt_RvsBattery(ECM_Paras_MCL01_Dis,ECM_Paras_MCL01_Cha,...
    ECM_Paras_MCL02_Dis,ECM_Paras_MCL02_Cha,...
    ECM_Paras_MCL03_Dis,ECM_Paras_MCL03_Cha,...
    ECM_Paras_MCL04_Dis,ECM_Paras_MCL04_Cha,'Molicel',ylab(1),paraLab(1),1)
subplot(2,2,4)
boxplt_RvsSOC(ECM_Paras_MCL01_Dis,ECM_Paras_MCL01_Cha,...
    ECM_Paras_MCL02_Dis,ECM_Paras_MCL02_Cha,...
    ECM_Paras_MCL03_Dis,ECM_Paras_MCL03_Cha,...
    ECM_Paras_MCL04_Dis,ECM_Paras_MCL04_Cha,'Molicel',ylab(1),paraLab(1),1);

% L
figure;
subplot(2,2,1)
boxplt_RvsBattery(ECM_Paras_LG01_Dis,ECM_Paras_LG01_Cha,...
    ECM_Paras_LG02_Dis,ECM_Paras_LG02_Cha,...
    ECM_Paras_LG03_Dis,ECM_Paras_LG03_Cha,...
    ECM_Paras_LG04_Dis,ECM_Paras_LG04_Cha,'LG',ylab(2),paraLab(2),2)

subplot(2,2,2)
boxplt_RvsSOC(ECM_Paras_LG01_Dis,ECM_Paras_LG01_Cha,...
    ECM_Paras_LG02_Dis,ECM_Paras_LG02_Cha,...
    ECM_Paras_LG03_Dis,ECM_Paras_LG03_Cha,...
    ECM_Paras_LG04_Dis,ECM_Paras_LG04_Cha,'LG',ylab(2),paraLab(2),2);

subplot(2,2,3)
boxplt_RvsBattery(ECM_Paras_MCL01_Dis,ECM_Paras_MCL01_Cha,...
    ECM_Paras_MCL02_Dis,ECM_Paras_MCL02_Cha,...
    ECM_Paras_MCL03_Dis,ECM_Paras_MCL03_Cha,...
    ECM_Paras_MCL04_Dis,ECM_Paras_MCL04_Cha,'Molicel',ylab(2),paraLab(2),2)
subplot(2,2,4)
boxplt_RvsSOC(ECM_Paras_MCL01_Dis,ECM_Paras_MCL01_Cha,...
    ECM_Paras_MCL02_Dis,ECM_Paras_MCL02_Cha,...
    ECM_Paras_MCL03_Dis,ECM_Paras_MCL03_Cha,...
    ECM_Paras_MCL04_Dis,ECM_Paras_MCL04_Cha,'Molicel',ylab(2),paraLab(2),2);

% R_SEI
figure;
subplot(2,2,1)
boxplt_RvsBattery(ECM_Paras_LG01_Dis,ECM_Paras_LG01_Cha,...
    ECM_Paras_LG02_Dis,ECM_Paras_LG02_Cha,...
    ECM_Paras_LG03_Dis,ECM_Paras_LG03_Cha,...
    ECM_Paras_LG04_Dis,ECM_Paras_LG04_Cha,'LG',ylab(3),paraLab(3),3)

subplot(2,2,2)
boxplt_RvsSOC(ECM_Paras_LG01_Dis,ECM_Paras_LG01_Cha,...
    ECM_Paras_LG02_Dis,ECM_Paras_LG02_Cha,...
    ECM_Paras_LG03_Dis,ECM_Paras_LG03_Cha,...
    ECM_Paras_LG04_Dis,ECM_Paras_LG04_Cha,'LG',ylab(3),paraLab(3),3);

subplot(2,2,3)
boxplt_RvsBattery(ECM_Paras_MCL01_Dis,ECM_Paras_MCL01_Cha,...
    ECM_Paras_MCL02_Dis,ECM_Paras_MCL02_Cha,...
    ECM_Paras_MCL03_Dis,ECM_Paras_MCL03_Cha,...
    ECM_Paras_MCL04_Dis,ECM_Paras_MCL04_Cha,'Molicel',ylab(3),paraLab(3),3)
subplot(2,2,4)
boxplt_RvsSOC(ECM_Paras_MCL01_Dis,ECM_Paras_MCL01_Cha,...
    ECM_Paras_MCL02_Dis,ECM_Paras_MCL02_Cha,...
    ECM_Paras_MCL03_Dis,ECM_Paras_MCL03_Cha,...
    ECM_Paras_MCL04_Dis,ECM_Paras_MCL04_Cha,'Molicel',ylab(3),paraLab(3),3);

% C_SEI
figure;
subplot(2,2,1)
boxplt_RvsBattery(ECM_Paras_LG01_Dis,ECM_Paras_LG01_Cha,...
    ECM_Paras_LG02_Dis,ECM_Paras_LG02_Cha,...
    ECM_Paras_LG03_Dis,ECM_Paras_LG03_Cha,...
    ECM_Paras_LG04_Dis,ECM_Paras_LG04_Cha,'LG',ylab(4),paraLab(4),4)

subplot(2,2,2)
boxplt_RvsSOC(ECM_Paras_LG01_Dis,ECM_Paras_LG01_Cha,...
    ECM_Paras_LG02_Dis,ECM_Paras_LG02_Cha,...
    ECM_Paras_LG03_Dis,ECM_Paras_LG03_Cha,...
    ECM_Paras_LG04_Dis,ECM_Paras_LG04_Cha,'LG',ylab(4),paraLab(4),4);

subplot(2,2,3)
boxplt_RvsBattery(ECM_Paras_MCL01_Dis,ECM_Paras_MCL01_Cha,...
    ECM_Paras_MCL02_Dis,ECM_Paras_MCL02_Cha,...
    ECM_Paras_MCL03_Dis,ECM_Paras_MCL03_Cha,...
    ECM_Paras_MCL04_Dis,ECM_Paras_MCL04_Cha,'Molicel',ylab(4),paraLab(4),4)
subplot(2,2,4)
boxplt_RvsSOC(ECM_Paras_MCL01_Dis,ECM_Paras_MCL01_Cha,...
    ECM_Paras_MCL02_Dis,ECM_Paras_MCL02_Cha,...
    ECM_Paras_MCL03_Dis,ECM_Paras_MCL03_Cha,...
    ECM_Paras_MCL04_Dis,ECM_Paras_MCL04_Cha,'Molicel',ylab(4),paraLab(4),4);

% R_CT
figure;
subplot(2,2,1)
boxplt_RvsBattery(ECM_Paras_LG01_Dis,ECM_Paras_LG01_Cha,...
    ECM_Paras_LG02_Dis,ECM_Paras_LG02_Cha,...
    ECM_Paras_LG03_Dis,ECM_Paras_LG03_Cha,...
    ECM_Paras_LG04_Dis,ECM_Paras_LG04_Cha,'LG',ylab(5),paraLab(5),5)

subplot(2,2,2)
boxplt_RvsSOC(ECM_Paras_LG01_Dis,ECM_Paras_LG01_Cha,...
    ECM_Paras_LG02_Dis,ECM_Paras_LG02_Cha,...
    ECM_Paras_LG03_Dis,ECM_Paras_LG03_Cha,...
    ECM_Paras_LG04_Dis,ECM_Paras_LG04_Cha,'LG',ylab(5),paraLab(5),5);

subplot(2,2,3)
boxplt_RvsBattery(ECM_Paras_MCL01_Dis,ECM_Paras_MCL01_Cha,...
    ECM_Paras_MCL02_Dis,ECM_Paras_MCL02_Cha,...
    ECM_Paras_MCL03_Dis,ECM_Paras_MCL03_Cha,...
    ECM_Paras_MCL04_Dis,ECM_Paras_MCL04_Cha,'Molicel',ylab(5),paraLab(5),5)
subplot(2,2,4)
boxplt_RvsSOC(ECM_Paras_MCL01_Dis,ECM_Paras_MCL01_Cha,...
    ECM_Paras_MCL02_Dis,ECM_Paras_MCL02_Cha,...
    ECM_Paras_MCL03_Dis,ECM_Paras_MCL03_Cha,...
    ECM_Paras_MCL04_Dis,ECM_Paras_MCL04_Cha,'Molicel',ylab(5),paraLab(5),5);

% C_DL
figure;
subplot(2,2,1)
boxplt_RvsBattery(ECM_Paras_LG01_Dis,ECM_Paras_LG01_Cha,...
    ECM_Paras_LG02_Dis,ECM_Paras_LG02_Cha,...
    ECM_Paras_LG03_Dis,ECM_Paras_LG03_Cha,...
    ECM_Paras_LG04_Dis,ECM_Paras_LG04_Cha,'LG',ylab(6),paraLab(6),6)

subplot(2,2,2)
boxplt_RvsSOC(ECM_Paras_LG01_Dis,ECM_Paras_LG01_Cha,...
    ECM_Paras_LG02_Dis,ECM_Paras_LG02_Cha,...
    ECM_Paras_LG03_Dis,ECM_Paras_LG03_Cha,...
    ECM_Paras_LG04_Dis,ECM_Paras_LG04_Cha,'LG',ylab(6),paraLab(6),6);

subplot(2,2,3)
boxplt_RvsBattery(ECM_Paras_MCL01_Dis,ECM_Paras_MCL01_Cha,...
    ECM_Paras_MCL02_Dis,ECM_Paras_MCL02_Cha,...
    ECM_Paras_MCL03_Dis,ECM_Paras_MCL03_Cha,...
    ECM_Paras_MCL04_Dis,ECM_Paras_MCL04_Cha,'Molicel',ylab(6),paraLab(6),6)
subplot(2,2,4)
boxplt_RvsSOC(ECM_Paras_MCL01_Dis,ECM_Paras_MCL01_Cha,...
    ECM_Paras_MCL02_Dis,ECM_Paras_MCL02_Cha,...
    ECM_Paras_MCL03_Dis,ECM_Paras_MCL03_Cha,...
    ECM_Paras_MCL04_Dis,ECM_Paras_MCL04_Cha,'Molicel',ylab(6),paraLab(6),6);
% Sigma
figure;
subplot(2,2,1)
boxplt_RvsBattery(ECM_Paras_LG01_Dis,ECM_Paras_LG01_Cha,...
    ECM_Paras_LG02_Dis,ECM_Paras_LG02_Cha,...
    ECM_Paras_LG03_Dis,ECM_Paras_LG03_Cha,...
    ECM_Paras_LG04_Dis,ECM_Paras_LG04_Cha,'LG',ylab(7),paraLab(7),7)

subplot(2,2,2)
boxplt_RvsSOC(ECM_Paras_LG01_Dis,ECM_Paras_LG01_Cha,...
    ECM_Paras_LG02_Dis,ECM_Paras_LG02_Cha,...
    ECM_Paras_LG03_Dis,ECM_Paras_LG03_Cha,...
    ECM_Paras_LG04_Dis,ECM_Paras_LG04_Cha,'LG',ylab(7),paraLab(7),7);

subplot(2,2,3)
boxplt_RvsBattery(ECM_Paras_MCL01_Dis,ECM_Paras_MCL01_Cha,...
    ECM_Paras_MCL02_Dis,ECM_Paras_MCL02_Cha,...
    ECM_Paras_MCL03_Dis,ECM_Paras_MCL03_Cha,...
    ECM_Paras_MCL04_Dis,ECM_Paras_MCL04_Cha,'Molicel',ylab(7),paraLab(7),7)
subplot(2,2,4)
boxplt_RvsSOC(ECM_Paras_MCL01_Dis,ECM_Paras_MCL01_Cha,...
    ECM_Paras_MCL02_Dis,ECM_Paras_MCL02_Cha,...
    ECM_Paras_MCL03_Dis,ECM_Paras_MCL03_Cha,...
    ECM_Paras_MCL04_Dis,ECM_Paras_MCL04_Cha,'Molicel',ylab(7),paraLab(7),7);

%% Plot ECM parameters VS. SOC
% LG
figure;
for i = 1:7
  subplot(7,2,2*i-1)
plotECMparasVsSOC(ECM_Paras_LG01_Dis,0,'LG',ylab(i),paraLab(i),i);
plotECMparasVsSOC(ECM_Paras_LG02_Dis,0,'LG',ylab(i),paraLab(i),i);
plotECMparasVsSOC(ECM_Paras_LG03_Dis,0,'LG',ylab(i),paraLab(i),i);
plotECMparasVsSOC(ECM_Paras_LG04_Dis,0,'LG',ylab(i),paraLab(i),i);
lgdno1 = legend(lgnd_LG,'Location','eastoutside');
lgdno1.FontSize = 7;
lgdno1.ItemTokenSize = [10,1];
subplot(7,2,2*i)
plotECMparasVsSOC(ECM_Paras_LG01_Cha,1,'LG',ylab(i),paraLab(i),i);
plotECMparasVsSOC(ECM_Paras_LG02_Cha,1,'LG',ylab(i),paraLab(i),i);
plotECMparasVsSOC(ECM_Paras_LG03_Cha,1,'LG',ylab(i),paraLab(i),i);
plotECMparasVsSOC(ECM_Paras_LG04_Cha,1,'LG',ylab(i),paraLab(i),i);
lgdno2 = legend(lgnd_LG,'Location','eastoutside'); 
lgdno2.FontSize = 7;
lgdno2.ItemTokenSize = [10,1];
end

% Molicel
figure;
for i = 1:7
   subplot(7,2,2*i-1)
plotECMparasVsSOC(ECM_Paras_MCL01_Dis,0,'Molicel',ylab(i),paraLab(i),i);
plotECMparasVsSOC(ECM_Paras_MCL02_Dis,0,'Molicel',ylab(i),paraLab(i),i);
plotECMparasVsSOC(ECM_Paras_MCL03_Dis,0,'Molicel',ylab(i),paraLab(i),i);
plotECMparasVsSOC(ECM_Paras_MCL04_Dis,0,'Molicel',ylab(i),paraLab(i),i);
lgdno3 = legend(lgnd_MCL,'Location','eastoutside');
lgdno3.FontSize = 7;
lgdno3.ItemTokenSize = [10,1];
subplot(7,2,2*i)
plotECMparasVsSOC(ECM_Paras_MCL01_Cha,1,'Molicel',ylab(i),paraLab(i),i);
plotECMparasVsSOC(ECM_Paras_MCL02_Cha,1,'Molicel',ylab(i),paraLab(i),i);
plotECMparasVsSOC(ECM_Paras_MCL03_Cha,1,'Molicel',ylab(i),paraLab(i),i);
plotECMparasVsSOC(ECM_Paras_MCL04_Cha,1,'Molicel',ylab(i),paraLab(i),i);
lgdno4 = legend(lgnd_MCL,'Location','eastoutside'); 
lgdno4.FontSize = 7;
lgdno4.ItemTokenSize = [10,1];
end
%% Plot Percent error R_i with respect to Rohm vs. SOC
Ri_LG_dis = [33.82 33 30.88 31.8];
Ri_LG_cha = [35.17 34.45 31 32.68];
Ri_MCL_dis = [12.76 12.78 13.19 12.8];
Ri_MCL_cha = [13.7 13.69 14.06 13.6];

% LG
figure;
subplot(2,2,1);
plotErrorvsSOC_Ri(Ri_LG_dis,ECM_Paras_LG01_Dis,0,'LG',1);
plotErrorvsSOC_Ri(Ri_LG_dis,ECM_Paras_LG02_Dis,0,'LG',2);
plotErrorvsSOC_Ri(Ri_LG_dis,ECM_Paras_LG03_Dis,0,'LG',3);
plotErrorvsSOC_Ri(Ri_LG_dis,ECM_Paras_LG04_Dis,0,'LG',4);
legend(lgnd_LG);

subplot(2,2,2);
plotErrorvsSOC_Ri(Ri_LG_cha,ECM_Paras_LG01_Cha,1,'LG',1);
plotErrorvsSOC_Ri(Ri_LG_cha,ECM_Paras_LG02_Cha,1,'LG',2);
plotErrorvsSOC_Ri(Ri_LG_cha,ECM_Paras_LG03_Cha,1,'LG',3);
plotErrorvsSOC_Ri(Ri_LG_cha,ECM_Paras_LG04_Cha,1,'LG',4);
legend(lgnd_LG);

% Molicel
subplot(2,2,3);
plotErrorvsSOC_Ri(Ri_MCL_dis,ECM_Paras_MCL01_Dis,0,'Molicel',1);
plotErrorvsSOC_Ri(Ri_MCL_dis,ECM_Paras_MCL02_Dis,0,'Molicel',2);
plotErrorvsSOC_Ri(Ri_MCL_dis,ECM_Paras_MCL03_Dis,0,'Molicel',3);
plotErrorvsSOC_Ri(Ri_MCL_dis,ECM_Paras_MCL04_Dis,0,'Molicel',4);
legend(lgnd_MCL);
subplot(2,2,4);
plotErrorvsSOC_Ri(Ri_MCL_cha,ECM_Paras_MCL01_Cha,1,'Molicel',1);
plotErrorvsSOC_Ri(Ri_MCL_cha,ECM_Paras_MCL02_Cha,1,'Molicel',2);
plotErrorvsSOC_Ri(Ri_MCL_cha,ECM_Paras_MCL03_Cha,1,'Molicel',3);
plotErrorvsSOC_Ri(Ri_MCL_cha,ECM_Paras_MCL04_Cha,1,'Molicel',4);
legend(lgnd_MCL);
%% Plot sigma/R_CT/C_DL/R_SEI/C_SEI/R_Ohm VS. SOC

% plot_anythingVS_SOC(sigma,' ','Warburg Coefficient - Sigma');
% plot_anythingVS_SOC(R_CT,'Resistance (Ohm)','R_{CT}');
% plot_anythingVS_SOC(C_DL,'Capacitance (F)','C_{DL}');
% plot_anythingVS_SOC(R_SEI,'Resistance (Ohm)','R_{SEI}');
% plot_anythingVS_SOC(C_SEI,'Capacitance (F)','C_{SEI}');
% plot_anythingVS_SOC(R_ohm,'Resistance (Ohm)','Ohmic Resistance R_omega');
% plot_anythingVS_SOC(L,'Inductance (H)','Stray Inductance L');

%% =========================== FUNCTIONS ==================================
%% ECM Parametes Estimate
% function [R_Omega,L,R_SEI,C_SEI,R_CT,...
%     C_DL,Sig] = ECM_ParasEsitimate(Data,FeatureData)
function ECM_Paras= ECM_ParasEstimate(Data,FeatureData)    
EIS_id  = Data(:,6);
Zreal = Data(:,11);
Zimg = Data(:,12);
freq = Data(:,8); % frequency
w = 2*pi*freq;  % omega
ECM_Paras = nan(9,7);
% Discharging: 90% to 10% (i = 0 to 8)
% Charging: 10% to 90% (i = 0 to 8)
for i = unique(EIS_id)'
    % Indexes of feature points
    k_DF = FeatureData(i+1,8:9);
    k_CT = FeatureData(i+1,6:7);
    k_SEI = FeatureData(i+1,4:5);
    k_RL = FeatureData(i+1,2:3);

    idx = find(EIS_id == i); % find index to each SOC 
    z_Real = Zreal(idx);
    z_img = -Zimg(idx);
    omega = w(idx);
%% R_Omega and L    
    zr4 = z_Real(k_RL(1):k_RL(2));
    zi4 = z_img(k_RL(1):k_RL(2));
    omega4 = omega(k_RL(1):k_RL(2));  
    % Estimation of ohmic impedance
    R_Omega = sum(zr4)/length(zr4);
    % Estimation of ohmic inductance
    L = -sum(zi4./omega4)/length(zr4);
%% R_SEI and C_SEI
    zr3 = z_Real(k_SEI(1):k_SEI(2));
    zi3 = z_img(k_SEI(1):k_SEI(2));
    omega3 = omega(k_SEI(1):k_SEI(2));
    R_SEI = R_arc_estimate(zr3,zi3,0,length(zr3));
    C_SEI = C_SEI_estimate(zr3,zi3,omega3,L,...
        R_Omega,R_SEI,0,length(zr3));   
%% Warburg Coefficient Sigma
    zr1 = z_Real(k_DF(1):k_DF(2));
    omega1 = omega(k_DF(1):k_DF(2));
    Sig = SigmaEstimate(length(zr1),zr1,omega1);
%% R_CT and C_DL
    zr2 = z_Real(k_CT(1):k_CT(2));
    zi2 = z_img(k_CT(1):k_CT(2));
    omega2 = omega(k_CT(1):k_CT(2));
    R_CT = R_arc_estimate(zr2,zi2,0,length(zr2));
    C_DL = C_DL_estimate(zr2,zi2,omega2,L,R_Omega,...
        R_SEI,C_SEI,R_CT,Sig,0,length(zr2));
% Output    
    ECM_Paras(i+1,:) = [round(R_Omega*1000,2) round(L*10^9,2) round(R_SEI*1000,2)...
        C_SEI round(R_CT*1000,2) C_DL round(Sig*10^3,2)];  
end
end

%% Nyquist Plot
function Nyquist_plot(Data,Battery_ID,Sign)
EIS_id  = Data(:,6);
Zreal = Data(:,11);
Zimg = Data(:,12);
linescolor = ['r','g','b','c','m',"#EDB120",'k',"#0072BD","#7E2F8E"];
% Charge: Sign == 1, Discharg: Sign == 0
if Sign == 0
lineColor = linescolor;
elseif Sign == 1
lineColor = fliplr(linescolor);
end

hold on; box on; grid on; axis equal;

for i = unique(EIS_id)'
    idx = find(EIS_id == i);   
    p = plot(Zreal(idx),-Zimg(idx),'-', 'LineWidth',1);
    p.Color = lineColor(i+1);
end
% xlabel('$Z_{real} (\Omega)$','FontSize',8,'Interpreter','latex'); 
% ylabel('$-Z_{img} (\Omega)$','FontSize',8,'Interpreter','latex');
xlabel('$Z_{real} (\Omega)$','FontSize',10,'Interpreter','latex'); 
ylabel('$-Z_{img} (\Omega)$','FontSize',10,'Interpreter','latex');

if Sign == 0
title({'Nyquist Plot at each SOC',['while discharging - ' Battery_ID]},'Fontsize', 10);
elseif Sign == 1
title({'Nyquist Plot at each SOC',['while charging - ' Battery_ID]},'Fontsize',10);
end

lgd = {'90%','80%','70%','60%','50%','40%','30%','20%','10%'};
% Charge: Sign == 1, Discharg: Sign == 0
if Sign == 0
legnd = legend(lgd,'Location','southeast');
elseif Sign ==1
legnd = legend(fliplr(lgd),'Location','southeast');
end
legnd.FontSize = 6.5;
legnd.ItemTokenSize = [5,1];
end

%% Internal resistance R vs. SOC
function R0 = RvsSOC(Data_dis,Data_cha)
step_id_dis  = Data_dis(:,6);
Current_dis = Data_dis(:,7); 
Voltage_dis = Data_dis(:,8); 

step_id_cha  = Data_cha(:,6);
Current_cha = Data_cha(:,7); 
Voltage_cha = Data_cha(:,8); 

idx6 = [];

% 6 samples x 2 x 5 (60samples) → 5 samples x 2 x 5(50 samples)
for m = 1:10
    idx6 = [idx6 (m-1)*6+1:(m-1)*6+5];
end

% While Discharging
% if Sign == 0
    % Internal Resistance measured by Arbin (mOhm)
    R0_Arbin_dis = Data_dis(3,16)*1000; % mOhm
    % pulse stream at 100% SOC
    idx_soc100_dis = find(step_id_dis == 6 | step_id_dis == 7);
    % pulse stream at 0% SOC
    idx_soc0 = find(step_id_dis == 19 | step_id_dis == 20);
    % pulse stream at 10% to 90% SOC
    idx_soc90to10 = find(step_id_dis == 13 | step_id_dis == 14);
    
    for i = 0:10
        % when SOC at 100%
        if i == 0
            idx5_dis = idx_soc100_dis(idx6);
            
            % when SOC at 90% to 10%
        elseif i >= 1 && i <= 9
            % at each SOC, there are 60 samples, but we need 50 samples
            % sampling freq. 200hz (5ms), period of pulse stream: 50ms,
            % repeat 5 times, 10samples x 5 = 50 samples.
            
            % find index of batches of data when SOC at 90% to 10%
            idx8_dis = (i-1)*60+1:(i-1)*60+60;
            idx_at_each_SOC_dis = idx_soc90to10(idx8_dis);
            idx5_dis = idx_at_each_SOC_dis(idx6);
        else
            idx5_dis = idx_soc0(idx6);
        end
        Zi_dis = Current_dis(idx5_dis); % Measured Current
        Zv_dis = Voltage_dis(idx5_dis); % Measured Voltage
        R0_Est_dis = R0_Estimate(Zi_dis,Zv_dis);
        R0(i+1) = R0_Est_dis*1000; % mOhm
    end

% While Charging
% elseif Sign == 1
    % Internal Resistance measured by Arbin (mOhm)
    R0_Arbin_cha = Data_cha(3,16)*1000;
    % pulse stream at 100% SOC
    idx_soc100 = find(step_id_cha == 33 | step_id_cha == 34);
    % pulse stream at 0% SOC
%     idx_soc0 = find(step_id == 40 | step_id == 41);
    % pulse stream at 10% to 90% SOC
    idx_soc10to90 = find(step_id_cha == 26 | step_id_cha == 27);
    
    for i = 11:20
        % when SOC at 100%
        if i == 20
            idx5_cha = idx_soc100(idx6);
            
            % when SOC at 10% to 100%
%         elseif i >= 13 && i <= 21
        else
            % at each SOC, there are 60 samples, but we need 50 samples
            % sampling freq. 200hz (5ms), period of pulse stream: 50ms,
            % repeat 5 times, 10samples x 5 = 50 samples.
            
            % find index of batches of data ranges from SOC at 10% to 100%
            idx8_cha = (i-11)*60+1:(i-11)*60+60;
            idx_at_each_SOC_cha = idx_soc10to90(idx8_cha);
            idx5_cha = idx_at_each_SOC_cha(idx6);
%         else
%             idx5 = idx_soc0(idx6);
        end
        Zi_cha = Current_cha(idx5_cha); % Measured Current
        Zv_cha = Voltage_cha(idx5_cha); % Measured Voltage
        R0_Est_cha = R0_Estimate(Zi_cha,Zv_cha);
        R0(i+1) = R0_Est_cha*1000; % mOhm
    end

soc1 = 0:20;
hold on; box on; grid on;
plot(soc1,R0,'-*','LineWidth',1);
% plot(soc1,[R0_Arbin_dis*ones(11,1); R0_Arbin_cha*ones(10,1)],...
%     '--','LineWidth',1);
xl=get(gca,'xlim');
xti=[100:-10:0 10:10:100];
set(gca,'xtick',linspace(xl(1),xl(2),numel(xti)));
xti1=arrayfun(@num2str,xti,'un',0);
set(gca,'xticklabel',xti1);
xlabel('SOC(\%)','Interpreter','latex'); 
ylabel('Internal Resistance $$R_0$$ ($$m\Omega$$)','Interpreter','latex');
end

%% Plot anything VS. SOC
function plot_anythingVS_SOC(data,y_label,new_title)
soc = 10:10:90;
soc_inv = fliplr(soc);
figure;
plot(soc_inv,data,'g-*','LineWidth',1.5);
grid on;box on;
xlabel('SOC'); ylabel(y_label);
title({[new_title ' at each SOC'],...
    'when discharging battery from 90% to 10%'});
end

%% Estimation of ohmic impedance
function Ohm_R = Ohmic_R_Estimate(z_Real,k3,k4)
    Ohm_R = sum(z_Real(k3+1:k4))/(k4-k3);
end

%% Estimation of stray inductance
function L = L_estimate(z_img,omega,k3,k4)
    L = -sum(z_img(k3+1:k4)./omega(k3+1:k4))/(k4-k3);
end

%% Estimate C_SEI
function C_SEI = C_SEI_estimate(zr,zi,w,L,R_ohm,R_SEI,k_L,k_U)
if zi<0
    Z = zr + zi*j;
else
    Z = zr - zi*j;
end
C = 0;
for k = k_L+1:k_U
    a = Z(k) - j*w(k)*L-R_ohm;
    b = R_SEI/a;
    d = imag(b-1);
    C = C + d/(w(k)*R_SEI);
end
    C_SEI = C/(k_U-k_L);
end

%% Estimate C_DL
function C_DL = C_DL_estimate(zr,zi,w,L,R_ohm,R_SEI,C_SEI,R_CT,Sig,k_L,k_U)
if zi<0
    Z = zr + zi*j;
else
    Z = zr - zi*j;
end
C = 0;
for k = k_L+1:k_U
    a = Z(k) - j*w(k)*L-R_ohm - R_SEI/(1+j*w(k)*R_SEI*C_SEI);
    Zw = (1-j)*Sig/sqrt(w(k)); % Warburg Imp.
    b = (R_CT + Zw)/a;
    d = imag((b-1)/(R_CT+Zw));
    C = C + d/w(k);
end
    C_DL = C/(k_U-k_L);
end

%% Estimation of R_SEI R_CT
function R = R_arc_estimate(z_Real,z_img,k_L,k_U)
    zr = z_Real(k_L+1:k_U);
    zi = z_img(k_L+1:k_U);
    y = -(zr.^2+zi.^2);
    A = [zr ones(length(zr),1)];
    X =inv(A'*A)*A'*y;
    a= X(1);
    b = X(2);
    R = 2*sqrt(a^2/4-b);
end

%% Estimate Warburg Coefficient sigma
function sigma = SigmaEstimate(k1,z_Real,omega)  
    n = floor(k1/2);
    zr = z_Real(k1-n+1:k1);
    zr = flip(zr);
    z_tilde = z_Real(1:n) - zr;
    w_1 = omega(1:n);
    w_2 = omega(k1-n+1:k1);
    w_3 = fliplr(w_2);
    b = 1./sqrt(w_1) - 1./sqrt(w_3);  
    sigma = inv(b'*b)*b'*z_tilde;
end

%% Tabulate ECM Parameters and R0
function TabulateParas(ECM_Paras,Sign,model)
% Sign == 0, Discharging, Sign == 1, Charging
SOC = 10:10:90;
if Sign == 1
    SOC1 = SOC;
elseif Sign == 0
    SOC1 = fliplr(SOC);
end
format shortG;
T = array2table([SOC1' ECM_Paras], 'VariableNames', {'SOC(%)',...
    'R_Omega(mOhm)','L(nH)','R_SEI(mOhm)','C_SEI(F)','R_CT(mOhm)',...
    'C_DL(F)','Sigma(1e-3)'});
% T2 = table(SOC','VariableNames',{'SOC (%)'});
% T = [T2 T];
if Sign == 0
    disp([model ' ECM Parameters while discharging the battery']);
elseif Sign == 1
    disp([model ' ECM Parameters while charging the battery']);
end
disp(T);
end

%% R0 Estimate
function R0 = R0_Estimate(Zi,Zv)
P = [ones(length(Zi),1) Zi];
k_est = inv(P'*P)*P'*Zv;
R0 = k_est(2);
end

%% Plot R0 and R_Ohm+R_SEI+R_CT VS. SOC
% function plotRvsSOC(R0_bat,ECM_Paras_dis,ECM_Paras_cha)
function plotRvsSOC(R0_bat,ECM_Paras,Sign,newLabel)
% R0 = R0_bat([2:10 12:20]);
if Sign == 0
    R0 = R0_bat(2:10);
else
    R0 = R0_bat(12:20);
end
R_ECM = ECM_Paras(:,1)+ECM_Paras(:,3)+ECM_Paras(:,5);
% R_ECM_dis = ECM_Paras_dis(:,1)+ECM_Paras_dis(:,3)+ECM_Paras_dis(:,5);
% R_ECM_cha = ECM_Paras_cha(:,1)+ECM_Paras_cha(:,3)+ECM_Paras_cha(:,5);
% R_eis = [R_ECM_dis; R_ECM_cha];
R_eis = R_ECM;
soc1 = 0:8;
hold on; box on; grid on;
plot(soc1,R0,'-*','LineWidth',1);
plot(soc1,R_eis,'-s','LineWidth',1);
legend('$R_{0}$','$R_{\Omega}+R_{SEI}+R_{CT}$','Interpreter','latex');
xl=get(gca,'xlim');
if Sign == 0
    % xti=[90:-10:10 10:10:90];
    xti=90:-10:10;
else
    xti=10:10:90;
end
set(gca,'xtick',linspace(xl(1),xl(2),numel(xti)));
xti1=arrayfun(@num2str,xti,'un',0);
set(gca,'xticklabel',xti1);

xlabel('SOC(\%)','Interpreter','latex'); 
% ylabel('Internal Resistance $$R_0$$ ($$m\Omega$$)','Interpreter','latex');
ylabel('Resistance ($$m\Omega$$)','Interpreter','latex');
if Sign ==0
title(['Resistances of ' newLabel ' battery while discharging']);
else
title(['Resistances of ' newLabel ' battery while charging']);
end
end

%% Plot Error(%) between R0 and R_Ohm+R_SEI+R_CT VS. SOC
% function plotErrorvsSOC(R0_bat,ECM_Paras_dis,ECM_Paras_cha)
function plotErrorvsSOC(R0_bat,ECM_Paras,Sign,newLabel)
% R0 = R0_bat([2:10 12:20]);
if Sign == 0
    R0 = R0_bat(2:10);
else
    R0 = R0_bat(12:20);
end
R_ECM = ECM_Paras(:,1)+ECM_Paras(:,3)+ECM_Paras(:,5);
% R_ECM_dis = ECM_Paras_dis(:,1)+ECM_Paras_dis(:,3)+ECM_Paras_dis(:,5);
% R_ECM_cha = ECM_Paras_cha(:,1)+ECM_Paras_cha(:,3)+ECM_Paras_cha(:,5);
% R_eis = [R_ECM_dis; R_ECM_cha];
R_eis = R_ECM;
% in percentage
Error = 100*abs(R_eis - R0')./R0';
soc1 = 0:8;
hold on; box on; grid on;
plot(soc1,Error,'-o','LineWidth',1);
% plot(soc1,R_eis,'-s','LineWidth',1);
xl=get(gca,'xlim');
if Sign == 0
    % xti=[90:-10:10 10:10:90];
    xti=90:-10:10;
else
    xti=10:10:90;
end
set(gca,'xtick',linspace(xl(1),xl(2),numel(xti)));
xti1=arrayfun(@num2str,xti,'un',0);
set(gca,'xticklabel',xti1);

xlabel('SOC(\%)','Interpreter','latex'); 
% ylabel('Internal Resistance $$R_0$$ ($$m\Omega$$)','Interpreter','latex');
ylabel('Percent Error ($$\%$$)','Interpreter','latex');
if Sign ==0
title({'Percentage difference between estimated $R_0$ and $(R_{\Omega}+R_{SEI}+R_{CT})$';...
    ['of ' newLabel ' batteries while discharging']},'Interpreter','latex');
else
title({'Percentage difference between estimated $R_0$ and $(R_{\Omega}+R_{SEI}+R_{CT})$';...
    ['of ' newLabel ' batteries while charging']},'Interpreter','latex');
end
end

%%
function boxplt_RvsBattery(ECMparas1dis,ECMparas1cha,...
    ECMparas2dis,ECMparas2cha,...
    ECMparas3dis,ECMparas3cha,...
    ECMparas4dis,ECMparas4cha,newlab,ylab,lab2,id)
% data = {[ECMparas1dis(:,1),ECMparas2dis(:,1),ECMparas3dis(:,1),ECMparas4dis(:,1)]...
%     [ECMparas1cha(:,1),ECMparas2cha(:,1),ECMparas3cha(:,1),ECMparas4cha(:,1)]}; 
% boxplotGroup(data, 'PrimaryLabels', {'Discharge' 'Charge'}, ...
%   'SecondaryLabels',{'LG01', 'LG02', 'LG03','LG04'}, 'InterGroupSpace', 2)
% data = {rand(100,2), rand(100,2)+.2, rand(100,2)-.2}; 
% boxplotGroup(data, 'PrimaryLabels', {'a' 'b' 'c'}, ...
%   'SecondaryLabels',{'Group1', 'Group2'}, 'InterGroupSpace', 2)

% 9x4 matrix
Cha = [ECMparas1cha(:,id) ECMparas2cha(:,id) ECMparas3cha(:,id) ECMparas4cha(:,id)];
Dis = [ECMparas1dis(:,id) ECMparas2dis(:,id) ECMparas3dis(:,id) ECMparas4dis(:,id)]; 

% G1=rand(100,10);
% G2=rand(200,10);
% G3=rand(150,10);

% prepare data
data=cell(4,2);
for ii=1:size(data,1)
Ac{ii}=Cha(:,ii);
Bc{ii}=Dis(:,ii);
% Cc{ii}=G3(:,ii);
end
data=vertcat(Ac,Bc);
if strcmp(newlab,'LG')
    xlab={'LG01','LG02','LG03','LG04'};
else
    xlab={'MCL01','MCL02','MCL03','MCL04'};
end
% col=[102,255,255, 200;
% 51,153,255, 200;
% 0, 0, 255, 200];
% col=[102,255,255, 200;51,153,255, 200];
col=[255,105,105, 100;102,255,125, 200];
col=col/255;

multiple_boxplot(data',xlab,{'Charging', 'Discharging'},col')
% title({['Comparison of ' char(lab2) ' estimated from all SOCs between'];...
%     [newlab ' batteries']},'Interpreter','latex');
title({['Comparison of ' char(lab2) ' among all '];...
    [newlab ' batteries']},'Interpreter','latex');
xlabel('Battery');
ylabel(ylab,'Interpreter','latex');
end
%%
% Ref: Ander Biguri (2023). multiple_boxplot.m (https://www.mathworks.com/
% matlabcentral/fileexchange/47233-multiple_boxplot-m), MATLAB Central 
% File Exchange. Retrieved March 10, 2023.
function boxplt_RvsSOC(ECMparas1dis,ECMparas1cha,...
    ECMparas2dis,ECMparas2cha,...
    ECMparas3dis,ECMparas3cha,...
    ECMparas4dis,ECMparas4cha,newlab,ylab,lab2,id)
% data = {rand(100,2), rand(100,2)+.2, rand(100,2)-.2}; 
% boxplotGroup(data, 'PrimaryLabels', {'a' 'b' 'c'}, ...
%   'SecondaryLabels',{'Group1', 'Group2'}, 'InterGroupSpace', 2)

% 4x9 matrix
Cha = [ECMparas1cha(:,id) ECMparas2cha(:,id) ECMparas3cha(:,id) ECMparas4cha(:,id)]';
Dis = [flip(ECMparas1dis(:,id)) flip(ECMparas2dis(:,id)) ...
    flip(ECMparas3dis(:,id)) flip(ECMparas4dis(:,id))]'; 
% G1=rand(100,10);
% G2=rand(200,10);
% G3=rand(150,10);

% prepare data
data=cell(9,2);
for ii=1:size(data,1)
Ac{ii}=Cha(:,ii);
Bc{ii}=Dis(:,ii);
% Cc{ii}=G3(:,ii);
end
data=vertcat(Ac,Bc);

xlab={'10','20','30','40','50','60','70','80','90'};
% col=[102,255,255, 200;
% 51,153,255, 200;
% 0, 0, 255, 200];
col=[255,105,105, 100;102,255,125, 200];
col=col/255;

multiple_boxplot(data',xlab,{'Charging', 'Discharging'},col')
% title({['Boxplot of four ' newlab ' batteries with'],'ohmic resistance estimated at each SOC'})
title({['Comparison of ' char(lab2) ' of ' newlab ' batteries'];...
    ['between each SOC']},'Interpreter','latex');
xlabel('SOC ($$\%$$)','Interpreter','latex');
ylabel(ylab,'Interpreter','latex');
end

%% Plot Error(%) between Ri (measured by Arbin) and R_Ohm VS. SOC
% function plotErrorvsSOC(R0_bat,ECM_Paras_dis,ECM_Paras_cha)

function plotErrorvsSOC_Ri(Ri_bat,ECM_Paras,Sign,newLabel,id)
Ri = Ri_bat(id);
% if Sign == 0
%     R0 = R0_bat(2:10);
% else
%     R0 = R0_bat(12:20);
% end
R_ECM = ECM_Paras(:,1);
% R_ECM_dis = ECM_Paras_dis(:,1)+ECM_Paras_dis(:,3)+ECM_Paras_dis(:,5);
% R_ECM_cha = ECM_Paras_cha(:,1)+ECM_Paras_cha(:,3)+ECM_Paras_cha(:,5);
% R_eis = [R_ECM_dis; R_ECM_cha];
R_eis = R_ECM;
% in percentage
Error = 100*abs(R_eis - Ri')./Ri';
soc1 = 0:8;
hold on; box on; grid on;
plot(soc1,Error,'-o','LineWidth',1);
% plot(soc1,R_eis,'-s','LineWidth',1);
xl=get(gca,'xlim');
if Sign == 0
    % xti=[90:-10:10 10:10:90];
    xti=90:-10:10;
else
    xti=10:10:90;
end
set(gca,'xtick',linspace(xl(1),xl(2),numel(xti)));
xti1=arrayfun(@num2str,xti,'un',0);
set(gca,'xticklabel',xti1);

xlabel('SOC(\%)','Interpreter','latex'); 
% ylabel('Internal Resistance $$R_0$$ ($$m\Omega$$)','Interpreter','latex');
ylabel('Percent Error ($$\%$$)','Interpreter','latex');
if Sign ==0
title({'Percentage difference between $R_i$ and $R_{\Omega}$';...
    ['of ' newLabel ' batteries while discharging']},'Interpreter','latex');
else
title({'Percentage difference between $R_0$ and $R_{\Omega}$';...
    ['of ' newLabel ' batteries while charging']},'Interpreter','latex');
end
end

%% Plot ECM parameters VS. SOC
% function plotErrorvsSOC(R0_bat,ECM_Paras_dis,ECM_Paras_cha)
% plotECMparasVsSOC(ECM_Paras_LG01_Dis,0,'LG',ylab(1),paraLab(1),1);

function plotECMparasVsSOC(ECM_Paras,Sign,newlab,ylab,paraLab,id)
% if Sign == 0
%     R0 = R0_bat(2:10);
% else
%     R0 = R0_bat(12:20);
% end
para = ECM_Paras(:,id);
soc1 = 0:8;
hold on; box on; grid on;
plot(soc1,para,'-o','LineWidth',0.5,'MarkerSize',3);

xl=get(gca,'xlim');
if Sign == 0
    xti=90:-10:10;
else
    xti=10:10:90;
end
set(gca,'xtick',linspace(xl(1),xl(2),numel(xti)));
xti1=arrayfun(@num2str,xti,'un',0);
set(gca,'xticklabel',xti1);

xlabel('SOC($$\%$$)','Interpreter','latex'); 
% xlabel('SOC (%)');
ylabel(ylab,'Interpreter','latex');
% ylabel('Internal Resistance $$R_0$$ ($$m\Omega$$)','Interpreter','latex');
% ylabel('Percent Error ($$\%$$)','Interpreter','latex');
if Sign ==0
title({[char(paraLab) ' of ' newlab ' battery while dicharging']},'Interpreter','latex');
else
title({[char(paraLab) ' of ' newlab ' battery while charging']},'Interpreter','latex');
end
end