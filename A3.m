clear
clc

% Define variables
lambda = [0.03, 0.05, 0.07, 0.09];
l = 0.3365;
h = 0.1;
t_end = 8; % End time

% Initial angles in degrees
theta = [0, 10, 15];
time = 0:h:t_end;
theta_values = zeros(3, length(time), length(lambda));
v_values = zeros(3, length(time), length(lambda));

% Loop through initial angles and lambda values
for i = 1:3 % for each initial angle
    for j = 1:length(lambda) % for each lambda value
        vi = 0;
        thetai = theta(i);
        y = [thetai, vi]; % Initial condition for the ODE
        
        % Loop through time
        for k = 1:length(time)
            ti = time(k);
            
            % Apply RK4 to ODE
            y = rk4_step(ti, y, h, lambda(j), @my_system);
            
            % Store the results
            theta_values(i, k, j) = y(1);
            v_values(i, k, j) = y(2) * l;  % Convert angular velocity to linear velocity
        end
    end
end

% Plot theta and v for each initial angle and lambda value
figure;

% Loop through initial angles
for i = 1:3
    % First subplot for Theta vs. Time
    subplot(3, 2, 2*i-1);
    hold on;
    % Loop through lambda values
    for j = 1:length(lambda)
        plot(time, theta_values(i, :, j));
    end
    % Labels and title for the first subplot
    ylabel('Theta (deg)');
    xlabel('Time (s)');
    title(sprintf('Theta vs. Time for Initial Angle %d°', theta(i)));
    legend(sprintf('lambda = %.2f', lambda(1)), sprintf('lambda = %.2f', lambda(2)), sprintf('lambda = %.2f', lambda(3)), sprintf('lambda = %.2f', lambda(4)));

    % Second subplot for Linear Velocity vs. Time
    subplot(3, 2, 2*i);
    hold on;
    % Loop through lambda values
    for j = 1:length(lambda)
        plot(time, v_values(i, :, j));
    end
    % Labels and title for the second subplot
    ylabel('v (m/s)');
    xlabel('Time (s)');
    title(sprintf('Linear Velocity vs. Time for Initial Angle %d°', theta(i)));
    legend(sprintf('lambda = %.2f', lambda(1)), sprintf('lambda = %.2f', lambda(2)), sprintf('lambda = %.2f', lambda(3)), sprintf('lambda = %.2f', lambda(4)));
end

% The system of ODEs for the pendulum with drag
function dydt = my_system(y, cd)
    m = 0.3;
    g = 9.81;
    r = 1;
    k = sqrt((m*g)/r);
    lambda = cd;
    a = sqrt((k^2/m^2)-(lambda^2/(4*m^2)));

    % y(1) represents the original function y(t)
    % y(2) represents the first derivative v(t) = y'(t)
    dydt = zeros(2, 1);
    % y'(t) = v(t)
    dydt(1) = y(2);
    % v'(t) = f(t, y(t), v(t))
    dydt(2) = -(g*sind(y(2)))/r - (lambda*y(1))/m;
end

% The RK4 method implementation for solving the ODEs
function y_next = rk4_step(t, y, h, cd, my_system)
    k1 = h * my_system(y, cd);
    k2 = h * my_system(y + k1/2, cd);
    k3 = h * my_system(y + k2/2, cd);
    k4 = h * my_system(y + k3, cd);
    y_next = y + (k1 + 2*k2 + 2*k3 + k4)/6;
end