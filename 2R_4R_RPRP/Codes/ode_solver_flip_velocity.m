function Out= ode_solver_flip_velocity(t,x)


%% Input parameters
m1=0.5; m2=0.4; m3=1; m4=0.6;  l1=1; l2=1; g=-9.81;l1_max=1;l1_min=0;l2_max=1;l2_min=0;



%% Equation of motion 
% G = 200;
% G1 = 200;



M11 = (m1+m2+m3+m4)*(l1^2) + (m2+m3+m4)*(x(3))^2 +2*(m2+m3+m4)*l1*x(3);
M12 = 0;
M13 = m4*cos(x(1)-x(5))*(x(3))*(x(7)) + (m3+m4)*l2*(l1)*cos(x(1)-x(5)) + (m3+m4)*l2*x(3)*cos(x(1)-x(5)) + m4*l1*x(7)*cos(x(1)-x(5));
M14 = -m4*sin(x(1)-x(5))*(l1+x(3));

M21 = 0;
M22 = (m2+m3+m4);
M23 = m3*l2*sin(x(1)-x(5)) + m4*(l2)*sin(x(1)-x(5)) + m4*x(7)*sin(x(1)-x(5));
M24 = m4*cos(x(1)-x(5));

M31 = m4*cos(x(1)-x(5))*(l1+x(3))*(l2+x(7)) + m3*l2*(l1+x(3))*cos(x(1)-x(5));
M32 = m3*l2*sin(x(1)-x(5)) + m4*(l2+x(7))*sin(x(1)-x(5));
M33 = m3*(l2^2) + m4*(l2^2) + 2*m4*x(7)*(l2+ x(7)/2);
M34 = 0;

M41 = -m4*sin(x(1)-x(5))*(l1+x(3));
M42 = m4*cos(x(1)-x(5));
M43 = 0;
M44 = m4;





H1 =  (l1 + x(3))*(2*m2*x(4)*x(2) + 2*m3*x(4)*x(2) + 2*m4*x(4)*x(2) + l2*m3*sin(x(1) - x(5))*x(6)^2 + l2*m4*sin(x(1) - x(5))*x(6)^2 + 2*m4*x(8)*x(6)*cos(x(1) - x(5)) + m4*sin(x(1) - x(5))*x(7)*x(6)^2) + l1*g*cos(x(1))*(m1+m2+m3+m4) + x(3)*g*cos(x(1))*(m2+m3+m4) ;
 
H2 =  2*m4*sin(x(1) - x(5))*x(8)*x(6) - l1*m3*x(2)^2 - l1*m4*x(2)^2 - m2*x(3)*x(2)^2 - m3*x(3)*x(2)^2 - m4*x(3)*x(2)^2 - l2*m3*x(6)^2*cos(x(1) - x(5)) - l2*m4*x(6)^2*cos(x(1) - x(5)) - l1*m2*x(2)^2 - m4*x(7)*x(6)^2*cos(x(1) - x(5)) + g*sin(x(1))*(m2+m3+m4); % + k1_max*(x(3)-l1_max) + k1_min*(x(3)-l1_min);
 
H3 = 2*l2*m4*x(8)*x(6) + 2*m4*x(7)*x(8)*x(6) - l2*m3*sin(x(1) - x(5))*x(3)*x(2)^2 - l1*m4*sin(x(1) - x(5))*x(7)*x(2)^2 - l2*m4*sin(x(1) - x(5))*x(3)*x(2)^2 + 2*m4*x(7)*x(4)*x(2)*cos(x(1) - x(5)) - m4*sin(x(1) - x(5))*x(3)*x(7)*x(2)^2 - l1*l2*m3*sin(x(1) - x(5))*x(2)^2 - l1*l2*m4*sin(x(1) - x(5))*x(2)^2 + 2*l2*m3*x(4)*x(2)*cos(x(1) - x(5)) + 2*l2*m4*x(4)*x(2)*cos(x(1) - x(5)) + l2*g*cos(x(5))*(m3+m4) + x(7)*g*cos(x(5))*(m4);
 
H4 = - l2*m4*x(6)^2 - m4*x(7)*x(6)^2 - l1*m4*x(2)^2*cos(x(1) - x(5)) - 2*m4*sin(x(1) - x(5))*x(4)*x(2) - m4*x(3)*x(2)^2*cos(x(1) - x(5)) + m4*g*sin(x(5)); % + k2_max*(x(7)-l2_max) + k2_min*(x(7)-l2_min);


%     x(4) = -x(4);
% %     k = x(3);
%     x(2) = -x(2);
%     x(6) = -x(6);
%     %x(8) = -x(8);
% end


% if x(3)<=l1_max;
%     k1_max=0;
% end


% if x(3)>=l1_min;
%     k1_min=0;
% end


% if x(3)<=l1_min + ds;
%     x(4) = -x(4);
%     x(2) = -x(2);
%     x(6) = -x(6);
%     x(8) = -x(8);
% end


% if x(7)>=l2_max - ds;
%     x(8) = -x(8);
%     x(2) = -x(2);
%     x(6) = -x(6);
%     x(4) = -x(4);
%     
% end
% if x(7)<=l2_max;
%     k2_max=0;
% end
% if x(7)>=l2_min;
%     k2_min=0;
% end
% if x(7)<=l2_min + ds;
%     x(8) = -x(8);
%     x(2) = -x(2);
%     x(6) = -x(6);
%     x(4) = -x(4);
% end

%M matrix or Inertia Matrix


%H and G matrix or Coriolisis 


 

M = [M11 M12 M13 M14 ; M21 M22 M23 M24 ; M31 M32 M33 M34 ; M41 M42 M43 M44];

HG = [H1 ; H2 ; H3 ; H4];


T=[0; 0; 0; 0]; %Torques and Forces

%% Equation in terms of acceleration

th_dd = (inv(M)) * (T  - HG )    ;% Joint  accelaration

OP=zeros(8,1);


ds = 0.1;

if x(3)>=l1_max-ds || x(3)<=l1_min + ds;
x(4) = -x(4);
end
if x(7)>=l2_max-ds || x(7)<=l2_min + ds;
x(8) = -(x(8) + x(4)*cos(x(5)-x(1)));
end

%% Output
OP(1)=x(2); % It is theta1_dot
OP(2)=th_dd(1);% It is theta1_double_dot
OP(3)=x(4); % It is r1_dot
OP(4)=th_dd(2); % It is r1_double_dot
OP(5) = x(6);% It is theta2_dot
OP(6)=th_dd(3);% It is theta2_double_dot
OP(7) = x(8);% It is r2_dot
OP(8)=th_dd(4);% It is r2_double_dot


Out=OP; % Output

end