m = 0.3;
t= 8;
g = 9.81;
r = 1;
k = sqrt((m*g)/r);
t1 = 0;
t2 = 10;
t3 = 15;

lambda1 = 0.05;
a1 = sqrt((k^2/m^2)-(lambda1^2/(4*m^2)));
f1t1 = t1*exp((-lambda1*t)/(2*m))*(cosd(a1*t)+(lambda1/(2*m*a1))*sind(a1*t))
f1t2 = t2*exp((-lambda1*t)/(2*m))*(cosd(a1*t)+(lambda1/(2*m*a1))*sind(a1*t))
f1t3 = t3*exp((-lambda1*t)/(2*m))*(cosd(a1*t)+(lambda1/(2*m*a1))*sind(a1*t))
