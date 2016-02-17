function [residual] = SpringResiduals(input)
%SpringResiduals Residual vector for the spring problem.
%   Calculates the residual matrixes for the
%   spring-mass-damper system by using the equations:
%   Aid = T^-1AT, Bid = T^-1B and Cid = C*T.
%
%   Input:
%       Vector containing the entries of the T matrix,
%       as well as the values of the theta vector.
%
%   Output:
%       The residual vector.

% Setup the identity matrices.
Aid = [-0.1184 -0.4082; 0.4082 -0.2816];
Bid = [0.3195; -0.3195];
Cid = [0.3195 0.3195];
% Setup the model properties.
T = [input(1) input(2); input(3) input(4)];
A = [0 1; input(5) input(6)];
B = [0; input(7)];
C = [1 0];
% Calculate the residual matrices.
Ax = T*Aid - A*T;
Bx = T*Bid - B;
Cx = Cid - C*T;
% Create the residual vector.
residual = [ Ax(1, 1); Ax(1, 2); Ax(2, 1); Ax(2, 2);...
             Bx(1); Bx(2);...
             Cx(1); Cx(2)];
end

