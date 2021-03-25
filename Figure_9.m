clc;clear;
L_body = 1;
c_body = 0.5;
u_body = 37;
h_body = 43;
H = 0.5;
W = 1;
L = 1.5;
h_w = 3.804;
h_t = 4.692;
h_b = 1.934;
u_inf = 20;
u_in = 35:0.1:50;
c_p = 4178;
m = 0.05;
u = (m*c_p*u_in + u_inf*((h_t+h_b)*L*W+h_w*(2*H*W+2*H*L))+u_body*h_body*L_body*c_body)./(m*c_p + (h_t+h_b)*L*W+h_w*(2*H*W+2*H*L)+h_body*L_body*c_body);
plot(u_in,u)
grid on
title('Effect of Water Temperature from the Faucet')
xlabel('Uin[℃]')
ylabel('Steady Water Temp[℃]')