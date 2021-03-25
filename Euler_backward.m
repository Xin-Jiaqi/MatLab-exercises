function [X,Y] = Euler_backward(fun,x0,y0,xn,n)
%向后欧拉方法
%fun为dy/dx=f(x,y)等号的右端
%x0、xn为自变量初值与终值
%y0为因变量初值
%n为取点数

if nargin<5 | n <= 0
    n = 100; %如果只输入四个参数，则默认取100个点
end

h = (xn - x0)/n;
%根据取点数计算步长

X = zeros(n,1);
Y = zeros(n,1);
%初始化自变量与因变量
Y1 = zeros(n,1);
%Y1为向后欧拉法所需要的辅助变量

i = 1;%i为“计数器”（Matlab从1开始计数）
X(i) = x0;
Y(i) = y0;
Y1(i) = y0;

for i = 1:n
    X(i+1) = X(i) + h;
    Y1(i+1) = Y1(i) + h*feval(fun,X(i),Y(i));
    Y(i+1) = Y(i) + h*feval(fun,X(i+1),Y1(i+1));
    Y1(i+1) = Y(i+1);
    i = i + 1;
end
  
