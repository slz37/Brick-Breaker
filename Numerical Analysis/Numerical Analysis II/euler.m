%Function
funct = @(t, w) -20 * w + 20 * cos(t) - sin(t);

%Actual Function
funct2 = @(t) -exp(-20 * t) + cos(t);

%Initial Variables
a = 0;
b = 2;
h = 0.5;
alpha = 0;
n = ceil((b - a) / h);
t = linspace(a, b, ((b - a) / h) + 1);
w = zeros(1, size(t, 2));
w(1) = alpha;

%Run Up To n Points
for i = 1:n
    w(i + 1) = w(i) + h * funct(t(i), w(i));
end

%Graph
hold on;
plot(t, w, '-*');
plot(t, funct2(t));
xlabel('t');
ylabel('w');
title('Euler''s Method h=0.5');
legend('Approximation', 'Actual Solution', 'location', 'best');
hold off;