% simulate heat equation

% N is the spatial step size
N=100;
dx=1/(N+1);
% built the spatial 1-d second derivate matrix
A=(diag(-2*ones(N,1),0)+diag(1*ones(N-1,1),1)+diag(1*ones(N-1,1),-1))/(dx)^2;

% spatial grid
xgrid=dx:dx:(1-dx);

% Initial condition
u0=(3*sin(6*pi*xgrid))';

% Euler's method (explicit) 

plot(xgrid,u0);
axis([0 1 -3 3]);
T=.01;
h=0.001;
numsteps=T/h;
u=u0;
for l=1:numsteps;
    u=u+h*A*u;
    pause(2);
   
    plot(xgrid,u);
    axis([0 1 -3 3]);
end

pause
% Backward Euler (implicit)

u0=(3*sin(6*pi*xgrid))';
plot(xgrid,u0);
axis([0 1 -3 3]);
T=.1;
h=0.01;
numsteps=T/h;
u=u0;
for l=1:numsteps;
    u=(eye(N)-h*A)\u;
    pause(2);
    plot(xgrid,u);
    axis([0 1 -3 3]);
end