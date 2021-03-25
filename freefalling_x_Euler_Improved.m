function freefalling_x_Euler_Improved
%观察改进欧拉法下自由落体物体的轨迹

t0=0;%时间
x0=0;%位移
g = 9.8;%重力加速度
fun = @(t,x)(g*t);
tn=10;%观察时间
[t,x] = Euler_Improved(fun,t0,x0,tn);
plot(t,x,'go');

%对比一下
hold on;
grid on;
time = 0:0.01:10;
displacement = 1/2 * g * time.^2;
plot(time,displacement,'b');

legend('改进欧拉','精确解');
xlabel('时间t/s'),ylabel('下落高度h/m');
title('改进欧拉法 vs 精确解');