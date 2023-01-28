fs = 256;
%サンプリングレート
f = 50;
%正弦波の周波数
T = 0.1;
%データの持続時間
t = 0:1/fs:T; %サンプルの時刻
x = sin(2*pi*f*t); %正弦波データ
[Pxx,F] = periodogram(x,hamming(length(x)),length(x),fs);
figure
plot(F,10*log10(Pxx))

[Pxx,F] = periodogram(x,rectwin(length(x)),length(x),fs);
figure
plot(F,10*log10(Pxx))

x = randn(1024, 1);
fs = 1;
A = [1 2 3 4 3 2 1]';
X = filter(1, A, x);
order = 2;
[Pxx,F] = pyulear(X,order,1024,fs);
plot(F,10*log10(Pxx))

M = 50;
num = length(X)-M;
for i=1:M
[A,E]= arburg(X,i); % A:係数, E:残差分散
AIC(i)=num*(log(2*pi)+1)+num*log(E)+2*(i+1);
end
subplot(1,2,1);plot(AIC,'-bo');
xlabel('次数 order');ylabel('AIC');
title('ARモデルの次数とAIC')
[order min_at] = min(AIC);
order = round(min_at);
plot(AIC);
plot(AIC(2:10))
plot(AIC(5:12))
plot(AIC(7:12))

[Pxx,F] = pburg(X,order,1024,fs);
plot(F,10*log10(Pxx))
[Pxx,F] = pyulear(X,order,1024,fs);
figure,plot(F,10*log10(Pxx))
[Pxx,F] = pburg(X,order,1024,fs);
figure,plot(F,10*log10(Pxx))