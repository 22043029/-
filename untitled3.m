fs = 256;
%サンプリングレート
f = 50;
%正弦波の周波数
T = 0.1;
%データの持続時間
t = 0:1/fs:T; %サンプルの時刻
x = sin(2*pi*f*t); %正弦波データ
[Pxx,F] = periodogram(x,rectwin(length(x)),length(x),fs);
figure
plot(F,10*log10(Pxx))

T=1;
t = 0:1/fs:T; %サンプルの時刻
x = sin(2*pi*f*t); %正弦波データ
[Pxx,F] = periodogram(x,rectwin(length(x)),length(x),fs);
figure
plot(F,10*log10(Pxx))

T=2;
t = 0:1/fs:T; %サンプルの時刻
x = sin(2*pi*f*t); %正弦波データ
[Pxx,F] = periodogram(x,rectwin(length(x)),length(x),fs);
figure
plot(F,10*log10(Pxx))

T=10;
t = 0:1/fs:T; %サンプルの時刻
x = sin(2*pi*f*t); %正弦波データ
[Pxx,F] = periodogram(x,rectwin(length(x)),length(x),fs);
figure
plot(F,10*log10(Pxx))
