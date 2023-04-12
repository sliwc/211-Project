%constants
m = 0.3;
t= 8;
g = 9.81;
r = 1;
k = sqrt((m*g)/r);
%thetas
t1 = 0;
t2 = 10;
t3 = 15;

%initialize table
lambda = [0.03; 0.05; 0.07; 0.09];
theta1 = zeros(size(lambda));
theta2 = zeros(size(lambda));
theta3 = zeros(size(lambda));

%evaluate position of the pendulum for each lambda value
for i = 1:length(lambda)
    a = sqrt((k^2/m^2)-(lambda(i)^2/(4*m^2)));
    %Theta1
    theta1(i) = f(t1,lambda(i));
    %Theta2
    theta2(i) = f(t2,lambda(i));
    %Theta3
    theta3(i) = f(t3,lambda(i));
end

%create table
T = table(lambda, theta1, theta2, theta3)

function y = f(theta,lambda)
m = 0.3;
t= 8;
g = 9.81;
r = 1;
k = sqrt((m*g)/r);
a = sqrt((k^2/m^2)-(lambda^2/(4*m^2)));

y = theta*exp((-lambda*t)/(2*m))*(cosd(a*t)+(lambda/(2*m*a))*sind(a*t));
end
