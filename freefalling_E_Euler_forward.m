function freefalling_E_Euler_forward
%观察向前欧拉法下自由落体物体的能量是否守恒

t0=0;%时间
x0=0;%位移
g = 9.8;%重力加速度
fun = @(t,x)(g*t);
tn=10;%观察时间
[t,x] = Euler_forward(fun,t0,x0,tn);

m = 1;%随便定义个质量：1kg
h = 1000;%随便定义个释放高度：1000米
Ek = 1/2 * m * (g * t).^2;
Ep = m * g * (1000 - x);
E = Ek + Ep;
plot(t,E,'g');

%对比一下
hold on;
grid on;
time = 0:0.01:10;
velocity = g * time;
displacement = 1/2 * g * time.^2;
Ek1 = 1/2 * m * velocity.^2;
Ep1 = m * g * (1000 - displacement);
E1 = Ek1 + Ep1;
plot(time,E1,'b');

legend('向前欧拉法','精确解');
xlabel('时间t/s'),ylabel('能量E/J');
title('向前欧拉法 vs 精确解');