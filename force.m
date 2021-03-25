function [F_L,F_D] = force(omega)
%计算单个叶片受力
%F_L为升力
%F_D为阻力

global rou;%空气密度
global R;%叶片长度
global d;%叶片宽度
global theta;%叶片倾角

[C_L,C_D] =  coefficient(theta)%根据叶片倾角计算升阻力系数

F_L = 1/6 * rou * omega^2 * d * C_L * R^3;

F_D = 1/6 * rou * omega^2 * d * C_D * R^3;