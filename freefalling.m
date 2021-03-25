function freefalling
%观察3种欧拉法下自由落体物体的运动状况与能量守恒情况的对比

t0=0;%时间
x0=0;%位移
g = 9.8;%重力加速度
fun = @(t,x)(g*t);
tn=10;%观察时间
[t1,x1] = Euler_forward(fun,t0,x0,tn);
[t2,x2] = Euler_backward(fun,t0,x0,tn);
[t3,x3] = Euler_Improved(fun,t0,x0,tn);

m = 1;%随便定义个质量：1kg
h = 1000;%随便定义个释放高度：1000米
Ek1 = 1/2 * m * (g * t1).^2;Ek2 = 1/2 * m * (g * t2).^2;Ek3 = 1/2 * m * (g * t3).^2;
Ep1 = m * g * (1000 - x1);Ep2 = m * g * (1000 - x2);Ep3 = m * g * (1000 - x3);
E1 = Ek1 + Ep1;E2 = Ek2 + Ep2;E3 = Ek3 + Ep3;
time = 0:0.01:10;
velocity = g * time;
displacement = 1/2 * g * time.^2;

%运动轨迹
subplot(1,2,1),
plot(t1,x1,'g');hold on;
plot(t2,x2,'b');
plot(t3,x3,'mo');
plot(time,displacement,'k');
legend('向前欧拉法','向后欧拉法','改进欧拉方法','精确解');
xlabel('时间t/s'),ylabel('下落高度h/m');
title('三种欧拉法轨迹对比');

%能量
subplot(1,2,2),
plot(t1,E1,'g');hold on;
plot(t2,E2,'b');
plot(t3,E3,'mo');
Ek4 = 1/2 * m * velocity.^2;
Ep4 = m * g * (1000 - displacement);
E4 = Ek4 + Ep4;
plot(time,E4,'k');
legend('向前欧拉法','向后欧拉法','改进欧拉方法','精确解');
xlabel('时间t/s'),ylabel('能量E/J');
title('三种欧拉法能量对比');