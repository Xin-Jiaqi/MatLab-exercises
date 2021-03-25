function [C_L,C_D] =  coefficient(theta)

%该函数根据叶片倾角计算升阻力系数
%C_L为升力系数
%C_D为阻力系数

C_D = 2 * sin(theta)^2;

y = 0.5 * tanh(20 * (theta - pi/12)) + 0.5;
C_L1 = 2 * pi * sin(theta);
C_L2 = 2 * sin(theta) * cos(theta);
C_L = (1-y) * C_L1 + y * C_L2;