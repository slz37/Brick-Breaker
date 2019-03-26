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

%Graph
plot(t, w, '-*');
xlabel('t');
ylabel('w');
title('Midpoint Method');
legend('y(t)', 'location', 'best');