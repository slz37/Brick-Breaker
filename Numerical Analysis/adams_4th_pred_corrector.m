%Function
funct = @(t, w) -20 * w + 20 * cos(t) - sin(t);

%Actual Function
funct2 = @(t) -exp(-20 * t) + cos(t);

%Initial Variables
a = 0;
b = 2;
h = 0.05;
n = ceil((b - a) / h) + 1;
t = linspace(a, b, ((b - a) / h) + 1);
w = zeros(1, size(t, 2));
w(1) = funct2(t(1));
w(2) = funct2(t(2));
w(3) = funct2(t(3));
w(4) = funct2(t(4));

%Run Up To n Points
for i = 5:n
    wp = w(i - 1) + (h / 24) * (55 * funct(t(i - 1), w(i - 1)) - 59 * ...
        funct(t(i - 2), w(i - 2)) + 37 * funct(t(i - 3), w(i - 3)) - ...
        9 * funct(t(i - 4), w(i - 4)));
    w(i) = w(i - 1) + (h / 24) * (9 * funct(t(i), wp) + 19 * ...
        funct(t(i - 1), w(i - 1)) - 5 * funct(t(i - 2), w(i - 2)) + ...
        funct(t(i - 3), w(i - 3)));
end

%Graph
hold on;
plot(t, w, '-*');
plot(t, funct2(t));
xlabel('t');
ylabel('w');
title('Adam''s 4th Order Predictor-Corrector');
legend('Approximation', 'Actual Solution', 'location', 'best');
hold off;