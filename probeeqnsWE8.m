function posveldot=probeeqnsWE8(t,posvel)
cd=1.0;
A=0.01;
mass=1.0;
MR=planetparametersWE8;
r = sqrt((posvel(1).^2)+(posvel(2).^2));
h = r-MR(2);
Density=atmosphereWE8(h);
gravity=gravplanetWE8(posvel);
speed=sqrt((posvel(3).^2)+(posvel(4)).^2);
posveldot=[posvel(3);posvel(4);...
    gravity(1)-0.5*cd*A*Density*speed*posvel(3)/mass;...
    gravity(2)-0.5*cd*A*Density*speed*posvel(4)/mass];



