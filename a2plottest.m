clear
close all
m = 0.3;
t_end= 8;
g = 9.81;
r = 1;
k = sqrt((m*g)/r);
%thetas
t1 = 0;
t2 = 10;
t3 = 15;
lambda1 = 0.03;
lambda2 = 0.05;
lambda3 = 0.07;
lambda4 = 0.09;

%initialize row vectors for storing 
time = 0:0.1:t_end;
f1t1 = zeros(1,length(time));
f1t2 = zeros(1,length(time));
f1t3 = zeros(1,length(time));

f2t1 = zeros(1,length(time));
f2t2 = zeros(1,length(time));
f2t3 = zeros(1,length(time));

f3t1 = zeros(1,length(time));
f3t2 = zeros(1,length(time));
f3t3 = zeros(1,length(time));

f4t1 = zeros(1,length(time));
f4t2 = zeros(1,length(time));
f4t3 = zeros(1,length(time));

%evaluate position of the pendulum
%lambda 1
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
%lambda 2
for j = 1:length(time)
    t = time(j);
    %theta1
    ft1 = f(t,t1,lambda2);
    %Theta2
    ft2 = f(t,t2,lambda2);
    %Theta3
    ft3 = f(t,t3,lambda2);
    %store into vector
    f2t1(j) = ft1;
    f2t2(j) = ft2;
    f2t3(j) = ft3;
end
%lambda 3
for j = 1:length(time)
    t = time(j);
    %theta1
    ft1 = f(t,t1,lambda3);
    %Theta2
    ft2 = f(t,t2,lambda3);
    %Theta3
    ft3 = f(t,t3,lambda1);
    %store into vector
    f3t1(j) = ft1;
    f3t2(j) = ft2;
    f3t3(j) = ft3;
end
%lambda 4
for j = 1:length(time)
    t = time(j);
    %theta1
    ft1 = f(t,t1,lambda4);
    %Theta2
    ft2 = f(t,t2,lambda4);
    %Theta3
    ft3 = f(t,t3,lambda4);
    %store into vector
    f4t1(j) = ft1;
    f4t2(j) = ft2;
    f4t3(j) = ft3;
end

%plot 12 graphs for each initial theta and lambda value
%lambda 1
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

%lambda 2
figure;
subplot(2,1,1);
hold on;
plot(time, f2t1(1,:));

% Labels and title for the first subplot
ylabel('Theta1 (deg)');
xlabel('Time (s)');
title('Theta 1, Lambda 2 vs. Time');
legend('0°');

figure;
subplot(2,1,1);
hold on;
plot(time, f2t2(1,:));

% Labels and title for the first subplot
ylabel('Theta2 (deg)');
xlabel('Time (s)');
title('Theta 2, Lambda 2 vs. Time');
legend('10°');

figure;
subplot(2,1,1);
hold on;
plot(time, f2t3(1,:));

% Labels and title for the first subplot
ylabel('Theta3 (deg)');
xlabel('Time (s)');
title('Theta 3, Lambda 2 vs. Time');
legend('15°');

%lambda 3
figure;
subplot(2,1,1);
hold on;
plot(time, f3t1(1,:));

% Labels and title for the first subplot
ylabel('Theta1 (deg)');
xlabel('Time (s)');
title('Theta 1, Lambda 3 vs. Time');
legend('0°');

figure;
subplot(2,1,1);
hold on;
plot(time, f3t2(1,:));

% Labels and title for the first subplot
ylabel('Theta2 (deg)');
xlabel('Time (s)');
title('Theta 2, Lambda 3 vs. Time');
legend('0°');

figure;
subplot(2,1,1);
hold on;
plot(time, f3t3(1,:));

% Labels and title for the first subplot
ylabel('Theta3 (deg)');
xlabel('Time (s)');
title('Theta 3, Lambda 3 vs. Time');
legend('0°');

%lambda 4
figure;
subplot(2,1,1);
hold on;
plot(time, f4t1(1,:));

% Labels and title for the first subplot
ylabel('Theta1 (deg)');
xlabel('Time (s)');
title('Theta 1, Lambda 4 vs. Time');
legend('0°');

figure;
subplot(2,1,1);
hold on;
plot(time, f4t2(1,:));

% Labels and title for the first subplot
ylabel('Theta2 (deg)');
xlabel('Time (s)');
title('Theta 2, Lambda 4 vs. Time');
legend('0°');

figure;
subplot(2,1,1);
hold on;
plot(time, f4t3(1,:));

% Labels and title for the first subplot
ylabel('Theta3 (deg)');
xlabel('Time (s)');
title('Theta 3, Lambda 4 vs. Time');
legend('0°');
function y = f(t,theta,lambda)
m = 0.3;
g = 9.81;
r = 1;
k = sqrt((m*g)/r);
a = sqrt((k^2/m^2)-(lambda^2/(4*m^2)));

y = theta*exp((-lambda*t)/(2*m))*(cosd(a*t)+(lambda/(2*m*a))*sind(a*t));

end