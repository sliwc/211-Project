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
a1 = sqrt((k^2/m^2)-(lambda1^2/(4*m^2)));
%theta1
ft1 = t1*exp((-lambda1*t)/(2*m))*(cosd(a1*t)+(lambda1/(2*m*a1))*sind(a1*t))
%Theta2
ft2 = t2*exp((-lambda1*t)/(2*m))*(cosd(a1*t)+(lambda1/(2*m*a1))*sind(a1*t))
%Theta3
ft3 = t3*exp((-lambda1*t)/(2*m))*(cosd(a1*t)+(lambda1/(2*m*a1))*sind(a1*t))

lambda2 = 0.03
a1 = sqrt((k^2/m^2)-(lambda2^2/(4*m^2)));
%Theta1
ft1 = t1*exp((-lambda2*t)/(2*m))*(cosd(a1*t)+(lambda2/(2*m*a1))*sind(a1*t))
%Theta2
ft2 = t2*exp((-lambda2*t)/(2*m))*(cosd(a1*t)+(lambda2/(2*m*a1))*sind(a1*t))
%Theta3
ft3 = t3*exp((-lambda2*t)/(2*m))*(cosd(a1*t)+(lambda2/(2*m*a1))*sind(a1*t))

lambda3 = 0.07
a1 = sqrt((k^2/m^2)-(lambda3^2/(4*m^2)));
%Theta1
ft1 = t1*exp((-lambda3*t)/(2*m))*(cosd(a1*t)+(lambda3/(2*m*a1))*sind(a1*t))
%Theta2
ft2 = t2*exp((-lambda3*t)/(2*m))*(cosd(a1*t)+(lambda3/(2*m*a1))*sind(a1*t))
%Theta1
ft3 = t3*exp((-lambda3*t)/(2*m))*(cosd(a1*t)+(lambda3/(2*m*a1))*sind(a1*t))

lambda4 = 0.09
a1 = sqrt((k^2/m^2)-(lambda4^2/(4*m^2)));
%Theta1
ft1 = t1*exp((-lambda4*t)/(2*m))*(cosd(a1*t)+(lambda4/(2*m*a1))*sind(a1*t))
%Theta2
ft2 = t2*exp((-lambda4*t)/(2*m))*(cosd(a1*t)+(lambda4/(2*m*a1))*sind(a1*t))
%Theta3
ft3 = t3*exp((-lambda4*t)/(2*m))*(cosd(a1*t)+(lambda4/(2*m*a1))*sind(a1*t))