clc;clear all;
t0 = 0;
tspan = [t0 5];
y0 = 0;
yp0 =1;

% ����һ�µĳ�ʼ����
% ode15i �������Ҫһ�µĳ�ʼ���������ṩ��������ĳ�ʼ������������
% ���������Ҫ����΢�ַ���
[y0,dy0] = decic(@Fcn,t0,y0,1,yp0,0);
[t,y] = ode15i(@Fcn, tspan, y0,dy0);

figure(1)

plot(t,y,'-o')