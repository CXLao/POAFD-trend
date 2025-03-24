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

model_list = {'RNN', 'LSTM', 'GRU', 'MLP', 'FCN', 'ResNet', 'LSTM_FCN', 'GRU_FCN', ...
                    'mWDN', 'TCN', 'MLSTM_FCN', 'InceptionTime',  'XceptionTime', 'ResCNN', ...
                    'OmniScaleCNN', 'TST',  'TSiT',  'XCM', 'gMLP',  'TSSequencerPlus'};
for mdoel_name =model_list
    load(strcat(string(mdoel_name),'.mat'));
end

Y = [RNN; LSTM; GRU; ...
    MLP; FCN; ResNet; LSTM_FCN; GRU_FCN; mWDN;...
    TCN; MLSTM_FCN; InceptionTime; XceptionTime; ResCNN; ...
    OmniScaleCNN; TST; TSiT; XCM; gMLP; TSSequencerPlus];

plot(date, target, 'k', date, trend_9, 'r','Linewidth', 2);
hold on
cmap = colormap(parula(20));
for i = 1:20
    plot(date, Y(i,:), 'MarkerFaceColor', cmap(i,:), 'Linewidth', 1);
    hold on
end

xlabel('Date');
ylabel('Owners');

legend_name = {'target','POAFD-trend','RNN', 'LSTM', 'GRU', 'MLP', 'FCN', 'ResNet', 'LSTM\_FCN', 'GRU\_FCN', ...
                    'mWDN', 'TCN', 'MLSTM_FCN', 'InceptionTime',  'XceptionTime', 'ResCNN', ...
                    'OmniScaleCNN', 'TST',  'TSiT',  'XCM', 'gMLP',  'TSSequencerPlus'};
legend(legend_name, 'Location','NorthEastOutside')

set(gca,'XTick',date,'XTickLabelRotation',60);
datetick('x','yyyy-mm-dd','keepticks');
set(gcf, 'unit', 'centimeters', 'position', [10 5 28 20]);
xlim([date(1) date(end)])


 saveas(1, 'tsai_persona.png');
