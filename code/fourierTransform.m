close all; %�������Ҧ��Ϥ�
Fs=500; %�ļ��W�v(Hz)
f=100 %�H���W�v(Hz)
N=5000; %�ļ��I��
t=[0:1/Fs:N/Fs]; %�ļˮɨ�
S=100*sin(2*pi*f*t); %�H��

%��ܭ�l�H��
figure(1);
subplot(3,2,1);
plot(S);
xlabel('�˼�');ylabel('EAR��');title('��l�H��');

Y = fft(S,N); %��FFT�ܴ�
Ayy = (abs(Y)); %����
subplot(3,2,2);
plot(Ayy(1:N)); %��ܭ�l��FFT�ҭȵ��G
xlabel('�˼�');ylabel('�Ҽ�');title('FFT �ҭ�');

Ayy=Ayy/(N/2); %���⦨��ڪ��T��
Ayy(1)=Ayy(1)/2;
F=([1:N]-1)*Fs/N; %���⦨��ڪ��W�v��
subplot(3,2,3);
plot(F(1:N/2),Ayy(1:N/2)); %��ܴ���᪺FFT�ҭȵ��G
xlabel('�W�v(Hz)');ylabel('�T��(V)');title('�T��(V)-�W�v���u��');

PYf1 =20*log10(Ayy);
subplot(3,2,4);
plot(F(1:N/2),PYf1(1:N/2));
xlabel('�W�v(Hz)');ylabel('�T��(dB)');title('�T��(db)-�W�v���u��');

Pyy=[1:N/2];
for i=1:N/2
Pyy(i)=phase(Y(i)); %�p��ۦ�
Pyy(i)=Pyy(i)*180/pi; %���⬰����
end
subplot(3,2,5);
plot(F(1:N/2),Pyy(1:N/2)); %��ܬۦ��
title('�ۦ�-�W�v���u��');