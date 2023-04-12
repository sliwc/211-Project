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

%initialize row vectors for storing 

%evaluate position of the pendulum
lambda1 = 0.05
for i = 0:0.1:8
    %theta1
    ft1 = f(i,t1,lambda1);
    %Theta2
    ft2 = f(i,t2,lambda1);
    %Theta3
    ft3 = f(i,t3,lambda1);
end

function y = f(t,theta,lambda)
m = 0.3;
t= 8;
g = 9.81;
r = 1;
k = sqrt((m*g)/r);
a = sqrt((k^2/m^2)-(lambda^2/(4*m^2)));

y = theta*exp((-lambda*t)/(2*m))*(cosd(a*t)+(lambda/(2*m*a))*sind(a*t))
end