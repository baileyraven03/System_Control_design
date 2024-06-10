
%% Setting the transfer function varibale to s
s = tf('s');
%% Defining the open loop trnasfer function
Gol = 1 /((5*s + 40)*(2*s+9));
%% Defining the transfer functions for each controller selected
PID = (130.050583*(s + 0.351530)*(s + 0.1))/s;
PI = (130.050583*(s + 0.1))/s;
%% Defining the open loop compensated transfer function
GcompPID = Gol * PID;
GcompPI = Gol * PI;
%% Defining the closed loop compensated transfer function
GPIDcl = feedback(GcompPID, 1);
GPIcl = feedback(GcompPI, 1);
%% Creating the figure to show the results graphically
figure()
%% Plotting the closed loop transfer functions onto the 
step(5*GPIDcl)
hold on
step(5*GPIcl)
hold on 
%% Plotting the open loop transfer functions for comparison
step(GcompPID)
hold on
step(GcompPI)
hold off
%% Adding detail to the graph
title("Controller verification");
legend("Closed Loop PID", "Closed Loop PI", "Open Loop PID", "Open Loop PI");
%% Gaining the step info for the systems
disp("Step info - PI controller closed loop")
stepinfo(GPIcl)
disp("Step info - PID controller closed loop")
stepinfo(GPIDcl)

