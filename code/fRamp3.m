% State Equation of the system if r_r3(t) = 2t
function xdot = fRamp3 (t,x)
xdot(1) = x(2);
if (x(1)> 0.1)
    xdot(2) = -2*x(2) +1;
elseif (x(1) < -0.1)
     xdot(2) = -2*x(2) + 7;
else
    xdot(2) = 4 -2*x(2)- 20*1.5*x(1);
end
xdot =xdot.';
end