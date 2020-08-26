close all; %先關閉所有圖片
Fs=500; %採樣頻率(Hz)
f=100 %信號頻率(Hz)
N=5000; %採樣點數
t=[0:1/Fs:N/Fs]; %採樣時刻
S=100*sin(2*pi*f*t); %信號

%顯示原始信號
figure(1);
subplot(3,2,1);
plot(S);
xlabel('樣數');ylabel('EAR值');title('原始信號');

Y = fft(S,N); %做FFT變換
Ayy = (abs(Y)); %取模
subplot(3,2,2);
plot(Ayy(1:N)); %顯示原始的FFT模值結果
xlabel('樣數');ylabel('模數');title('FFT 模值');

Ayy=Ayy/(N/2); %換算成實際的幅度
Ayy(1)=Ayy(1)/2;
F=([1:N]-1)*Fs/N; %換算成實際的頻率值
subplot(3,2,3);
plot(F(1:N/2),Ayy(1:N/2)); %顯示換算後的FFT模值結果
xlabel('頻率(Hz)');ylabel('幅度(V)');title('幅度(V)-頻率曲線圖');

PYf1 =20*log10(Ayy);
subplot(3,2,4);
plot(F(1:N/2),PYf1(1:N/2));
xlabel('頻率(Hz)');ylabel('幅度(dB)');title('幅度(db)-頻率曲線圖');

Pyy=[1:N/2];
for i=1:N/2
Pyy(i)=phase(Y(i)); %計算相位
Pyy(i)=Pyy(i)*180/pi; %換算為角度
end
subplot(3,2,5);
plot(F(1:N/2),Pyy(1:N/2)); %顯示相位圖
title('相位-頻率曲線圖');