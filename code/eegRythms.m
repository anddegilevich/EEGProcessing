clc;
clear all;
close all;
 
%% Measuring EEG rhythms
global hAxes1 hAxes2 hAxes3 hAxes4 hList hMenu

% Creating app window
figure(1)
hAxes1=axes('Position',[0.03,0.06,0.45,0.84]);
xlabel(hAxes1,'time, s')
title(hAxes1,'EEG')
hAxes2=axes('Position',[0.5,0.06,0.2,0.84]);
xlabel(hAxes2,'time, s')
title(hAxes2,'Variance')
hAxes3=axes('Position',[0.74,0.43,0.24,0.3]);
title(hAxes3,"Filter's AFC")
hAxes4=axes('Position',[0.74,0.08,0.24,0.3]);
title(hAxes4,'Pulse response of the filter')
hMenu=uicontrol('Style','popupmenu','Units','normalized',...
'Position',[0.03,0.9,0.1,0.08],'String',{'Open eyes','Closed eyes'},...
'Backgroundcolor',[1 1 1],'FontSize',20,'Callback','selectFile');
hList=uicontrol('Style','listbox','Units','normalized',...
'Position',[0.8,0.8,0.12,0.18],'Callback','filterRythm','FontSize',15);
set(hList,'String',...
{'No filter','delta','teta','alfa','beta'},...
'Enable','off');
