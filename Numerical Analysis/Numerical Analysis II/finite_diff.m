  %Functions
p = @(x) 0;
q = @(x) 0;
r = @(x) -cos(x);
funct = @(x) ((2 * x) / 5) - (1 / 5) * x * cos(5) + cos(x) - 1;

%Initial Conditions
a1 = 0;
b1 = 5;
alpha = 0;
beta = 1;
s = {'--', '-.', ':'};
steps = [0.2, 0.1, 0.05];

%Independent Variable For Plotting
t = zeros(n, 1);
for i = 1:n + 1
    t(i) = a1 + (i - 1) * h;
end

%Plot Exact Solution
hold on;
plot(t, funct(t));

%Run For Different Step Sizes
for abc = 1:size(steps, 2)
    h = steps(abc);
    n = ceil(((b1 - a1) / h));
    a = zeros(n, 1);
    b = zeros(n, 1);
    c = zeros(n, 1);
    d = zeros(n, 1);
    l = zeros(n, 1);
    u = zeros(n, 1);
    z = zeros(n, 1);
    w = zeros(n, 1);
    w(1) = alpha;
    w(n + 1) = beta;

    %First Step
    t = a1 + h;
    a(1) = 2 + h^2 * q(t);
    b(1) = -1 + (h / 2) * p(t);
    d(1) = -h^2 * r(t) + (1 + (h / 2) * p(t)) * alpha;

    %Run Up to Second to Last Point
    for i = 2:n - 1
        %Independent Variable
        t = a1 + i * h;

        %Next Step
        a(i) = 2 + h^2 * q(t);
        b(i) = -1 + (h / 2) * p(t);
        c(i) = -1 - (h / 2) * p(t);
        d(i) = -h^2 * r(t);
    end

    %Last Step
    t = b1 - h;
    a(n) = 2 + h^2 * q(t);
    c(n) = -1 - (h / 2) * p(t);
    d(n) = -h^2 * r(t) + (1 - (h / 2) * p(t)) * beta;

    %Solve Tridiagonal Linear System - First Step
    l(1) = a(1);
    u(1) = b(1) / a(1);
    z(1) = d(1) / l(1);

    %Run Up to Second to Last Point
    for i = 2:n - 1
        l(i) = a(i) - c(i) * u(i - 1);
        u(i) = b(i) / l(i);
        z(i) = (d(i) - c(i) * z(i - 1)) / l(i);
    end

    %Last Step
    l(n) = a(n) - c(n) * u(n - 1);
    z(n) = (d(n) - c(n) * z(n - 1)) / l(n);
    w(n) = z(n);

    %Calculate w(t)
    for i = 1:n - 2
        w(n - i) = z(n - i) - u(n - i) * w(n - i + 1);
    end

    %Independent Variable For Plotting
    t = zeros(n, 1);
    for i = 1:n + 1
        t(i) = a1 + (i - 1) * h;
    end
    
    %Plot Approximation
    plot(t, w, s{abc});
end
    
%Plot Details
xlabel('x');
ylabel('f(x)');
title('Finite Difference Method');
legend('True', 'h=0.2', 'h=0.1', 'h=0.05', 'location', 'best');
hold off;