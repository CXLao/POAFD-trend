clear;clc;close all
t1 = datetime(2023,10,5, 'Format','yyyy-MM-dd');
t2 = datetime(2023,10,11, 'Format','yyyy-MM-dd');
date = t1:t2;

load('target.mat');
load('trend_3.mat');
load('trend_5.mat');
load('trend_7.mat');
load('trend_9.mat');

target=target(4:10);
trend_3=trend_3(4:10);
trend_5=trend_5(4:10);
trend_7=trend_7(4:10);
trend_9=trend_9(4:10);


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
