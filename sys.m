function y = sys( t,x )
 y = [                  x(2)
 -(x(1) + 3*x(2) - exp(t))/x(2)];
end

