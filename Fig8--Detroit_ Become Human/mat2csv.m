clear;clc;close all
t1 = datetime(2023,7,14, 'Format','yyyy-MM-dd');
t2 = datetime(2023,9,11, 'Format','yyyy-MM-dd');
date = t1:t2;

load('target.mat');
load('trend_3.mat');
load('trend_5.mat');
load('trend_7.mat');

target=target(191:250);
trend_3=trend_3(191:250);
trend_5=trend_5(191:250);
trend_7=trend_7(191:250);


Names = {'date','Owners'};

% Create a table with the data
T = table(date', trend_9');
T.Properties.VariableNames = Names;
writetable(T,'trend_9.csv');


Names = {'date','Owners'};

% Create a table with the data
T = table(date', target');
T.Properties.VariableNames = Names;
writetable(T,'target.csv');
