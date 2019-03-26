%% 2-3-3
% % Initial matrix
% A = [1, 2, 3, 4; 3, 1, 3, 0; 1, 3, -3, -8];
% %A = [-1, 0, 3; 2, -2, 4; 0, -2, 10];
% 
% % Create tableau
% T = totbl(A);
% 
% % Exchange variables
% %T = ljx(T, 2, 1);
% %T = ljx(T, 3, 4);
% %T = ljx(T, 1, 2);
% 
% T = ljx(T, 1, 1);
% T = ljx(T, 2, 2);
% T = ljx(T, 3, 3);
% 
% %% Now do again for A'
% % Initial matrix
% A = [1, 2, 3, 4; 3, 1, 3, 0; 1, 3, -3, -8]';
% 
% % Create tableau
% T = totbl(A);
% 
% % Exchange variables
% T = ljx(T, 1, 1);
% T = ljx(T, 2, 2);
% T = ljx(T, 3, 3);

%% 2-4-2
% % Initial matrix
% A = [1, 1, 1; 1, -1, -1; 1, -1, 1];
% b = [1; 1; 3];
% 
% % Create tableau
% T = totbl(A, b);
% 
% % Exchange Variables
% T = ljx(T, 1, 1);
% T = ljx(T, 2, 2);
% T = ljx(T, 3, 3);

%% 2-4-6
%% Part 1
% % Initial matrix
% A = [2, -1, 1, 1; -1, 2, -1, -2; 4, 1, 1, -1];
% a = [1; 1; 5];
% 
% % Create tableau
% T = totbl(A, a);
% 
% % Exchange Variables
% T = ljx(T, 1, 1);
% T = ljx(T, 2, 2);

% %% Part 2
% % Initial matrix
% B = [1, -1, 1, 2; 1, 1, 0, -1; 1, -3, 2, 5];
% b = [2; 1; 1];
% 
% % Create tableau
% T = totbl(B, b);
% 
% % Exchange Variables
% T = ljx(T, 1, 1);
% T = ljx(T, 2, 2);

% %% Part 3
% % Initial matrix
% C = [1, -1, 1; 2, 1, 1; -1, -1, 2; 1, 1, -1];
% c = [3; 2; 2; -1];
% 
% % Create tableau
% T = totbl(C, c);
% 
% % Exchange Variables
% T = ljx(T, 1, 1);
% T = ljx(T, 2, 2);
% T = ljx(T, 3, 3);

%% 2-4-8
% % Initial matrix
% A = [1, 3, 2; 3, 1, 1];
% b = [15; 1];
% display(rank(A));
% display(rank([A, b]));
% display(size(A));
% 
% % Create tableau
% T = totbl(A, b);
% 
% % Exchange Variables
% T = ljx(T, 1, 2);
% T = ljx(T, 2, 1);

%% 3-1-2
% Initial system
A = [0, -1; -1, -1; -1, 2; 1, -1];
b = [-5; -9; 0; 3];
p = [-1; -2];

% Create tableau
T = totbl(A, b, p);

% Exchange variables
T = ljx(T, 1, 2);
T = ljx(T, 2, 1);

% Data for simplex jumps
simplex_x = [0, 0, 4];
simplex_y = [0, 5, 5];

% Create range of inputs to sample
r = linspace(-7, 7, 1000);

% Z contours
p = [-1; -2];
y5 = (-1 / 2) * (r - 12);
y6 = (-1 / 2) * (r - 14);
y7 = (-1 / 2) * (r - 16);

% Constraint equations
y1 = 5 + 0 * r;
y2 = -r + 9;
y3 = r / 2;
y4 = r + 3;

% Conditions to fill in region
[x, y] = meshgrid(r);	% Get 2-D mesh for x and y based on r
cond1 = (-y >= -5);
cond2 = (-x - y >= -9);
cond3 = (-x + 2*y >= 0);
cond4 = (x - y >= -3);
conditions = cond1 & cond2 & cond3 & cond4;

% Plot
hold on;
colors = zeros(size(x)) + cond1 + cond2 + cond3 + cond4;
plot(x(colors == 4), y(colors == 4), 'color', [0, 0, 0]+0.8);
plot(r, y1, 'k');
plot(r, y2, 'k');
plot(r, y3, 'k');
plot(r, y4, 'k');
h1 = plot(r, y5, 'k--');
h2 = plot(r, y6, 'k:');
h3 = plot(r, y7, 'k-.');
plot(simplex_x, simplex_y, 'k', 'LineWidth', 2)
legend([h1, h2, h3], {'z = -12', 'z = -14', 'z = -16'}, 'Location', 'best') 

xlabel('x1')
ylabel('x2')
xlim([-7, 7])
ylim([-4, 6])