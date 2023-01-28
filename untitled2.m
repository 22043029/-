plot(data)
ecg=data(2500:4400)
fs=100;%Hz
fc   =20;%Hz
forder=3;
[b,a]=butter(forder,fc/(fs/2));
ecg_lf=filtfilt(b,a,ecg);
figure,plot(ecg_lf)
fc     =15;
[b,a]=butter(forder,fc/(fs/2),'high');
ecg_hf=filtfilt(b,a,ecg);
figure,plot(ecg_hf)
a=8;
b=[-1 0-2 0 0 0 2 0 1];
ecg_diff=filter(b,a,ecg');%filtfilt
figure,plot(ecg_diff)
ecg_diff_2=ecg_diff.^2;
a=1;
b=ones(1,0.15*500);
ecg_diff_int=filter(b,a,ecg_diff_2);
figure,plot(ecg_diff_int)

fs=256;
f =50;
T =0.1;
t =0:1/fs:T;
x =sin(2*pi*f*t);
[Pxx,F]=periodogram(x.rectwin(length(x)),length(x),fs);
figure
polt(F,10*log10(Pxx));
figure,plot(x)
