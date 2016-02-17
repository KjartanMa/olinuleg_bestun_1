function  PrinterOptimize(noise, tolX, tolF, maxIter)
%PrinterOptimize Solve the ink-jet printer system.
%   Uses non-linear least-squares and state-space
%   representation to get the parameters of
%   an ink-jet printer belt system.
%   Input:
%       noise -- Boolean that is true if data w/noise
%                should be used for modeling.
%       tolX -- Minimum change in variables that will
%               halt the lsq method.
%       tolF -- Minimum change in output values that
%               will halt the lsq method.
%       maxIter -- Maximum amount of iterations allowed
%                  for the lsq method.

% Default values for the inputs.
if nargin < 3
    tolX = 1e-6;
    tolF = 1e-6;
end
if nargin < 4
    maxIter = 400;
end
% Get the data for the system.
load printerbelt.mat;
if noise
    y = ydata;
else
    y = ydatanf;
end
% Create the time vector.
n = length(y);
t = linspace(0, (n - 1)*DT, n);
% Create an initial guess for the values.
x0 = [-600 + 50*(rand(1) - 0.5);...
      -10 + 50*(rand(1) - 0.5);...
      -25 + 50*(rand(1) - 0.5);...
      -100 + 50*(rand(1) - 0.5)];
% Solve the system using non-linear least-squares
% and pring the results.
options = optimset('TolFun', tolF, 'TolX', tolX,...
                   'MaxIter', maxIter);
theta = lsqcurvefit(@(x, t) PrinterModel(x, t, udata),...
                    x0, t, y, [], [], options)
yest = PrinterModel(theta, t, udata);
PrinterFigure(y, yest, DT)
end

