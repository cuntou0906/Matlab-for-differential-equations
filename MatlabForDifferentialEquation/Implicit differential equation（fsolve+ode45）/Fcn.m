function dy = Fcn(t,y)
fun = @(dy)dy-2*t;
options=optimset('display','off');
dy = fsolve(fun,0,options) ;

