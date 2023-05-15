clear all
close all
clc

acc = [10 10 10 10 9.95 9 9.3 9.8 9.8 9.7 10 9.95 10.35 10.55 10.15 10.05 10.75 11.05 11.05 11 10.5 10.75 10.65 11.15 10.4 9.7 10 9.9 10 9.9 9.9 9.75 9.95 9.95 9.95 9.65 9.55 9.25 9.2 9.5 9.85 10.3 10.55 10.15 10.55 10.6 10.75 10.4 10.45 10.95 11.35 11.15 10.55 11 10.4 9.55 9.8 9.6 9.55 9.55 9.7 9.85 9.95 10 9.55 9.95 9.95 9.6 9.05 8.9 9.55 9.75 9.95 10.3 10.45 11 11 11.05 11.15 11.4 11.15 10.85 11.15 10.25 10.2 9.65 9.25 9.65 9.6 9.8 8.6 9.9 9.95 10 9.95 9.95 9.95 10 9.95 10];
acc_m = mean(acc, "all")
acc = acc - acc_m
acc = -1*acc
%time = zeroes(1, length(acc))
%time = [0.2:0.2:14]
time = [13.097 13.199 13.301 13.402 13.504 14.147 14.249 14.351 14.453 14.555 14.731 14.833 14.935 15.036 15.138 15.518 15.62 15.722 15.824 15.925 16.121 16.223 16.325 16.427 16.529 17.536 17.638 17.74 17.841 17.943 18.095 18.197 18.299 18.4 18.502 18.654 18.756 18.858 18.96 19.062 19.414 19.516 19.618 19.72 19.822 19.99 20.092 20.194 20.296 20.398 20.574 20.676 20.778 20.879 20.981 21.158 21.26 21.362 21.464 21.566 21.742 21.844 21.945 22.047 22.149 22.362 22.464 22.566 22.668 22.769 22.947 23.049 23.15 23.252 23.356 23.534 23.635 23.737 23.839 23.941 24.141 24.243 24.345 24.447 24.548 24.761 24.863 24.964 25.066 25.168 25.371 25.473 25.575 25.677 25.778 25.978 26.079 26.181 26.283 26.385];
time = time - time(1)
%time = diff(time)
%time = [ 0 time]
%time = round(time, 1)
figure(1)
subplot(2,1,1);
plot(time,acc)
xlabel('Time (sec)');
ylabel('Acceleration (m/sec^2)');

fs = 10; % Sampling Rate
fc = .6; % Cut off Frequency
order = 20; % 6th Order Filter
L  = length(acc);
f = (1:L/2+1)*fs/L;

acc_f = fft(acc);
acc_f = acc_f(1:L/2+1);
subplot(2,1,2);
plot(f,abs(acc_f/L));
hold on; 

acc = detrend(acc);  
%accf = smoothdata(acc,100);
[b1 a1] = butter(order,fc/(fs/2),'low');
accf=filtfilt(b1,a1,acc);
%accf = lowpass(acc,fc/(fs/2));
temp = fft(accf);
temp = temp(1:L/2+1);
plot(f,abs(temp/L))
% hold on;
% [h w] = freqz(accf)
% h = h(1:L/2+1)
% plot(f,abs(h/L))
% hold off;
hold off;

acc_m1 = mean(accf, "all");
accf = accf - acc_m1;
figure (2)
plot(time,accf,'b'); hold on
plot(time,acc)
xlabel('Time (sec)')
ylabel('Acceleration (m/sec^2)')

velocity=cumtrapz(time,accf);
velocity = detrend(velocity); 
figure (3)
plot(time,velocity)
xlabel('Time (sec)')
ylabel('Velocity (m/sec)')
 
% [b2 a2] = butter(order,fc/(fs / 2),'high');
% velf = filtfilt(b2,a2,velocity);
velf = velocity;

%velf = detrend(velf);
Displacement=cumtrapz(time, velf);
Displacement = detrend(Displacement); 
%Displacement = Displacement - min(Displacement)
%Displacement = Displacement - Disp_m;
figure(4)
plot(time,Displacement)
xlabel('Time (sec)')
ylabel('Displacement (m)')