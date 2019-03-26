%Function
funct = @(t, w) 1 + (w / t) + (w / t)^2;

%Initial Variables
a = 1;
b = 3;
h = 0.1;
alpha = 0;
k = zeros(1, 4);
n = ceil((b - a) / h);
t = linspace(a, b, ((b - a) / h) + 1);
w = zeros(1, size(t, 2));
w(1) = alpha;

%Run Up To n Points
for i = 1:n
    k(1) = h * funct(t(i), w(i));
    k(2) = h * funct(t(i) + (h / 2), w(i) + 0.5 * k(1));
    k(3) = h * funct(t(i) + (h / 2), w(i) + 0.5 * k(2));
    k(4) = h * funct(t(i + 1), w(i) + k(3));
    w(i + 1) = w(i) + (1 / 6) * (k(1) + 2 * k(2) + 2 * k(3) + k(4));
end

%Graph
plot(t, w, '-*');
xlabel('t');
ylabel('w');
title('Runge-Kutta Method Order 4');
legend('y(t)', 'location', 'best');