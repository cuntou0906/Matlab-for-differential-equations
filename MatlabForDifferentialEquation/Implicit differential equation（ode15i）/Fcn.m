function fcn = Fcn(t,y,dy)
%WEISSINGER  Evaluate the residual of the Weissinger implicit ODE
%
%   See also ODE15I.

%   Jacek Kierzenka and Lawrence F. Shampine
%   Copyright 1984-2014 The MathWorks, Inc.

fcn = dy - t.*2.0;
