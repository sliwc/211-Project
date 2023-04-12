<<<<<<< Updated upstream
%constants
m = 0.3;
t= 8;
=======
clear
close all
%constants
m = 0.3;
t_end= 8;
>>>>>>> Stashed changes
g = 9.81;
r = 1;
k = sqrt((m*g)/r);
%thetas
t1 = 0;
t2 = 10;
t3 = 15;

%initialize row vectors for storing 
<<<<<<< Updated upstream

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
=======
time = 0:0.1:t_end;
f1t1 = zeros(1,length(time));
f1t2 = zeros(1,length(time));
f1t3 = zeros(1,length(time));

%evaluate position of the pendulum
lambda1 = 0.05;
for j = 1:length(time)
    t = time(j);
    %theta1
    ft1 = f(t,t1,lambda1);
    %Theta2
    ft2 = f(t,t2,lambda1);
    %Theta3
    ft3 = f(t,t3,lambda1);
    %store into vector
    f1t1(j) = ft1;
    f1t2(j) = ft2;
    f1t3(j) = ft3;
end

%plot 12 graphs for each initial theta and lambda value
figure;
subplot(2,1,1);
hold on;
plot(time, f1t1(1,:));

% Labels and title for the first subplot
ylabel('Theta1 (deg)');
xlabel('Time (s)');
title('Theta 1, Lambda 1 vs. Time');
legend('0°');

figure;
subplot(2,1,1);
hold on;
plot(time, f1t2(1,:));

% Labels and title for the first subplot
ylabel('Theta2 (deg)');
xlabel('Time (s)');
title('Theta 2, Lambda 1 vs. Time');
legend('10°');

figure;
subplot(2,1,1);
hold on;
plot(time, f1t3(1,:));

% Labels and title for the first subplot
ylabel('Theta3 (deg)');
xlabel('Time (s)');
title('Theta 3, Lambda 1 vs. Time');
legend('15°');

function y = f(t,theta,lambda)

m = 0.3;
>>>>>>> Stashed changes
g = 9.81;
r = 1;
k = sqrt((m*g)/r);
a = sqrt((k^2/m^2)-(lambda^2/(4*m^2)));

<<<<<<< Updated upstream
y = theta*exp((-lambda*t)/(2*m))*(cosd(a*t)+(lambda/(2*m*a))*sind(a*t))
=======
y = theta*exp((-lambda*t)/(2*m))*(cosd(a*t)+(lambda/(2*m*a))*sind(a*t));
>>>>>>> Stashed changes
end