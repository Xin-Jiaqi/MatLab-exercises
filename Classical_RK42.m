[t,y]=Classical_RK4(f,[0,1],2,0.1);f=@(x,y)y*(1-y^2);

y1=dsolve('Dy-y*(1-y^2)','y(0)=2','x');
ezplot(y1,[0,1])
hold on;
plot(t,y,'k.-','MarkerSize',20)
text([0.24,0.14],[1.418,1.6],{'解析解','4阶Runge-Kutta法求解结果'},...
    'fontname','隶书','fontsize',16)