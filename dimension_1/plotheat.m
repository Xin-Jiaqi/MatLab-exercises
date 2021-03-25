L = 1;
x = linspace(0,L,100);
t = [linspace(0,0.05,100), linspace(0.5,5,100)];
m = 0;
sol = pdepe(m,@heatpde,@heatic,@heatbc,x,t);
colormap hot
imagesc(x,t,sol)
colorbar
xlabel('Distance x','interpreter','latex')
ylabel('Time t','interpreter','latex')
title('Heat Equation for $0 \le x \le 1$ and $0 \le t \le 5$','interpreter','latex')