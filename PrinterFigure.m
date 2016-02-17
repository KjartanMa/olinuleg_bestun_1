function PrinterFigure(y, yest, DT)
%PrinterFigure 
%   Response of the ink-jet printer belt
%   model for the first second vs.
%   the measured values.

%Compare speed of printing device with speed of model for the first second
t1 = 0:DT:1;
plot(t1,y(1:length(t1)),'r*',t1,yest(1:length(t1)))
legend('Measurement','Model')
xlabel('Time [s]')
ylabel('Speed [m/s]')
end

