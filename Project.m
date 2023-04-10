%Define variables
m = 0.3;
r = 1;
lamda = 0.05;
h = 0.1;

%Initial angles in degrees
theta = [0 10 15];

%Initial conditions
vi = 0;

for i = 1:3
    thetai = theta(i);
    for ti = 0:0.1:8
    %For theta1
    %Determine dx1, dv1
    dtheta1 = h*vi;
    dv1 = h*f(thetai);

    %Determine dx2, dv2
    dtheta2 = h*(vi + 0.5*dv1);
    theta_i2 = thetai + 0.5*dtheta1;
    dv2 = h*f(theta_i2);

    % %Determine dx3, and dv3
    dtheta3 = h*(vi + 0.5*dv2);
    theta_i3 = thetai + 0.5*dtheta2;
    dv3 = h*f(theta_i3);

    % %Determine dx4, and dv4
    dtheta4 = h*(vi + dv3);
    theta_i4 = thetai + dtheta3;
    dv4 = h*f(theta_i4);
    
    % %Determine xi+1 and vi+1
    thetai_1 = thetai + (1/6)*(dtheta1 + 2*dtheta2 + 2*dtheta3 + dtheta4);
    vi_1 = vi + (1/6)*(dv1 + 2*dv2 + 2*dv3 + dv4);
    
    %Reassgining variables
    thetai = thetai_1;
    vi = vi_1;
    end
    %Display values of final theta and v
    vi
    thetai
end
