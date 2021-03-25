function [x,y]=Classical_RK2(odefun,xspan,y0,h,varargin)
x=xspan(1):h:xspan(2);
N=length(x);
y=zeros(1,N);
y(1)=y0;
for k = 1:length(x)-1
    K1=feval(odefun,x(k),y(k),varargin{:});
    K2=feval(odefun,x(k)+h/2,y(k)+h/2*K1,varargin{:});
    y(k+1)=y(k)+h*K2;
end
x=x';y=y';