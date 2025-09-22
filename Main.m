%-----------------------Robot Dynamics------------------------------------%
%----------------------Two-link Manipulator-------------------------------%
%----------------------Edited by Gi-Woo Kim-------------------------------%

%---------------------Formulation of Dynamics-----------------------------%
clear all
close all

%------------------------Parameters and Matrix---------------------------%
dt = 0.001; t = 0:dt:2;
T1=-10; %Torque on link 1
T2=20;  %Torque on link 2

%------------------------Run Simulink Model-----------------------------%
sim('two_link_manipulator.slx')

%-------------------------plotting--------------------------------------%

figure("Position",[100 100 1400 540])
subplot1 = subplot(1,2,1);
subplot1.Units = "pixels";
subplot1.Position = [100 100 560 420];

plot(tout,q1,'Color',[0.8500 0.3250 0.0980],'LineStyle','-','LineWidth',2.5);

set(gca,'FontSize',22)
set(gca,'XTick',0:0.4:2)
xlabel('Time (s)','FontSize',26)
ylabel('Joint 1 (rad)','FontSize',26)
grid on

subplot2 = subplot(1,2,2);
subplot2.Units = "pixels";
subplot2.Position = [800 100 560 420];
plot(tout,q2,'Color',[0.8500 0.3250 0.0980],'LineStyle','-','LineWidth',2.5);
set(gca,'XTick',0:0.4:2)
set(gca,'FontSize',22)
xlabel('Time (s)','FontSize',26)
ylabel('Joint 2 (rad)','FontSize',26)
grid on



