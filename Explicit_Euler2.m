f=@(x,y)y*(1-y^2);
[x,y]=Explicit_Euler(f,[0,1],2,0.1);
y1=dsolve('Dy-y*(1-y*y)=0','y(0)=2','x');
ezplot(y1,[0,1])
hold on;
plot(x,y,'k.-','MarkerSize',20)
text([0.1,0.06236],[1.1,1.9],{'Euler法求解结果','解析解'},...
    'fontname','隶书','fontsize',16)