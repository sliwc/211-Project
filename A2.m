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

%evaluate position of the pendulum
lambda1 = 0.05
a = sqrt((k^2/m^2)-(lambda^2/(4*m^2)));
%theta1
ft1 = f(t1,lambda1)
%Theta2
ft2 = f(t2,lambda1)
%Theta3
ft3 = f(t3,lambda1)

lambda2 = 0.03
a = sqrt((k^2/m^2)-(lambda2^2/(4*m^2)));
%Theta1
ft1 = f(t1,lambda2)
%Theta2
ft2 = f(t2,lambda2)
%Theta3
ft3 = f(t3,lambda2)

lambda3 = 0.07
a = sqrt((k^2/m^2)-(lambda3^2/(4*m^2)));
%Theta1
ft1 = f(t1,lambda3)
%Theta2
ft2 = f(t2,lambda3)
%Theta1
ft3 = f(t3,lambda3)

lambda4 = 0.09
a = sqrt((k^2/m^2)-(lambda4^2/(4*m^2)));
%Theta1
ft1 = f(t1,lambda4)
%Theta2
ft2 = f(t2,lambda4)
%Theta3
ft3 = f(t3,lambda4)

function y = f(theta,lambda)
m = 0.3;
t= 8;
g = 9.81;
r = 1;
k = sqrt((m*g)/r);
a = sqrt((k^2/m^2)-(lambda^2/(4*m^2)));

y = theta*exp((-lambda*t)/(2*m))*(cosd(a*t)+(lambda/(2*m*a))*sind(a*t))
end