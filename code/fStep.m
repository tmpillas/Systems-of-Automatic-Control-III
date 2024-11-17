% State Equation of the system if r_u(t) = 2
function xdot = fStep(t,x)
xdot(1) = x(2);
xdot(2) = -2*x(2) - 20*x(1);
xdot = xdot.';
end
