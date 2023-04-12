% Define variables
m = 1;    % Mass
l = 1;    % Length
k = 1;    % Spring constant
lambda = 0.1;    % Damping coefficient

% Define the initial conditions
t0 = 0;
y0 = [0, 1];

% Define the time step
h = 0.01;

% Define the time interval
t_end = 8;

% Define the function to be solved
my_system = @(t, y) [y(2); (-lambda*y(2) - k^2*y(1))/m];

% Initialize the solution arrays
time = t0:h:t_end;
y_values = zeros(length(time), length(y0));

% Set the initial values
y_values(1,:) = y0;

% Implement the RK4 method
for i = 1:(length(time)-1)
    t = time(i);
    y = y_values(i,:)';
    k1 = h*my_system(t, y);
    k2 = h*my_system(t + h/2, y + k1/2);
    k3 = h*my_system(t + h/2, y + k2/2);
    k4 = h*my_system(t + h, y + k3);
    y_next = y + (k1 + 2*k2 + 2*k3 + k4)/6;
    y_values(i+1,:) = y_next';
end

% Plot the results
figure;
plot(time, y_values(:,1));
xlabel('Time');
ylabel('Displacement');
title('Displacement vs. Time');
