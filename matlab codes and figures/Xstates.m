function dx = Xstates(t,x,tv,v,tk,K)
Parameters % defined parameter values
% interpolate data points  
k1 = interp1(tk,K(:,1),t,'linear','extrap');
k2 = interp1(tk,K(:,2),t,'linear','extrap');
k3 = interp1(tk,K(:,3),t,'linear','extrap');
k4 = interp1(tk,K(:,4),t,'linear','extrap');
v1 = interp1(tv,v(:,1),t,'linear','extrap');
v2 = interp1(tv,v(:,2),t,'linear','extrap');
v3 = interp1(tv,v(:,3),t,'linear','extrap');
v4 = interp1(tv,v(:,4),t,'linear','extrap');
% calculate dx
 
 
       dx =           [x(2);
                     (32*x(3))/5 - x(2)/40;
                     x(4);
 (1098456096613335*x(2))/288230376151711744 - (1561*x(3))/1600 - (39*x(4))/40 + 38*k1*x(1) + 38*k2*x(2) + 38*k3*x(3) + 38*k4*x(4) + (1444*v4)/r];
 
 

end