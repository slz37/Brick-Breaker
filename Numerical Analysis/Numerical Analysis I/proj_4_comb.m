%Hold Plots
hold on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Euler%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function
funct = @(t, w) 1 + (w / t) + (w / t)^2;

%Initial Variables
a = 1;
b = 3;
h = 0.1;
alpha = 0;
n = ceil((b - a) / h);
w = zeros(1, size(t, 2));
w(1) = alpha;
t = linspace(a, b, ((b - a) / h) + 1);

%Run Up To n Points
for i = 1:n
    w(i + 1) = w(i) + h * funct(t(i), w(i));
end

%Output
for i = 1:n + 1
    fprintf('(%0.1f, %0.8f), ', t(i), w(i));
end
fprintf('\n');

%Graph
plot(t, w, '-*');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Midpoint%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function
funct = @(t, w) 1 + (w / t) + (w / t)^2;

%Initial Variables
a = 1;
b = 3;
h = 0.1;
alpha = 0;
n = ceil((b - a) / h);
w = zeros(1, size(t, 2));
w(1) = alpha;
t = linspace(a, b, ((b - a) / h) + 1);

%Run Up To n Points
for i = 1:n
    w(i + 1) = w(i) + h * funct(t(i) + (h / 2), w(i) + (h / 2) * ...
        funct(t(i), w(i)));
end

%Output
for i = 1:n + 1
    fprintf('(%0.1f, %0.8f), ', t(i), w(i));
end
fprintf('\n');

%Graph
plot(t, w, '-.*');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Runge-Kutta%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function
funct = @(t, w) 1 + (w / t) + (w / t)^2;

%Initial Variables
a = 1;
b = 3;
h = 0.1;
alpha = 0;
k = zeros(1, 4);
n = ceil((b - a) / h);
w = zeros(1, size(t, 2));
w(1) = alpha;
t = linspace(a, b, ((b - a) / h) + 1);

%Run Up To n Points
for i = 1:n
    k(1) = h * funct(t(i), w(i));
    k(2) = h * funct(t(i) + (h / 2), w(i) + 0.5 * k(1));
    k(3) = h * funct(t(i) + (h / 2), w(i) + 0.5 * k(2));
    k(4) = h * funct(t(i + 1), w(i) + k(3));
    w(i + 1) = w(i) + (1 / 6) * (k(1) + 2 * k(2) + 2 * k(3) + k(4));
end

%Output
for i = 1:n + 1
    fprintf('(%0.1f, %0.8f), ', t(i), w(i));
end
fprintf('\n');

%Graph
plot(t, w, '--*');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Actual%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function
funct2 = @(t) t .* tan(log(t));

%Values
t2 = linspace(1, 3, (2 / 0.01) + 1);
y2 = funct2(t2);

%Plot
plot(t2, y2);
xlabel('t(i)');
ylabel('w(i)');
legend('Euler', 'Midpoint', 'Runge-Kutta', 'Actual', 'location', 'best');
hold off;