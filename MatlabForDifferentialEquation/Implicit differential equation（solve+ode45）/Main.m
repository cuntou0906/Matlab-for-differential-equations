clc;clear all;
syms dy t y
eq = dy-2*t;

dy = solve(eq,dy) 

matlabFunction(dy,'File','Fcn','Vars',[t,y]);

tspan = [0 5];
y0 = 0;

figure(1)

[t,y] = ode45(@Fcn, tspan, y0);

plot(t,y,'-o')