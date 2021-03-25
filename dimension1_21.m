clear
H = 0.5;
W = 1;
L = 1.5;
h_w = 3.804;
h_t = 4.692;
h_b = 1.934;
c_p = 4178;
rou = 1000;
u_inf = 20;
u_in = 45;
m = 0.5;
lambda = 0.615
a = 0.5;%热扩散系数
v = 1;%流速
dx = 0.02;
x = 0:dx:1.5;%定义x
dt=0.0001;
t = 0:dt:5;%定义t
u = zeros(length(x),length(t));
u(:,1)=37;%初始温度
f = (W*(h_t+h_b)+2*H*h_w)*(u-u_inf)/(c_p*rou*W*H);
A=(1-2*a*dt/(dx^2))*eye(length(x)) + diag(ones(1,length(x)-1)*(a*dt/(dx^2)+v*dt/(2*dx)),-1) + diag(ones(1,length(x)-1)*(a*dt/(dx^2)-v*dt/(2*dx)),1);
for n = 1:length(t)-1
    u(:,n+1)=A*u(:,n)+f(:,n)*dt;%递推关系（12）
    u(1,n+1)=1000*m*dt*(u_in-u(1,n))/(rou*W*H*dx) + u(1,n);%边界条件 流入（17）
    u(end,n+1)=2*u(end-1,n+1) - u(end-2,n+1);%边界条件 流出（18）
end
[T,X]=meshgrid(t,x);
surf(X,T,u)
shading interp