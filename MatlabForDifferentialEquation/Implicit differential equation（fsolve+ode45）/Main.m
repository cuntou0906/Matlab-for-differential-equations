clc;clear all;
tspan = [0 5];
y0 = 0;

figure(2)
[t1,y2] = ode45(@Fcn, tspan, y0);
plot(t1,y2,'-o')