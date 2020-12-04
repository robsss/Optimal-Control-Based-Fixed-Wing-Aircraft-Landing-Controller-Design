%Q = eye(4)*10000;
% Q = [1000000 0 0 0;0 10000 0 0; 0 0 10000 0;0 0 0 10000];
Q = [0.00058 0 0 0;0 0.015 0 0;0 0 182 0;0 0 0 45];

r = 1000;

x0 = [100, -14,-0.05, 0]';
xf = [0,2,0,0]';
Tf = 17;
Ts = 40;
V = 256; %Ask solomon about this value
ws = 1;
%nu = 0.05; %Ask solomon about this value 
zeta = 0.5;
ks = -0.95;

a22 = -1/Ts;
a23 = V/Ts;
a42 = (1/(V*(Ts)^2)) - 2*(zeta*ws)/(V*Ts) + (ws^2)/V;
a43 = (2*zeta*ws)/(Ts) - (ws)^2 - 1/((Ts^2));
a44 = (1/Ts) - (2*zeta*ws);
b4 = (ws^2)*ks*Ts;

A = [0 1 0 0;0 a22 a23 0;0 0 0 1;0 a42 a43 a44];
B = [0 0 0 b4]';
C = eye(4);



