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
u_in = 45;
c_p = 4178;
m = 0:0.001:0.5;
u = (m*c_p*u_in + u_inf*((h_t+h_b)*L*W+h_w*(2*H*W+2*H*L))+u_body*h_body*L_body*c_body)./(m*c_p + (h_t+h_b)*L*W+h_w*(2*H*W+2*H*L)+h_body*L_body*c_body);
plot(m,u)
grid on
title('Effect of Varying Mass Flow')
xlabel('Mass Flow[kg/s]')
ylabel('Steady Water Temp[℃]')