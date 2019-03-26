function w = runge_kutta2(a, b, t, h, alpha, funct)
%Intial Variables
m = 2;
k = zeros(4, m);
n = ceil((b - a) / h);
w = zeros(2, size(t, 2));
w(1, 1) = alpha(1);
w(2, 1) = alpha(2);

%Run Up To n Points
for j = 1:n
    for i = 1:m
        k(1, i) = h * funct{i}(w(1, j), w(2, j), t(j));
    end
    for i = 1:m
        k(2, i) = h * funct{i}(w(1, j) + 0.5 * k(1, 1), w(2, j) + 0.5 * ...
            k(1, 2), t(j));
    end
    for i = 1:m
        k(3, i) = h * funct{i}(w(1, j) + 0.5 * k(2, 1), w(2, j) + 0.5 * ...
            k(2, 2), t(j));
    end
    for i = 1:m
        k(4, i) = h * funct{i}(w(1, j) + k(3, 1), w(1, j) + k(3, 2), t(j));
    end
    for i = 1:m
        w(i, j + 1) = w(i, j) + (1 / 6) * (k(1, i) + 2 * k(2, i) + 2 * ...
            k(3, i) + k(4, i));
    end
end