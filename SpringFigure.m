function SpringFigure(theta)
%SpringFigure
%    Draw a figure of the spring-damper-system
%    when going over a stone on an otherwise
%    flat road.
A = [0 1; theta(1) theta(2)];
B = [0; theta(3)];
C = [1 0];
%Create new state space
sys=ss(A,B,C,0); 
%Sampling rate
DF=0.01;
%time vector
t=0:DF:25;
%Simulate bump in the road using a gauss function
c=2;
sigma=0.15;
h=0.1;
u=h*exp(-(t-c).^2/(2.*sigma));
%graph input and output
y = lsim(sys,u,t);
hAx = plotyy(t,u,t,y)
xlabel('Time [s]');
ylabel(hAx(1),'Input [N]');
ylabel(hAx(2),'Position [m]');
end

