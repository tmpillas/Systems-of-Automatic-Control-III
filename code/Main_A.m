InitialValuesY = [-2 0; 1 0; 0 0.5; 2 2; 2.5 -1; 1.1 2];
InitialValuesRu = [2 0; 2 0; 2 0; 2 0; 2 0; 2 0];
InitialValuesRr = [0 1; 0 1; 0 1; 0 1; 0 1; 0 1];
InitialValuesE_step = InitialValuesRu - InitialValuesY;
InitialValuesE_ramp = InitialValuesRr - InitialValuesY;
InitialValuesRr1 = [0 1; 0 1; 0 1; 0 1; 0 1; 0 1];
InitialValuesRr2 = [0 1.5; 0 1.5; 0 1.5; 0 1.5; 0 1.5; 0 1.5];
InitialValuesRr3 = [0 2; 0 2; 0 2; 0 2; 0 2; 0 2];
InitialValuesE_ramp1 = InitialValuesRr1 - InitialValuesY;
InitialValuesE_ramp2 = InitialValuesRr2 - InitialValuesY;
InitialValuesE_ramp3 = InitialValuesRr3 - InitialValuesY;

% QUESTION 1
%For r_u(t) = 2:
%Plots of the step responses of state for all initial values
for i = 1:6
    figure(i)
    opts = odeset('Refine',5);
    [t1, state] = ode45(@fStep,[0,5],[InitialValuesE_step(i,1) InitialValuesE_step(i,2)]);
    plot(t1, state)
    xlabel('time (s)')
    ylabel('state values')
    title("Step Response for initial values x1(0) = " + InitialValuesE_step(i,1) + " , x2(0) = " + InitialValuesE_step(i,2));
    legend('x1','x2')
    grid on    
end  

%Plots of the phase portrait for all initial values
for i = 1:6
    figure(i+6)
    opts = odeset('Refine',5);
    [t1, state] = ode45(@fStep,[0,5],[InitialValuesE_step(i,1) InitialValuesE_step(i,2)]);
    x1 = state(:,1);
    x2 = state(:,2);
    plot(x1,x2);
    title("Phase portrait for initial values x1(0) = " + InitialValuesE_step(i,1) + " , x2(0) = " + InitialValuesE_step(i,2));
    xlabel('x1');
    ylabel('x2');
    grid on
end

%Plots of the responses of input (r) and output (y) for all initial values
for i = 1:6
    figure(i+12)
    opts = odeset('Refine',5);
    [t1, state] = ode45(@fStep, [0,5],[InitialValuesE_step(i,1) InitialValuesE_step(i,2)]);
    x1 = state(:,1);
    y = 2- x1;
    RY = zeros((size(y,1)),2);
    RY(:,1) = y;
    RY(:,2) = 2;
    plot(t1,RY);
    xlabel('time (s)')
    ylabel('y,r values')
    title("Output and input response for initial values x1(0) = " + InitialValuesE_step(i,1) + " , x2(0) = " + InitialValuesE_step(i,2));
    legend('output (y)','input (r)')
    grid on
end


%For r_r(t) = t
%Plots of the ramp responses of state for all initial values
for i = 1:6
    figure(i+18)
    opts = odeset('Refine',5);
    [t1, state] = ode45(@(t1,state) fRamp(t1,state),[0,5],[InitialValuesE_ramp(i,1) InitialValuesE_ramp(i,2)]);
    plot(t1, state)
    xlabel('time (s)')
    ylabel('state values')
    title("Ramp Response for initial values x1(0) = " + InitialValuesE_ramp(i,1) + " , x2(0) = " + InitialValuesE_ramp(i,2));
    legend('x1','x2')
    grid on    
end  
%Plots of the phase portrait for all initial values
for i = 1:6
    figure(i+24)
    opts = odeset('Refine',5);
    [t1, state] = ode45(@(t1,state) fRamp(t1,state),[0,5],[InitialValuesE_ramp(i,1) InitialValuesE_ramp(i,2)]);
    x1 = state(:,1);
    x2 = state(:,2);
    plot(x1,x2);
    title("Phase portrait for initial values x1(0) = " + InitialValuesE_ramp(i,1) + " , x2(0) = " + InitialValuesE_ramp(i,2));
    xlabel('x1');
    ylabel('x2');
    grid on
end
%Plots of the responses of input (r) and output (y) for all initial values
for i = 1:6
    figure(i+30)
    opts = odeset('Refine',5);
    [t1, state] = ode45(@(t1,state) fRamp(t1,state), [0,5],[InitialValuesE_ramp(i,1) InitialValuesE_ramp(i,2)]);
    x1 = state(:,1);
    y = t1- x1;
    RY = zeros((size(y,1)),2);
    RY(:,1) = y;
    RY(:,2) = t1;
    plot(t1,RY);
    xlabel('time (s)')
    ylabel('y,r values')
    title("Output and input response for initial values x1(0) = " + InitialValuesE_ramp(i,1) + " , x2(0) = " + InitialValuesE_ramp(i,2));
    legend('output (y)','input (r)')
    grid on
end

%QUESTION 2
%For r_u(t) = 2:
%Plots of the step responses of state for all initial values
for i = 1:6
    figure(i+36)
    opts = odeset('Refine',15);
    [t1, state] = ode45(@fStepSat,[0,8],[InitialValuesE_step(i,1) InitialValuesE_step(i,2)]);
    plot(t1, state)
    xlabel('time (s)')
    ylabel('state values')
    title("Step Response for initial values x1(0) = " + InitialValuesE_step(i,1) + " , x2(0) = " + InitialValuesE_step(i,2));
    legend('x1','x2')
    grid on    
end  

%Plots of the phase portrait for all initial values
for i = 1:6
    figure(i+6+36)
    opts = odeset('Refine',15);
    [t1, state] = ode45(@fStepSat,[0,8],[InitialValuesE_step(i,1) InitialValuesE_step(i,2)]);
    x1 = state(:,1);
    x2 = state(:,2);
    plot(x1,x2);
    title("Phase portrait for initial values x1(0) = " + InitialValuesE_step(i,1) + " , x2(0) = " + InitialValuesE_step(i,2));
    xlabel('x1');
    ylabel('x2');
    grid on
end

%Plots of the responses of input (r) and output (y) for all initial values
for i = 1:6
    figure(i+12+36)
    opts = odeset('Refine',15);
    [t1, state] = ode45(@fStepSat, [0,8],[InitialValuesE_step(i,1) InitialValuesE_step(i,2)]);
    x1 = state(:,1);
    y = 2- x1;
    RY = zeros((size(y,1)),2);
    RY(:,1) = y;
    RY(:,2) = 2;
    plot(t1,RY);
    xlabel('time (s)')
    ylabel('y,r values')
    title("Output and input response for initial values x1(0) = " + InitialValuesE_step(i,1) + " , x2(0) = " + InitialValuesE_step(i,2));
    legend('output (y)','input (r)')
    grid on
end

%For r_r1(t) = t
%Plots of the ramp responses of state for all initial values
for i = 1:6
    figure(i+18+36)
    opts = odeset('Refine',15);
    [t1, state] = ode45(@(t1,state) fRamp1(t1,state),[0,8],[InitialValuesE_ramp1(i,1) InitialValuesE_ramp1(i,2)]);
    plot(t1, state)
    xlabel('time (s)')
    ylabel('state values')
    title("Ramp Response (r1) for initial values x1(0) = " + InitialValuesE_ramp1(i,1) + " , x2(0) = " + InitialValuesE_ramp1(i,2));
    legend('x1','x2')
    grid on    
end  
%Plots of the phase portrait for all initial values
for i = 1:6
    figure(i+24+36)
    opts = odeset('Refine',15);
    [t1, state] = ode45(@(t1,state) fRamp1(t1,state),[0,8],[InitialValuesE_ramp1(i,1) InitialValuesE_ramp1(i,2)]);
    x1 = state(:,1);
    x2 = state(:,2);
    plot(x1,x2);
    title("Phase portrait for initial values x1(0) = " + InitialValuesE_ramp1(i,1) + " , x2(0) = " + InitialValuesE_ramp1(i,2));
    xlabel('x1');
    ylabel('x2');
    grid on
end
%Plots of the responses of input (r) and output (y) for all initial values
for i = 1:6
    figure(i+30+36)
    opts = odeset('Refine',15);
    [t1, state] = ode45(@(t1,state) fRamp1(t1,state), [0,8],[InitialValuesE_ramp1(i,1) InitialValuesE_ramp1(i,2)]);
    x1 = state(:,1);
    y = t1- x1;
    RY = zeros((size(y,1)),2);
    RY(:,1) = y;
    RY(:,2) = t1;
    plot(t1,RY);
    xlabel('time (s)')
    ylabel('y,r values')
    title("Output and input response for initial values x1(0) = " + InitialValuesE_ramp1(i,1) + " , x2(0) = " + InitialValuesE_ramp1(i,2));
    legend('output (y)','input (r)')
    grid on
end

%For r_r2(t) = 1.5t
%Plots of the ramp responses of state for all initial values
for i = 1:6
    figure(i+36+36)
    opts = odeset('Refine',15);
    [t1, state] = ode45(@(t1,state) fRamp2(t1,state),[0,8],[InitialValuesE_ramp2(i,1) InitialValuesE_ramp2(i,2)]);
    plot(t1, state)
    xlabel('time (s)')
    ylabel('state values')
    title("Ramp Response (r2) for initial values x1(0) = " + InitialValuesE_ramp2(i,1) + " , x2(0) = " + InitialValuesE_ramp2(i,2));
    legend('x1','x2')
    grid on    
end  
%Plots of the phase portrait for all initial values
for i = 1:6
    figure(i+42+36)
    opts = odeset('Refine',15);
    [t1, state] = ode45(@(t1,state) fRamp2(t1,state),[0,8],[InitialValuesE_ramp2(i,1) InitialValuesE_ramp2(i,2)]);
    x1 = state(:,1);
    x2 = state(:,2);
    plot(x1,x2);
    title("Phase portrait for initial values x1(0) = " + InitialValuesE_ramp2(i,1) + " , x2(0) = " + InitialValuesE_ramp2(i,2));
    xlabel('x1');
    ylabel('x2');
    grid on
end
%Plots of the responses of input (r) and output (y) for all initial values
for i = 1:6
    figure(i+48+36)
    opts = odeset('Refine',15);
    [t1, state] = ode45(@(t1,state) fRamp2(t1,state), [0,8],[InitialValuesE_ramp2(i,1) InitialValuesE_ramp2(i,2)]);
    x1 = state(:,1);
    y = t1- x1;
    RY = zeros((size(y,1)),2);
    RY(:,1) = y;
    RY(:,2) = t1;
    plot(t1,RY);
    xlabel('time (s)')
    ylabel('y,r values')
    title("Output and input response for initial values x1(0) = " + InitialValuesE_ramp2(i,1) + " , x2(0) = " + InitialValuesE_ramp2(i,2));
    legend('output (y)','input (r)')
    grid on
end

%For r_r3(t) = 2t
%Plots of the ramp responses of state for all initial values
for i = 1:6
    figure(i+54+36)
    opts = odeset('Refine',15);
    [t1, state] = ode45(@(t1,state) fRamp3(t1,state),[0,8],[InitialValuesE_ramp3(i,1) InitialValuesE_ramp3(i,2)]);
    plot(t1, state)
    xlabel('time (s)')
    ylabel('state values')
    title("Ramp Response (r3) for initial values x1(0) = " + InitialValuesE_ramp3(i,1) + " , x2(0) = " + InitialValuesE_ramp3(i,2));
    legend('x1','x2')
    grid on    
end  
%Plots of the phase portrait for all initial values
for i = 1:6
    figure(i+60+36)
    opts = odeset('Refine',15);
    [t1, state] = ode45(@(t1,state) fRamp3(t1,state),[0,8],[InitialValuesE_ramp3(i,1) InitialValuesE_ramp3(i,2)]);
    x1 = state(:,1);
    x2 = state(:,2);
    plot(x1,x2);
    title("Phase portrait for initial values x1(0) = " + InitialValuesE_ramp3(i,1) + " , x2(0) = " + InitialValuesE_ramp3(i,2));
    xlabel('x1');
    ylabel('x2');
    grid on
end
%Plots of the responses of input (r) and output (y) for all initial values
for i = 1:6
    figure(i+66+36)
    opts = odeset('Refine',15);
    [t1, state] = ode45(@(t1,state) fRamp3(t1,state), [0,8],[InitialValuesE_ramp3(i,1) InitialValuesE_ramp3(i,2)]);
    x1 = state(:,1);
    y = t1- x1;
    RY = zeros((size(y,1)),2);
    RY(:,1) = y;
    RY(:,2) = t1;
    plot(t1,RY);
    xlabel('time (s)')
    ylabel('y,r values')
    title("Output and input response for initial values x1(0) = " + InitialValuesE_ramp3(i,1) + " , x2(0) = " + InitialValuesE_ramp3(i,2));
    legend('output (y)','input (r)')
    grid on
end