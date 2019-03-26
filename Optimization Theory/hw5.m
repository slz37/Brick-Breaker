%% Problem 2
A = [-4, 1, -8; -1, 1, 12]';
b = [-12; 10; 2];
p = [1; 3];

x = [0; 1.8; 0.1];

u = [59/10; 41/10];

u'*(A'*x - p)
x'*(-A*u + b)

T = totbl([-4, 1, -8; -1, 1, 12], [1; 3], [-12; 10; 2]);
T = dualbl(T);
T = ljx(T, 1, 2);
T = ljx(T, 2, 3);

%% Problem 3
% A = [1, 2; 3, 4];
% e = [1; 1];
% 
% T = totbl(A, e, e);
% T = dualbl(T);
% T = ljx(T, 2, 2);
% T = ljx(T, 1, 2);

%% Problem 4
% A = [1, 0, 0; 0, 2, 0; 0, 0, 3];
% e = [1; 1; 1];
% 
% T = totbl(A, e, e);
% T = dualbl(T);
% T = ljx(T, 1, 1);
% T = ljx(T, 2, 2);
% T = ljx(T, 3, 3);

%% Problem 5
% A = [0, 2, -1; -2, 0, 1; 1, -1 0];
% e = [1; 1; 1];
% 
% T = totbl(A + 5, e, e);
% T = dualbl(T);
% T = ljx(T, 1, 2);
% T = ljx(T, 2, 3);
% T = ljx(T, 3, 1);

%% Problem 6

% x = [1/2; 1/2; 0; 0]
% A = [0, 1, -1, 0; 1, 0, -1, -2]
% y = [1/2; 1/2]
% theta = 1 / (y'*A*x)
% 
% xbar = theta * x
% ybar = theta * y
% p = [1; 1; 1; 1]
% b = [1; 1]
% 
% 
% xbar' * (-A' * ybar + p)
% ybar' * (A * xbar - b)
% xbar' * (-A' * ybar + p) + ybar' * (A * xbar - b)
% 
% e = [1; 1];
% T = totbl(A, e, [1; 1; 1; 1]);
% T = dualbl(T);
% T = ljx(T, 1, 2);
% T = ljx(T, 2, 1);