% State Equation of the system if r_r1(t) = t
function xdot = fRamp1 (t,x)
xdot(1) = x(2);
if (x(1)> 0.1)
    xdot(2) = -2*x(2) -1;
elseif (x(1) < -0.1)
     xdot(2) = -2*x(2) + 5;
else
    xdot(2) = 2 -2*x(2)- 20*1.5*x(1);
end
xdot =xdot.';
end