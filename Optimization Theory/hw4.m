%% Q1
% % Load data
% load ex4-2-2
% 
% % Setup tableau
% T = totbl(A, b, p);
% 
% % Phase I
% T = addcol(T, [0; 1; 0; 0], 'x0', 4);
% T = addrow(T, [0 0 0 1 0], 'z0', 5);
% 
% % Special pivot
% [maxviol, r] = max(b);
% s = length(p) + 1;
% T = ljx(T, r, s);
% 
% % Optimize phase I table and go to phase II
% T = ljx(T, 2, 2);
% T = delcol(T, 'x0');
% T = delrow(T, 'z0');
% 
% % Optimize phase II table
% T = ljx(T, 2, 1);

%% Part 2
% % Setup tableau
% T = totbl(-A', -p, -b);
% T = dualbl(T);
% 
% % Optimize dual
% T = ljx(T, 1, 2);

%% Q2
% % Load data
% A = [3, 0; 2, 4; 2, 5];
% b = [6; 10; 8];
% p = [50; 80];
% 
% % Setup tableau
% T = totbl(A, b, p);
% T = dualbl(T);
% 
% % Optimize
% T = ljx(T, 1, 1);
% T = ljx(T, 3, 2);
% T = ljx(T, 2, 2);

%% Q4
% Load data
A = [1, -1; 1, 2];
b = [1, -3];
p = [1; -2];

% Setup tableau
T = totbl(A, b, p);

% Phase I
T = addcol(T, [1; 0; 0], 'x0', 3);
T = addrow(T, [0 0 1 0], 'z0', 4);

% Special pivot
[maxviol, r] = max(b);
s = length(p) + 1;
T = ljx(T, r, s);

% Optimize phase I and go to phase II
T = ljx(T, 1, 1);
T = delcol(T, 'x0');
T = delrow(T, 'z0');

% Create range of inputs to sample
r = linspace(-3, 3, 1000);

% Conditions to fill in region
[x, y] = meshgrid(r);	% Get 2-D mesh for x and y based on r
cond1 = (x + y <= 1);
cond2 = -x + 2*y <= -2;
cond3 = (x > 0);
cond4 = (y > 0);
conditions = cond1 & cond2 & cond3 & cond4;
y1 = 1 - r;
y2 = (-2 + r) / 2;
y3 = 0 * r;

% Plot
hold on;
colors = zeros(size(x)) + cond1 + cond2 + cond3 + cond4;
plot(x(colors == 4), y(colors == 4), 'color', [0, 0, 0]+0.8);
plot(r, y1, 'k');
plot(r, y2, 'k');
plot(r, y3, 'k');
xlabel('x')
ylabel('y')
xlim([0, 3])
ylim([-3, 3])

%% Q5 - Part 1
% % Load data
% load ex4-6-4
% 
% % Setup dual tableau
% T = totbl(-A', -p, -b);
% T = dualbl(T);
% 
% % Optimize dual
% T = ljx(T, 1, 2);
% T = ljx(T, 2, 1);

%% Q5 - Part 2
% % Load data
% load ex4-6-4
% 
% % Setup dual tableau
% T = totbl(A, b, p);
% T = dualbl(T);
% 
% % Optimize the dual
% T = ljx(T, 1, 2);
% T = ljx(T, 2, 1);

%% Q6
% % Load data
% load ex4-2-2
% 
% % Setup tableau
% T = totbl(A, b, p);
% T = dualbl(T);
% 
% % Optimize dual
% T = ljx(T, 2, 1);