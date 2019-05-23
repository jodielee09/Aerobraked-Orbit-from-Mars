G=6.67e-11;
%input the initial x position, y position, x velocity and y
%velocity in posvel0
velocity=sqrt(2*(G*6.4171e23/47972e3)-(G*6.4171e23/25734100));

posvel0 = [47972e3;0;0;-velocity];
massrad=planetparametersWE8;
% set the time for which to work out the trajectory
tfinal=600000;
% work out the initial total energy = kinetic + potential
inenergy=0.5*(posvel0(3).^2+posvel0(4).^2) -...
G*massrad(1)/sqrt(posvel0(1).^2+posvel0(2).^2);
options=odeset('RelTol',1e-8);
[t,posvel]=ode45('probeeqnsWE8',[0, tfinal], posvel0, options);
q=(0:0.01:2)*pi;
x2=massrad(2)*cos(q);
y2=massrad(2)*sin(q);
plot(posvel(:,1),posvel(:,2),x2,y2);
title("A plot of the probe's trajectery whilst aerobraking on Mars")
xlabel("x position in metres")
ylabel("y position in metres")
axis equal
top=length(t);
finenergy=0.5*(posvel(top,3).^2+ + posvel(top,4).^2)-G*massrad(1)/sqrt(posvel(top,1).^2+posvel(top,2).^2);
accuracy =((finenergy-inenergy)/inenergy);
