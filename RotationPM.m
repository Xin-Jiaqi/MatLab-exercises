clc,clear
close all
clear;

%global R d theta m omega0 J rou n g%定义全局变量

R = 8.5/100;%叶片长8.5cm
d = 1.7/100;%叶片宽1.7cm
theta = 10*pi/180;%叶片倾角为10deg
m = 3.7/1000;%竹蜻蜓整体的质量为3.7g
%omega0 = (900/60) * (2 * pi);%竹蜻蜓初始角速度 RPM—>r/s—>rad/s
J = 2.33e-5;%竹蜻蜓的转动惯量为2.33e-5kg*m^2

RPM = 830:1000;%角度变化范围
record1 = zeros(1:size(RPM));%创建一个空数组用以记录最大高度
record2 = zeros(1:size(RPM));%创建一个空数组用以记录爬升时间
i = 0;%计数器
for omega0 = (RPM/60) * (2 * pi)
    i = i+1;
    [t_highest,h_max] = calculation2(omega0,J,d,R,theta,m);
    record1(i) = h_max;
    record2(i) = t_highest;
end
subplot(1,2,1),plot(RPM,record1),title('最大高度');
subplot(1,2,2),plot(RPM,record2),title('爬升时间');