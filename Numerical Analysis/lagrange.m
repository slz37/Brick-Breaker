%Function
funct = @(x)((1 + x.^2).^(-1));

%Initial Variables
n = 20;
%x = zeros(n, 1);
x = linspace(-5, 5, n + 1);

%Chebyshev Nodes
%{
for i = 0:n
    x(i + 1) = 5 * cos(((2 * i + 1) / (2 * n + 2)) * pi);
end
%}

y = funct(x);
x1 = linspace(-5, 5, 1000);
t1 = funct(x1);
L = ones(n + 1, size(x1, 2));

%Lagrange Polynomials
for i = 1:n + 1
    for j = 1:n + 1
        if i ~= j
            L(i, :) = (L(i, :) .* ((x1 - x(j)) / (x(i) - x(j))));
        end
    end
end

%Initialize y-points
y1 = zeros(1, size(L, 2));

%Interpolation
for i = 1:size(y1, 2)
    for j = 1:n + 1
        y1(i) = y1(i) + y(j) * L(j, i);
    end
end

%Error Initial Variables
p = 0;
q = 1 + sqrt(10);
L1 = ones(n + 1, 1);

%Error Lagrange Polynomials
for i = 1:n + 1
    for j = 1:n + 1
        if i ~= j
            L1(i) = (L1(i) .* ((q - x(j)) / (x(i) - x(j))));
        end
    end
end

%Error Interpolation
for j = 1:n + 1
    p = p + y(j) * L1(j);
end

%Calculate Error
err = abs(funct(q) - p);

%Print Error
fprintf('The error at q is: %.8f\n', err);

%Plot
hold on;
plot(x, y, 'o', 'color', [0.5, 0, 0.5]);
plot(x1, t1, '--', 'color', [0, 0.5, 0]);
plot(x1, y1);
legend('x_n', 'f(x)', 'p(x)', 'location', 'best');
title('n = 20 Interpolation');
hold off;