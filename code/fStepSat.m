% State Equation of the system if r_u(t) = 2
function xdot = fStepSat (t,x)
xdot(1) = x(2);
if (x(1)> 0.1)
    xdot(2) = -2*x(2) -3;
elseif (x(1) < -0.1)
     xdot(2) = -2*x(2) + 3;
else
    xdot(2) = -2*x(2)- 20*1.5*x(1);
end
xdot =xdot.';
end