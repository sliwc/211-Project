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
%theta 1
T1 = zeros(4,length(time));
%theta 2
T2 = zeros(4,length(time));
%theta 3
T3 = zeros(4,length(time));

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
    T1(1,j) = ft1;
    T2(1,j) = ft2;
    T3(1,j) = ft3;
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
    T1(2,j) = ft1;
    T2(2,j) = ft2;
    T3(2,j) = ft3;
end
%lambda 3
for j = 1:length(time)
    t = time(j);
    %theta1
    ft1 = f(t,t1,lambda3);
    %Theta2
    ft2 = f(t,t2,lambda3);
    %Theta3
    ft3 = f(t,t3,lambda3);
    %store into vector
    T1(3,j) = ft1;
    T2(3,j) = ft2;
    T3(3,j) = ft3;
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
    T1(4,j) = ft1;
    T2(4,j) = ft2;
    T3(4,j) = ft3;
end

%plot graphs for each initial theta and lambda value
%Theta 1
figure;
subplot(2,1,1);
hold on;
for j = 1:4
    plot(time,T1(j,:));
end
% Labels and title for the first subplot
ylabel('Theta (deg)');
xlabel('Time (s)');
title(sprintf('Theta vs. Time for Initial Angle %d°', t1));
legend(sprintf('lambda = %.2f', lambda1), sprintf('lambda = %.2f', lambda2), sprintf('lambda = %.2f', lambda3), sprintf('lambda = %.2f', lambda4));

%Theta 2
figure;
subplot(2,1,1);
hold on;
for j = 1:4
    plot(time,T2(j,:));
end
% Labels and title for the first subplot
ylabel('Theta (deg)');
xlabel('Time (s)');
title(sprintf('Theta vs. Time for Initial Angle %d°', t2));
legend(sprintf('lambda = %.2f', lambda1), sprintf('lambda = %.2f', lambda2), sprintf('lambda = %.2f', lambda3), sprintf('lambda = %.2f', lambda4));

%Theta 3
figure;
subplot(2,1,1);
hold on;
for j = 1:4
    plot(time,T3(j,:));
end
% Labels and title for the first subplot
ylabel('Theta (deg)');
xlabel('Time (s)');
title(sprintf('Theta vs. Time for Initial Angle %d°', t3));
legend(sprintf('lambda = %.2f', lambda1), sprintf('lambda = %.2f', lambda2), sprintf('lambda = %.2f', lambda3), sprintf('lambda = %.2f', lambda4));

function y = f(t,theta,lambda)
m = 0.3;
g = 9.81;
r = 1;
k = sqrt((m*g)/r);
a = sqrt((k.^2/m.^2)-(lambda.^2/(4*m.^2)));
e = exp((-lambda*t)/0.6);
c = cos(a*t);
s1 = lambda/(0.6*a);
s2 = sin(a*t);
s = s1*s2;
y = theta*e*(c+s);

end