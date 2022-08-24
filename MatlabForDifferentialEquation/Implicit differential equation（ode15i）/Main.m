clc;clear all;
t0 = 0;
tspan = [t0 5];
y0 = 0;
yp0 =1;

% 计算一致的初始条件
% ode15i 求解器需要一致的初始条件，即提供给求解器的初始条件必须满足
% 这个就是需要满足微分方程
[y0,dy0] = decic(@Fcn,t0,y0,1,yp0,0);
[t,y] = ode15i(@Fcn, tspan, y0,dy0);

figure(1)

plot(t,y,'-o')