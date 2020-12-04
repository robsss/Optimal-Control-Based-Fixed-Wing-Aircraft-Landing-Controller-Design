function Vd = DRE_V(t,v,k,t1)
Parameters % defined parameter values
tf=17;
% reference=(ones(4,1)*(f*t));
[reference] = desired_trajectory(tf);
k1 = interp1(t1,k(:,1),t,'linear','extrap'); % Interpolate the data set (ft,f) at time t
k2 = interp1(t1,k(:,2),t,'linear','extrap');
k3 = interp1(t1,k(:,3),t,'linear','extrap');
k4 = interp1(t1,k(:,4),t,'linear','extrap');
% Evaluate ODE at time t

                         
                                  
 
%     Vd =                                      [Q(1,1)*reference(1) + 38*v(4)*conj(k1);
%  v(1) - v(2)/40 + Q(2,2)*reference(2) + v(4)*(38*conj(k2) + 1098456096613335/288230376151711744);
%                              (32*v(2))/5 + Q(3,3)*reference(3) + v(4)*(38*conj(k3) - 1561/1600);
%                                         v(3) + Q(4,4)*reference(4) + v(4)*(38*conj(k4) - 39/40)];
%  
     Vd =                                      [Q(1,1)*reference(1) + 38*v(4)*(k1);
 v(1) - v(2)/40 + Q(2,2)*reference(2) + v(4)*(38*(k2) + 1098456096613335/288230376151711744);
                             (32*v(2))/5 + Q(3,3)*reference(3) + v(4)*(38*(k3) - 1561/1600);
                                        v(3) + Q(4,4)*reference(4) + v(4)*(38*(k4) - 39/40)];
 
     
end
