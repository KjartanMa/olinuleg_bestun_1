function [z] = PrinterModel(x, t, udata)
%PrinterResiduals Calculate the values of the model of the printer system.
%   Creates a state-space system for the ink-jet printer system and
%   calculates the response of the system for given inputs.
%
%   Input:
%       The system variables, as well as the time and input measurements.
%
%   Output:
%       The output of the systems for the given time points.

% Calculate the state-space matrices.
theta = [0.15 200 x(1) x(2) x(3) x(4)];
A = [0 -1 theta(1); theta(2) 0 0; theta(3) theta(4) theta(5)];
B = [0; 0; theta(6)];
C = [0 1 0];
% Get the outputs of the state-space model.
sys = ss(A, B, C, 0);
z = lsim(sys, udata, t);
end

