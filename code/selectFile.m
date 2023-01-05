function selectFile()
global hAxes1 hAxes2 hAxes3 hAxes4 hList hMenu eeg n m t dy fs

% Loading EEG File

fs=250;
dt=1/fs;
tMax=5;
t=0:dt:tMax-2*dt;

if hMenu.Value == 1
    eeg=load('samples/EEGOpen.txt'); % 10-channel EEG recording of a patient with open eyes
else
    eeg=load('samples/EEGClose.txt'); % 10-channel EEG recording of a patient with closed eyes
end
[n, m]=size(eeg);
t=0:dt:(n-1)*dt;

% Plotting all chanels on one graph
axes(hAxes1);
cla
dy=40;
for i=1:m
    plot(t,eeg(:,i)-i*dy);
    hold on
end

set(hList,'Enable','on');
cla(hAxes2)
cla(hAxes3)
cla(hAxes4)
xlabel(hAxes1,'time, s')
title(hAxes1,'EEG')
xlabel(hAxes2,'time, s')
title(hAxes2,'Variance')
title(hAxes3,"Filter's AFC")
title(hAxes4,'Pulse response of the filter')
end
