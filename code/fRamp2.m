% State Equation of the system if r_r2(t) = 1.5t
function xdot = fRamp2 (t,x)
xdot(1) = x(2);
if (x(1)> 0.1)
    xdot(2) = -2*x(2);
elseif (x(1) < -0.1)
     xdot(2) = -2*x(2) + 6;
else
    xdot(2) = 3 -2*x(2)- 20*1.5*x(1);
end
xdot =xdot.';
end