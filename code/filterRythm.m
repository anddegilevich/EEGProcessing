function filterRythm()
global hAxes1 hAxes2 hAxes3 hAxes4 hList eeg n m t dy fs
r=get(hList,'Value')-1;
if r==0
    axes(hAxes1)
    hold off
    for i=1:m
        plot(t,eeg(:,i)-i*dy);
        hold on
    end
    cla(hAxes2)
    cla(hAxes3)
    cla(hAxes4)
    return
end

fc=[1 4;4 8;8 13;14 30]; % Boundaries of frequency ranges of EEG rhythms
ord=fix(4*fs/(fc(r,1)+3));
df1=fc(r,1)/5;
fStop1=fc(r,1)-0.7*df1;
fPass1=fc(r,1)+0.3*df1;
df2=fc(r,2)/5;
fPass2=fc(r,2)-0.3*df2;
dStop2=fc(r,2)+0.7*df2;
wStop1=1;
wPass=1;
wStop2=1;
b=firls(ord,[0 fStop1 fPass1 fPass2 dStop2 fs/2]/(fs/2),...
    [0 0 1 1 0 0],[wStop1 wPass wStop2]);

df=0.2;
nf=fix((fs/2)/df);
[h,w]=freqz(b,1,nf);
Fmax=50;
Nmax=fix(Fmax/df);
axes(hAxes3)
plot(w(1:Nmax)/(2*pi)*fs, abs(h(1:Nmax)))
axes(hAxes4)
stem(b,'.')

eegF=filter(b,1,eeg);
d=fix(ord/2);
eegF(1:n-d,:)=eegF(d+1:n,:);
for i=1:m
    eegF(n-d+1:n,i)=eegF(n,i);
end
axes(hAxes1)
cla
    for i=1:m
        plot(t,eegF(:,i)-i*dy);
        hold on
    end

eegVar(1,:)=var(eeg);
eegVar(2,:)=var(eegF);
axes(hAxes2);
barh(eegVar','group');
legend(hAxes2,{'Before filter','After filter'})
set(hAxes2,'Ydir','Reverse')
xlabel(hAxes2,'time, s')
title(hAxes2,'Variance')
title(hAxes3,"Filter's AFC")
title(hAxes4,'Pulse response of the filter')
end


