% Example on how to do a discrete Fourier transform (FFT) and to plot the amplitude and phase spectrum in MATLAB
% Author: Mathias Magdowski
% E-Mail: mathias.magdowski@ovgu.de
% Date: 2021-04-21

% clear the workspace
clear all
% clear all open figures
close all

% load the raw data from a text file -> matrix
rawdata=load('data.dat');
% get the time stamps (in s) -> vector
t=rawdata(:,1);
% get the values of the time function (in N) -> vector
F_x=rawdata(:,2);
% plot the time function
figure(1)
plot(t,F_x)
grid on
xlabel('Time in s')
ylabel('Time-dependent force in N')

% calculate the spectrum and the corresponding frequency using a discrete Fourier transform -> vector
[f,F_x_f]=fourier(t,F_x,'sinus');

% plot the magnitude spectrum
figure(2)
stem(f,abs(F_x_f))
grid on
xlim([0,20])
xlabel('Frequency in Hz')
ylabel('Amplitude spectrum of the force in N')

% plot the phase spectrum
figure(3)
stem(f,angle(F_x_f)*180/pi)
grid on
xlim([0,20])
xlabel('Frequency in Hz')
ylabel('Phase spectrum of the force in °')
