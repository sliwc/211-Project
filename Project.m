% Define variables
l = 0.3365;
h = 0.1; % Time step
t_end = 8; % End time

% Initial angles in degrees (from data)
theta = [13.3315 21.567 36.8095];
theta = theta * (pi / 180); % Convert degrees to radians

% Drag coefficients
cd = [0.0 0.1 0.2 0.3];

% Initialize arrays for storing results
time = 0:h:t_end;
theta_values = zeros(3, length(time), length(cd));
v_values = zeros(3, length(time), length(cd));

% Loop through initial angles and drag coefficients
for i = 1:3 % Initial angles
    for j = 1:length(cd) % Drag coefficients
        vi = 0;
        thetai = theta(i);
        y = [thetai, vi]; % Initial condition for the ODE
        for k = 1:length(time)
            ti = time(k);

            % Apply RK4 to ODE with drag
            y = rk4_step(ti, y, h, @(t, y) my_system(t, y, cd(j)));

            % Store the results
            theta_values(i, k, j) = y(1);
            v_values(i, k, j) = y(2) * l;  % Convert angular velocity to linear velocity
        end
    end
end

% Plot theta and v for each initial angle and drag coefficient
figure;
for i = 1:3 % Initial angles
    for j = 1:length(cd) % Drag coefficients
        subplot(3, length(cd), (i-1)*length(cd)+j);
        plot(time, theta_values(i, :, j));
        hold on;
        plot(time, v_values(i, :, j));
        hold off;
        % Labels and title for the subplot
        if i == 1
            title(sprintf('Cd = %.1f', cd(j)));
        end
        if j == 1
            ylabel(sprintf('Theta (rad)\nInit. angle: %.2f deg', theta(i)*180/pi));
        end
        if i == 3
            xlabel('Time (s)');
        end
        ylim([-0.5, 0.5]);
        legend('Theta', 'Linear Velocity');
    end
end

% The system of ODEs for the pendulum with drag
function dydt = my_system(~, y, cd)
    m = 0.1270;
    r = 0.1778;
    I_g = 1.2*10^(-3);
    g = 9.81;
    v = y(2);

    % y(1) represents the original function y(t)
    % y(2) represents the first derivative v(t) = y'(t)
    dydt = zeros(2, 1);
    dydt(1) = y(2); % y'(t) = v(t)
    dydt(2) = -(m*g*r/(I_g + m*r^2)*sin(y(1)) + 0.5*cd/m*r*v^2); % v'(t) = f(t, y(t), v(t))
end

% The RK4 method implementation for solving the ODEs with drag
function y_next
