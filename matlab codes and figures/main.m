%%%%%%%%%%%% Morth Carolina A&T State University %%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%% Optimal Control Final Project %%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%% Abenezer Taye %%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%% May 9, 2020 %%%%%%%%%%%%%% 


clear all; close all; clc
 Parameters % Load the given parameters
 %sinit  = zeros(10,1); % S(tf) = C'PC, where C is eye(4). And P=[0.9 0 0 0;0 0.01 0 0;0 0 1 0;0 0 0 1]
 s0 = [0.9 0 0 0 0.042 0 0 1 0 1];
 v0 = [0,0.000142,0,0]';
 
 %First solve for S using the DRE 
 [t1,s] = ode45(@DRE_S,[-Tf:0.01: 0],s0);
 sf = flipud(s);
 
 %calculate K using K = inv(R)*B'*S(t)
 for i =1:length(s)
     Kf(i,:)= (1/r)*B'*[sf(i,1) sf(i,2) sf(i,3) sf(i,4);
                        sf(i,2) sf(i,5) sf(i,6) sf(i,7);
                        sf(i,3) sf(i,6) sf(i,8) sf(i,9);
                        sf(i,4) sf(i,7) sf(i,9) sf(i,10)];
 end
 
 %solve for V using the DRE 
 [t2,v] = ode45(@(t,v) DRE_V(t,v,Kf,t1),[-Tf:0.01: 0],v0);

 
%closed loop simulation
 tt = -flipud(t2);
 vf = flipud(v);
 %calucalte xdot
 [tx, x] = ode45(@(t,x) Xstates(t,x,tt,vf,tt,Kf),[0:0.01:Tf],x0);
 
 %calculate control input
  for i=1:length(x)
     u(i) = -Kf(i,:)*x(i,:)' + (1/r)*B'*vf(i,:)';
  end
  
plot(tx,u,'LineWidth',1.2 )
grid on 
title('elevator defelection angle')

reference = desired_trajectory(Tf);

subplot(2,2,1)
plot(tx,x(:,1),'LineWidth',1.2 )
hold on 
plot(tx,reference(1,:),'LineWidth',1.2 )
grid on 
legend('simulated','reference')
title('altitude')

subplot(2,2,2)
plot(tx,x(:,2),'LineWidth',1.2 )
hold on 
plot(tx,reference(2,:),'LineWidth',1.2 )
grid on 
legend('simulated','reference')
title('rate of descent')

subplot(2,2,3)
plot(tx,x(:,3),'LineWidth',1.2 )
hold on 
plot(tx,reference(3,:),'LineWidth',1.2 )
grid on 
legend('simulated','reference')
title('pitch angle')

subplot(2,2,4)
plot(tx,x(:,4),'LineWidth',1.2 )
hold on 
plot(tx,reference(4,:),'LineWidth',1.2 )
grid on 
legend('simulated','reference')
title('pitch rate')

 
% 
plot(tx,u,'LineWidth',1.2 )
grid on 
title('elevator defelection angle')


%%
subplot(2,2,1)
plot(tx,Kf(:,1),'LineWidth',1.2 )
grid on 
title('altitude gain')

subplot(2,2,2)
plot(tx,Kf(:,2),'LineWidth',1.2 )
grid on 
title('rate of descent gain')

subplot(2,2,3)
plot(tx,Kf(:,3),'LineWidth',1.2 )
grid on 
title('pitch angle gain')

subplot(2,2,4)
plot(tx,Kf(:,4),'LineWidth',1.2 )
grid on 
title('pitch rate gain')

%%
subplot(2,2,1)
e1 = x(:,1)-reference(1,:)';
plot(tx,e1,'LineWidth',1.2 )
grid on 
title('error on altitude')


subplot(2,2,2)
e2 = x(:,2)-reference(2,:)';
plot(tx,e2,'LineWidth',1.2 )
grid on 
title('error on rate of descent')


subplot(2,2,3)
e3 = x(:,3)-reference(3,:)';
plot(tx,e3,'LineWidth',1.2 )
grid on 
title('error on pitch angle')

subplot(2,2,4)
e4 = x(:,4)-reference(4,:)';
plot(tx,e4,'LineWidth',1.2 )
grid on 
title('error on pitch rate')


