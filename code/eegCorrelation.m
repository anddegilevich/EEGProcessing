clc
close all
clear all

%% Loading EEG signals

eegOpen = load('samples/EEGOpen.txt'); % 10-channel EEG recording

fs = 250; % Sampling frequency equals 250 Hz
dt = 1/fs;
n = length(eegOpen);
m = length(eegOpen(1,:));
tMax = n*dt;
t = 0:dt:tMax-dt; % Array of timeline

% Getting EEG correlation matrix
corr = corrcoef(eegOpen);
eegCorr = zeros(m+1,m+1);
eegCorr(1:m,1:m) = corr;

% Graduating correlation matrix 
threshold = 0.6; 
for i = 1:m
    for j = 1:m
        if corr(i,j) > threshold
            corrGrad(i,j) = 1;
        else
            corrGrad(i,j) = 0;
        end
    end
end
eegCorrGrad = zeros(m+1,m+1);
eegCorrGrad(1:m,1:m) = corrGrad;

% Building graph
dy = 40; % Indent to display all channels on one graph
figure(1)
subplot(2,2,1:2)
for i=1:m
    plot(t,eegOpen(:,i)+dy*i)
    hold on
end
title('EEG')
xlabel('Time, s');
ylabel('Amplitude, -');
grid on

subplot(2,2,3)
pcolor(eegCorr)
colormap(pink)
title('Correlation matrix')
axis ij

subplot(2,2,4)
pcolor(eegCorrGrad)
colormap(pink)
title('Graduated correlation matrix')
axis ij