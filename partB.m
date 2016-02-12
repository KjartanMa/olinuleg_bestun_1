n = length(ydata);
t = linspace(0, (n - 1)*DT, n);
x0 = [-600 + 10*rand(1);...
      -10 + 10*rand(1);...
      -25 + 10*rand(1);...
      -100 + 10*rand(1)];
x = lsqcurvefit(@(x, t) PrinterModel(x, t, udata),...
                x0, t, ydata)
