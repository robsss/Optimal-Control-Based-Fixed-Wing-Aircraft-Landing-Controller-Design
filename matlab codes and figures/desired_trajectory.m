function [reference] = desired_trajectory(tf)
X_g0 = -30380;
h_g0 = 1620;
h_f0 = 100;
vd = 0.0523599;
X_f0 = ((h_g0 - h_f0)/(tan(vd))) + X_g0;

% fun = @root2d;
% ini = [0,0];
% options=optimset('LargeScale','off','TolFun',.001,'MaxIter',100000,'MaxFunEvals',100000);
% j = fsolve(fun,ini,options);


Kx = 6.169332153192819e-04;
hc = 6.017545421669273; 
Xt = 2892;

Xdot = 256;
Kp =  Kx*Xdot;



%% 
% tf =25;
t=[0:0.01:tf];
t0 = 0;


Flare_out_altitude = -hc + (h_f0 + hc)*exp(-Kp*(t-t0));
% plot(t,Flare_out_altitude);

% final_route = horzcat(Glide_slope_altitude,Flare_out_altitude);

% i= 0:1:length(final_route)-1;
% plot(i,final_route);

%% Rate of descent
% t=25
% glide_slope_rate_of_descent = -tan(vd);
flare_out_rate_of_descent = -Kp*(h_f0 + hc)*exp(-Kp*(t-t0));
% final_rate_of_descent = horzcat(glide_slope_rate_of_descent, flare_out_rate_of_descent);

% j= 0:1:length(final_rate_of_descent)-1;
% plot(t,flare_out_rate_of_descent)

pitch_angle = zeros(1,length(t));

pitch_rate = zeros(1,length(t));

reference = [Flare_out_altitude;flare_out_rate_of_descent;pitch_angle;pitch_rate];
end




