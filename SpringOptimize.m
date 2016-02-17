function  SpringOptimize(tolX, tolF, maxIter)
%UNTITLED Solve the spring-mass-damper system using lsq.
%   Uses non-linear least-squares and state-space
%   representation to get the coefficents of the
%   spring-mass-damper system.
%   Input:
%       tolX -- Minimum change in variables that will
%               halt the lsq method.
%       tolF -- Minimum change in output values that
%                will halt the lsq method.
%       maxIter -- Maximum amount of iterations allowed
%                  for the lsq method.
% Default values for the inputs.
if nargin < 2
    tolX = 1e-6;
    tolF = 1e-6;
end
if nargin < 3
    maxIter = 400;
end
% Set the options for the lsq method.
options = optimset('TolX', tolX, 'TolFun', tolF,...
                   'MaxIter', maxIter, 'Display', 'iter');
% Initial values for the fitting method.
% Use values randomly distributed around the
% real values.
x0 = [0.3 + 50*(rand(1) - 0.5) ...
      0.3 + 50*(rand(1) - 0.5) ...
      0.1 + 50*(rand(1) - 0.5) ...
      -0.2 + 50*(rand(1) - 0.5) ...
      -0.2 + 50*(rand(1) - 0.5) ...
      -0.4 + 50*(rand(1) - 0.5) ...
      0.1 + 50*(rand(1) - 0.5)];
% Solve the system and print the result.
x = lsqnonlin(@(x) SpringResiduals(x), x0, [], [],...
              options);
T = [x(1) x(2); x(3) x(4)]
theta = [x(5); x(6); x(7)]
m = 1.0/x(7)
b = -x(6)*m
k = -x(5)*m
SpringFigure(theta);

