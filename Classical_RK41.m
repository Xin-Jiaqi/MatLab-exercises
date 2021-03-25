f=@(t,y)4*exp(0.8*t)-0.5*y;
[t,y]=Classical_RK4(f,[0,4],2,1);
y1=dsolve('Dy-4*exp(0.8*t)+0.5*y=0','y(0)=2','t');
ezplot(y1,[0,4])
hold on;
plot(t,y,'k.-','MarkerSize',20)
text([2,0.7],[10,45],{'解析解','4阶Runge-Kutta法求解结果'},...
    'fontname','隶书','fontsize',16)