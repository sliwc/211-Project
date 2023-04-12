function y = f(theta,lambda)
%constants
m = 0.3;
g = 9.81;
t= 8;
r = 1;
k = sqrt((m*g)/r);
a = sqrt((k^2/m^2)-(lambda^2/(4*m^2)));

ftheta = theta*exp((-lambda*t)/(2*m))*(cosd(a*t)+(lambda/(2*m*a))*sind(a*t));
dftheta = diff(ftheta);
ddftheta = diff(dftheta);

y = (m*ddftheta)+(lambda*dftheta)+((m*g*sind(theta))/r);