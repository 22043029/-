plot(data)
fs=100;%Hz
fc   =20;%Hz
forder=3;
[b,a]=butter(forder,fc/(fs/2));
ecg_lf=filtfilt(b,a,data);
figure,plot(ecg_lf)