%Initial Function
fun = @(x) x.^2 .* cos(x);
%fun = @(x) x .* cos(x.^2) + exp(x) .* cos(exp(x));

%Initial Variables - 4
m = 4;
finex = -pi:0.01:pi;
xdata = -pi:(pi / m):(pi - pi / m);
ydata = fun(xdata);
coeff = fft(ydata);
a = zeros(size(coeff));
b = zeros(size(coeff));

%Compute Polynomial Coefficients - 4
for k = 1:m + 1
    a(k) = real(((-1).^(k - 1) ./ m) .* coeff(k));
end
for k = 1:m
    b(k) = imag(((-1).^(k - 1) ./ m) .* coeff(k + 1));
end

%Initial Variables - 16
m2 = 16;
xdata2 = -pi:(pi / m2):(pi - pi / m2);
ydata2 = fun(xdata2);
coeff2 = fft(ydata2);
a2 = zeros(size(coeff2));
b2 = zeros(size(coeff2));

%Compute Polynomial Coefficients - 16
for k = 1:m2 + 1
    a2(k) = -real(((-1).^k ./ m2) .* coeff2(k));
end
for k = 1:m2
    b2(k) = -imag(((-1).^k ./ m2) .* coeff2(k + 1));
end

%Interpolating Functions
fun1 = @(x) 0.5 .* (a(1) + a(5) .* cos(4 .* x)) + a(2) .* cos(x) + ...
    b(1) .* sin(x) + a(3) .* cos(2 .* x) + b(2) .* sin(2 .* x) + ...
    a(4) .* cos(3 .* x) + b(3) .* sin(3 .* x);
fun2 = @(x) 0.5 .* (a2(1) + a2(17) .* cos(16 .* x)) + a2(2) .* cos(x) + ...
    b2(1) .* sin(x) + a2(3) .* cos(2 .* x) + b2(2) .* sin(2 .* x) + ...
    a2(4) .* cos(3 .* x) + b2(3) .* sin(3 .* x) + a2(5) .* cos(4 .* ...
    x) + b2(4) .* sin(4 .* x) + a2(6) .* cos(5 .* x) + b2(5) .* ...
    sin(5 .* x) + a2(7) .* cos(6 .* x) + b2(6) .* sin(6 .* x) + ...
    a2(8) .* cos(7 .* x) + b2(7) .* sin(7 .* x) + a2(9) .* cos(8 .* ...
    x) + b2(8) .* sin(8 .* x) + a2(10) .* cos(9 .* x) + b2(9) .* ...
    sin(9 .* x) + a2(11) .* cos(10 .* x) + b2(10) .* sin(10 .* x) + ...
    a2(12) .* cos(11 .* x) + b2(11) .* sin(11 .* x) + a2(13) .* ...
    cos(12 .* x) + b2(12) .* sin(12 .* x) + a2(14) .* cos(13 .* x) + ...
    b2(13) .* sin(13 .* x) + a2(15) .* cos(14 .* x) + b2(14) .* ...
    sin(14 .* x) + a2(16) .* cos(15 .* x) + b2(15) .* sin(15 .* x);

%Plot n = 4
hold on;
plot(xdata, ydata, 'k*');
plot(finex, fun(finex), 'k');
plot(finex, fun1(finex), 'k--');
xlabel('x');
ylabel('f(x)');
legend('Data Points', 'f(x)', 'f(x)', 'S_4(x)', 'location', 'best');
title('Trigonometric Interpolating Polynomials n = 4');
hold off;

%Wait Until Done
uiwait();

%Plot n = 16
hold on;
plot(xdata2, ydata2, 'k*');
plot(finex, fun(finex), 'k');
plot(finex, fun2(finex), 'k--');
xlabel('x');
ylabel('f(x)');
legend('Data Points', 'f(x)', 'f(x)', 'S_4(x)', 'location', 'best');
title('Trigonometric Interpolating Polynomials n = 16');
hold off;