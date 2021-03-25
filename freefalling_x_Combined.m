function freefalling_x_Combined
%观察3种欧拉法下自由落体物体的运动轨迹情况的对比

t0=0;%时间
x0=0;%位移
g = 9.8;%重力加速度
fun = @(t,x)(g*t);
tn=10;%观察时间
[t1,x1] = Euler_forward(fun,t0,x0,tn);
[t2,x2] = Euler_backward(fun,t0,x0,tn);
[t3,x3] = Euler_Improved(fun,t0,x0,tn);

plot(t1,x1,'g');hold on;
plot(t2,x2,'b');
plot(t3,x3,'mo');

%对比一下
grid on;
time = 0:0.01:10;
velocity = g * time;
displacement = 1/2 * g * time.^2;
plot(time,displacement,'k');

legend('向前欧拉法','向后欧拉法','改进欧拉方法','精确解');
xlabel('时间t/s'),ylabel('下落高度h/m');
title('综合三种欧拉法对自由落体运动轨迹的观察');