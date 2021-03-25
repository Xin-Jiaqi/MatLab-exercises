a=0:0.01:pi/2;
CL1=2*pi*sin(a);
CL2=2*sin(a).*cos(a);
y=0.5*tanh(20*(a-pi/12))+0.5;
CL=(1-y).*CL1+y.*CL2;
CD=2*sin(a).^2;
plot(a,CL);
hold on;
plot(a,CD)