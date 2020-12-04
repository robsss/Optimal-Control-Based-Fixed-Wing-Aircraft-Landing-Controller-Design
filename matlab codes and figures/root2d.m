function F = root2d(j)
 vd = 0.0523599;
 h_f0 = 100;
%  Xt = 2892;
 X_f0 = -1.7583e+03;
 
 hg0 = 1620;
xg0 = -30380;
Xt = 2892;


F(1) = -j(1)+ ((tan(vd))/(h_f0 + j(2)));
F(2) = -j(2) + (h_f0 + j(2))*exp(-j(1)*(Xt - X_f0));