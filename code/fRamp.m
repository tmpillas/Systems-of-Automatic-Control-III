% State Equation of the system if r_r(t) = t
function xdot = fRamp(t,x)
xdot(1) = x(2);
xdot(2) = 2 - 2*x(2) - 20*x(1);
xdot = xdot.';
end