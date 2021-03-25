function [t_highest,h_max] = calculation2(omega0,J,d,R,theta,m)

t_test = 10;%观察的时间区间
t = 0:0.01:t_test;%t为时间数组

rou = 1.29;%空气密度1.29kg/m^3
n = 2;%双叶片竹蜻蜓
g = 9.8;%重力加速度

[C_L,C_D] =  coefficient(theta);%获得升阻力系数

D = (rou * d * C_D * R^4 * n) / (12*J);
H = (n * rou * d * C_L * R^3) / (6*m);
G = H *m;

omega = 1./(D * t + 1/omega0);%角速度随时间的递减关系 数组
%F_Lz = G * omega.^2;%上升力随时间变化的关系
%v_y = H * omega.^2 .* t - g * t;%数值速度随时间变化关系 数组 old
v_y = (H/D) * (omega0 - 1./(D*t + 1/omega0)) - g*t;
%数值速度随时间变化关系 数组 yong
h = ((H*omega0)/D)*t - 1/2*g*t.^2 - H/D^2*log(omega0) - H/D^2*log(D*t+1/omega0);

t_highest = size(find(v_y > 0))/size(t) * t_test;%爬升时间
h_max = max(h);%最大爬升高度