f1 = 'D2x*D1x+3*D1x+x=exp(t)'
y1 = De_order_diffequa( f1 , 2)

f2 = sym('[D2x1+D1x2+D1x1+x1 = 0; D2x2+D1x2+D1x1*D1x2 = 0]')
y2 = De_order_diffequa( f2 , [2 2])

f3 = sym('[D3x1+D2x1*x2+3*D1x1+x1 = 0; D1x2-D2x1 = 0]')
y3 = De_order_diffequa( f3 , [3 1])

f4 = sym('D5x-D4x/t=0')
y4 = De_order_diffequa( f4 , 5)

f5 = sym('[D5x1+D3x1*x2+3*D1x1+x1 = exp(t); D1x2-D2x1+D3x1+exp(t) = 0]')
y5 = De_order_diffequa( f5 , [5 1])

[t fout] = ode45('sys',[0,20],[0 1]);