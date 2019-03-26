%Functions
fun1 = {@(u, w, x) w, @(u, w, x) w + 2 * u + cos(x)};
fun2 = {@(u, w, x) w, @(u, w, x) w + 2 * u};
funct = @(x) -(1 / 10) * (sin(x) + 3 * cos(x));

%Initial Variables
a = 0;
b = pi / 2;
h = pi / 40;
beta = -0.1;
alpha = -0.3;
n = ceil((b - a) / h);
u = [alpha; 0];
v = [0; 1];

%Independent Variable
t = zeros(n, 1);
for i = 1:n + 1
    t(i) = a + (i - 1) * h;
end

%Runge-Kutta Approximations
y1 = runge_kutta2(a, b, t, h, u, fun1);
y2 = runge_kutta2(a, b, t, h, v, fun2);

%Linear Shooting Method
ytot = y1 + ((beta - y1(1, size(y1, 2))) ./ y2(1, size(y2, 2))) .* y2;

%Plot
hold on;
plot(t, funct(t));
plot(t, ytot(1, :), '-.');
plot(t, ytot(2, :), '--');
xlabel('x');
ylabel('f(x)');
title('Shooting Method Using Runge-Kutta h = pi/40');
legend('y(x)', 'w(x)', 'w''(x)', 'location', 'best');
hold off;