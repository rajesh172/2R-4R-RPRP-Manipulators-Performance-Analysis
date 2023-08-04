clear all
close all
clc
%% ODE solver
 T=0:1/10:5;
[t,x]=ode23('ode_solver_RP',T,[0,1,0,0.5]); 

m1=0.5; m2=0.4;l1=2; g=9.81;

th1=x(:,1); th1_d=x(:,2);r1=x(:,3); r1_d=x(:,4); %Joint position and velocities

%% Energy Calculation

for i=1:1:length(th1)


% Equation for kinetic energy
L1 = 1/2*(m1*l1^2)*(th1_d(i))^2;
L2 = 1/2*m2*((l1+r1(i))^2)*(th1_d(i)^2) + 1/2*m2*(r1_d(i)^2);
%L3 = 1/2*m3*(r1_d(i)^2) + m3*l2*r1_d(i)*th2_d(i)*sin(th1(i)-th2(i)) + 1/2*m3*(l2)^2*(th2_d(i)^2) + 1/2*m3*((l1+r1(i))^2)*(th1_d(i)^2) + m3*l2*(l1+r1(i))*th1_d(i)*th2_d(i)*cos(th1(i)-th2(i));
%L4 = 1/2*m4*(r1_d(i)^2+r2_d(i)^2) + m4*(l2+r2(i))*r1_d(i)*th2_d(i)*sin(th1(i)-th2(i)) + 1/2*m4*(l2)^2*(th2_d(i)^2) + 1/2*m4*((l1+r1(i))^2)*(th1_d(i)^2) + m4*(l2+r2(i))*(l1+r1(i))*th1_d(i)*th2_d(i)*cos(th1(i)-th2(i)) + m4*r2(i)*(th2_d(i)^2)*(l2+ r2(i)/2) + m4*r1_d(i)*r2_d(i)*cos(th1(i)-th2(i)) - m4*(l1+r1(i))*r2_d(i)*th1_d(i)*sin(th1(i)-th2(i));
% L1, L2, L3 and L4 are the individual K.E of the 4 masses w.r.t origin.
% L1 = 1/2*(m1*l1^2)*(th1_d(i))^2;
% L2 = 1/2*m2*((l1+r1(i))^2)*(th1_d(i)^2) + 1/2*m2*(r1_d(i)^2);
% L3 = m3/2*((sin(th1(i))*r1_d(i) + cos(th1(i))*th1_d(i)*(l1 + r1(i)) + l2*cos(th2(i))*th2_d(i))^2 + (l2*sin(th2(i))*th2_d(i) - cos(th1(i))*r1_d(i) + sin(th1(i))*th1_d(i)*(l1 + r1(i)))^2);
% L4 = m4/2*((sin(th1(i))*r1_d(i) + sin(th2(i))*r2_d(i) + cos(th1(i))*th1_d(i)*(l1 + r1(i)) + cos(th2(i))*th2_d(i)*(l2 + r2(i)))^2 + (cos(th1(i))*r1_d(i) + cos(th2(i))*r2_d(i) - sin(th1(i))*th1_d(i)*(l1 + r1(i)) - sin(th2(i))*th2_d(i)*(l2 + r2(i)))^2);
KE(i,1) = L1 + L2 ;
%KE(i,1) = 0;

% Equation for potential energy
PE(i,1) = g*l1*sin(th1(i))*(m1+m2) +g*r1(i)*sin(th1(i))*(m2) ; % Assuming P.E to be zero
end

%Total energy
TE=KE+PE;

figure
plot(TE)

%% Display The Results

%Ploting energies
figure('units','normalized','outerposition',[0 0 1 1]);
subplot(211);
plot(t,KE,'r','LineWidth',1.5);
title("Kinetic Energy",'Interpreter','latex');
xlabel('Time (s)','Interpreter','latex');
ylabel('Energy (J) ','Interpreter','latex');
ylim([-3000 3000]);
set(gca,'FontSize',18);
grid minor;


subplot(212);
plot(t,PE,'b','LineWidth',1.5);
title("Potential Energy",'Interpreter','latex');
xlabel('Time (s)','Interpreter','latex');
ylabel('Energy  (J) ','Interpreter','latex');
ylim([-3000 3000]);
set(gca,'FontSize',18);
grid minor;
set(gca);
% saveas(gcf,'Q1_a_KE_PE1.png')

figure('units','normalized','outerposition',[0 0 1 1]);
plot(t,TE,'LineWidth',1.5);
title("Total Energy",'Interpreter','latex');
xlabel('Time (s)','Interpreter','latex');
ylabel('Energy  (J)','Interpreter','latex');
ylim([-10 10]);
set(gca,'FontSize',18);
grid minor;
% saveas(gcf,'Q1_a_TE1.png')