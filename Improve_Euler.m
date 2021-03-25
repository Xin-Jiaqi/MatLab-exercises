function [x,y]=Improve_Euler(odefun,xspan,y0,h,varargin)
x=xspan(1):h:xspan(2);
N=length(x);
y=zeros(1,N);
y(1)=y0;
for k=1:N-1
    y1(k+1)=y(k)+h*feval(odefun,x(k),y(k),varargin{:});
    y(k+1)=y(k)+h/2*(feval(odefun,x(k),y(k),varargin{:})...
        +feval(odefun,x(k+1),y1(k+1),varargin{:}))
end
x=x';y=y';