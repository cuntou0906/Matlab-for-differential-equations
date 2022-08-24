clc;clear all;
tspan = [0 5];
y0 = 0;

figure(1)
[t,y] = ode45(@(t,y) 2*t, tspan, y0);
plot(t,y,'-o')

figure(2)
[t1,y2] = ode45(@Fcn, tspan, y0);
plot(t1,y2,'-o')