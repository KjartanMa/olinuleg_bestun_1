function [z] = PrinterModel(x, t, udata)
%PrinterResiduals Get the printer model values.
%   Creates a state-space system for the
%   ink-jet printer belt system and calculates
%   the response of the system for given inputs.
%
%   Input:
%       x -- The system parameters.
%       t -- Time vector.
%       udata -- Input into the system.
%
%   Output:
%       z -- Output values of the system
%            according to the model.
% Calculate the state-space matrices.
theta = [0.15 200 x(1) x(2) x(3) x(4)];
A = [0 -1 theta(1); theta(2) 0 0; theta(3) theta(4) theta(5)];
B = [0; 0; theta(6)];
C = [0 1 0];
% Get the outputs of the state-space model.
sys = ss(A, B, C, 0);
z = lsim(sys, udata, t);
end

