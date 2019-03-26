%% Q1
% % Load in data
% load ex3-3-2;
% 
% % Create tableau
% T = totbl(A, b, p);
% 
% % b has no positive elements - go to phase 2 immediately
% % Exchange elements
% T = ljx(T, 1, 3);
% T = ljx(T, 2, 2);
% 
% % Next would be column 4, but all positive values
% % so stop here

 %% Q2 part 1
% % Load in data
% load ex3-3-5-1
% 
% %Create Tableau
% T = totbl(A, b, p);
% 
% % b has no positive elements - go to phase 2 immediately
% % Exchange elements
% T = ljx(T, 2, 2);
% 
% % Only useful column left is column 1, but z is not negative
% % so we stop here

%% Q2 part 2
% % Create range of inputs to sample
% r = linspace(-7, 7, 1000);
% 
% % Data for simplex jumps
% simplex_x = [0, 0];
% simplex_y = [0, 6];
% 
% % Conditions to fill in region
% [x, y] = meshgrid(r);	% Get 2-D mesh for x and y based on r
% cond1 = (-x + y >= -2);
% cond2 = (-x - y >= -6);
% cond3 = (x > 0);
% cond4 = (y > 0);
% conditions = cond1 & cond2 & cond3 & cond4;
% y1 = -2 + r;
% y2 = 6 - r;
% y3 = 0 * r;
% 
% % Plot
% hold on;
% colors = zeros(size(x)) + cond1 + cond2 + cond3 + cond4;
% plot(x(colors == 4), y(colors == 4), 'color', [0, 0, 0]+0.8);
% plot(r, y1, 'k');
% plot(r, y2, 'k');
% plot(r, y3, 'k');
% line([0 0], [-10 15], 'color', 'black');
% h1 = plot(simplex_x, simplex_y, 'k', 'LineWidth', 2);
% legend([h1], {'Simplex Steps'}, 'Location', 'best')
% xlabel('x')
% ylabel('y')
% xlim([-1, 4])
% ylim([-1, 7])

 %% Q2 part 3
% % Load in data
% load ex3-3-5-3
% 
% %Create Tableau
% T = totbl(A, b, p);
% 
% % b has no positive elements - go to phase 2 immediately
% % Exchange elements
% T = ljx(T, 1, 1); % First vertex
% T = ljx(T, 2, 2); % Second vertex

%% Q2 part 4
% Load in data
load ex3-3-5-4

%Create Tableau
T = totbl(A, b, p);

% b has no positive elements - go to phase 2 immediately
% Exchange elements
T = ljx(T, 2, 1);

% Create range of inputs to sample
r = linspace(-7, 7, 1000);

% Data for simplex jumps
simplex_x = [0, 0];
simplex_y = [1, 0];

% Conditions to fill in region
[x, y] = meshgrid(r);	% Get 2-D mesh for x and y based on r
cond1 = (2 * x - y >= -1);
cond2 = (-x + y >= -1);
cond3 = (x > 0);
cond4 = (y > 0);
conditions = cond1 & cond2 & cond3 & cond4;
y1 = 2 * r + 1;
y2 = r - 1;
y3 = 0 * r;

% Plot
hold on;
colors = zeros(size(x)) + cond1 + cond2 + cond3 + cond4;
plot(x(colors == 4), y(colors == 4), 'color', [0, 0, 0]+0.8);
plot(r, y1, 'k');
plot(r, y2, 'k');
plot(r, y3, 'k');
line([0 0], [-10 15], 'color', 'black');
h1 = plot(simplex_x, simplex_y, 'k', 'LineWidth', 2);
legend([h1], {'Simplex Steps'}, 'Location', 'best')
xlabel('x')
ylabel('y')
xlim([-1, 2])
ylim([-1, 5])

%% Q3
% % Load data
% A = [1, -1, -1, -0.5; 2.5, 2.25, -0.5, 4.25; -1, 1, 0, -2];
% b = [-2; -4; -3];
% p = [3; -3; -2; 5];
% 
% % Create tableau
% T = totbl(A, b, p);
% 
% % Exchange elements
% T = ljx(T, 1, 2);
% 
% r = linspace(-7, 7, 1000);
% 
% [x1, x2, x3, x4] = ndgrid(0:100);
% 
% cond1 = (x1 - x2 - x3 - 0.5*x4 >= -2);
% cond2 = (2.5*x1 + 2.25*x2 - 0.5*x3 + 4.25*x4 >= -4);
% cond3 = (-x1 + x2 - 2*x4 >= -3);
% cond4 = (x1 >= 0);
% cond5 = (x2 >= 0);
% cond6 = (x3 >= 0);
% cond7 = (x4 >= 0);
% conditions = cond1 & cond2 & cond3 & cond4 & cond5 & cond6 & cond7;

% %% Q4 Part 1
% % Load data
% A = [-1, -1; 2, 2];
% b = [-2; 10];
% p = [-3; 1];
% 
% % Create tableau
% T = totbl(A, b, p);
% 
% % Phase 1 procedures
% neg = [0; 1; 0];
% T = addcol(T, neg, 'x0', 3);
% T = addrow(T, [0 0 1 0], 'z0', 4);
% 
% % Special pivot
% [maxviol, r] = max(b);
% s = length(p) + 1;
% T = ljx(T, r, s);
% 
% % Continue as usual
% T = ljx(T, 1, 2);

%% Q4 Part 2
% % Load data
% A = [2, -1; 1, 2];
% b = [1; 2];
% p = [-1; 1];
% 
% % Create tableau
% T = totbl(A, b, p);
% 
% % Phase 1 procedures
% neg = [1; 1; 0];
% T = addcol(T, neg, 'x0', 3);
% T = addrow(T, [0 0 1 0], 'z0', 4);
% 
% % Special pivot
% [maxviol, r] = max(b);
% s = length(p) + 1;
% T = ljx(T, r, s);
% 
% % Continue as usual
% T = ljx(T, 2, 1);
% 
% % Remove phase 1 stuff
% T = delrow(T, 'z0');
% T = delcol(T, 'x0');
% 
% % Create range of inputs to sample
% r = linspace(-7, 7, 1000);
% 
% % Conditions to fill in region
% [x, y] = meshgrid(r);	% Get 2-D mesh for x and y based on r
% cond1 = (2 * x - y >= 1);
% cond2 = (x + 2 * y >= 2);
% cond3 = (x > 0);
% cond4 = (y > 0);
% conditions = cond1 & cond2 & cond3 & cond4;
% y1 = 2 * r - 1;
% y2 = 0.5 * (2 - r);
% y3 = 0 * r;
% 
% % Plot
% hold on;
% colors = zeros(size(x)) + cond1 + cond2 + cond3 + cond4;
% plot(x(colors == 4), y(colors == 4), 'color', [0, 0, 0]+0.8);
% plot(r, y1, 'k');
% plot(r, y2, 'k');
% plot(r, y3, 'k');
% line([0 0], [-10 15], 'color', 'black');
% xlabel('x')
% ylabel('y')
% xlim([0.5, 2])
% ylim([0, 4])

%% Q5
% % Load data
% load ex3-4-4
% 
% % Create tableau
% T = totbl(A, b, p);
% 
% % Phase 1 procedures
% neg = [1; 1; 0];
% T = addcol(T, neg, 'x0', 5);
% T = addrow(T, [0 0 0 0 1 0], 'z0', 4);
% 
% % Special pivot
% [maxviol, r] = max(b);
% s = length(p) + 1;
% T = ljx(T, r, s);
% 
% % Continue as usual
% T = ljx(T, 1, 3);
% 
% % Remove phase 1 stuff
% T = delrow(T, 'z0');
% T = delcol(T, 'x0');
% 
% % Continue exchanging
% T = ljx(T, 2, 2);
% T = ljx(T, 1, 3);