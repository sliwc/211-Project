clear
%Define variables
m = 0.3;
t= 8;
g = 9.81;
r = 1;
k = sqrt((m*g)/r);
l = 0.3365; % for converting angular velocity to linear velocity
lamda = 0.05;
h = 0.1;
t_end = 8; % End time

%Initial angles in degrees
theta = [0 10 15];
lambda = 0.05 %[0.03 0.05 0.07 0.09];
time = 0:h:t_end;
theta_values = zeros(5, length(time));
v_values = zeros(5, length(time));

%Loop through initial angles
for i = 1:3
    vi = 0;
    thetai = theta(i);
    y = [thetai, vi]; % Initial condition for the ODE
    for j = 1:length(time)
        ti = time(j);
        
        % Apply RK4 to ODE
        y = rk4_step(ti, y, h, @my_system);
        
        % Store the results
        theta_values(i, j) = y(1);
        v_values(i, j) = y(2) * l;  % Convert angular velocity to linear velocity
    end
end

%Display values of final theta and v
vi
thetai

% The system of ODEs for the pendulum
function dydt = my_system(y)
    m = 0.3;
    l = 0.3365;
    r = 1;
    I_g = 1.2*10^(-3);
    g = 9.81;
    t= 8;
    r = 1;
    k = sqrt((m*g)/r);
    lambda = 0.05;
    theta = y
    a = sqrt((k^2/m^2)-(lambda^2/(4*m^2)));

    % y(1) represents the original function y(t)
    % y(2) represents the first derivative v(t) = y'(t)
%     ftheta = theta*exp((-lambda*t)/(2*m))*(cosd(a*t)+(lambda/(2*m*a))*sind(a*t));
%     dftheta = diff(ftheta);
    dydt = zeros(2, 1);
    dydt(1) = y(2); % y'(t) = v(t)
    dydt(2) = ((-lambda*y(2))/m)-((g*sind(y(1)))/r); % v'(t) = f(t, y(t), v(t))
end

% The RK4 method implementation for solving the ODEs
function y_next = rk4_step(t, y, h, my_system)
    k1 = h * my_system(y);
    k2 = h * my_system(y + k1/2);
    k3 = h * my_system(y + k2/2);
    k4 = h * my_system(y + k3);
    y_next = y + (k1 + 2*k2 + 2*k3 + k4)/6;
end