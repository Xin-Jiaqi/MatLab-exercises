clc,clear
close all
clear;

t_test = 4;%观察的时间区间
t = 0:0.01:t_test;%t为时间数组

rou = 1.29;%空气密度1.29kg/m^3
R = 8.5/100;%叶片长8.5cm
d = 1.7/100;%叶片宽1.7cm
theta = 10*pi/180;%叶片倾角为10deg
J = 2.33e-5;%竹蜻蜓的转动惯量为2.33e-5kg*m^2
n = 2;%双叶片竹蜻蜓
omega0 = (900/60) * (2 * pi);%竹蜻蜓初始角速度 RPM—>r/s—>rad/s
m = 3.7/1000;%竹蜻蜓整体的质量为3.7g
g = 9.8;%重力加速度

[C_L,C_D] =  coefficient(theta);%获得升阻力系数

D = (rou * d * C_D * R^4 * n) / (12*J);
H = (n * rou * d * C_L * R^3) / (6*m);

omega = 1./(D * t + 1/omega0);%角速度随时间的递减关系 数组

%v_y = H * omega.^2 .* t - g * t;%数值速度随时间变化关系 数组 old
v_y = (H/D) * (omega0 - 1./(D*t + 1/omega0)) - g*t;%数值速度随时间变化关系 数组 yong
t_highest = size(find(v_y > 0))/size(t) * t_test%求出爬升时间