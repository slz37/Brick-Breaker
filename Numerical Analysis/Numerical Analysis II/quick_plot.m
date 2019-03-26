%Initial Variables
x = linspace(-1, 1, 1000);

%Functions
fun1 = @(x) exp(x);
fun2 = @(x) 1 + x + x.^2 ./ 2 + x.^3 ./ 3;
fun3 = @(x) 0.5 .* (exp(1) - (1 ./ exp(1))) + (3 ./ exp(1)) .* x + ...
    ((15 .* (exp(2) - 7)) ./ (4 * exp(1))) .* (x.^2 - (1 ./ 3)) + ...
    (175 ./ 8) .* ((74 ./ (5 .* exp(1))) - 2 .* exp(1)) .* (x.^3 - ...
    (3 ./ 5) .* x);
fun4 = @(x) 1.266065878 + 1.13032 .* x + 0.271495 .* (2 .* x.^2 - 1) + ...
    0.04443368 .* (4 .* x.^3 - 3 .*x);

%Plot
hold on;
plot(x, fun1(x) ,'k');
plot(x, fun2(x), 'k--');
plot(x, fun3(x), 'k:');
plot(x, fun4(x), 'k-.');
xlabel('x');
ylabel('P(x)');
legend('f(x)', 'Taylor P(x)', 'Legendre P(x)', 'Chebyshev P(x)', ...
    'location', 'best');
title('Approximations to exp(x)');
hold off;