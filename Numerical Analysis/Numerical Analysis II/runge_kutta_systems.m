%Function
funct = {@(u, w) w, @(u, w) (g / L) * cos(u)};

%Intial Variables
a = 0;
b = 2;
L = 2;
m = 2;
h = 0.1;
g = -32.17;
alpha = [pi / 6, 0];
n = ceil((b - a) / h);
k = zeros(4, n);
t = linspace(a, b, ((b - a) / h) + 1);
w = zeros(2, size(t, 2));
w(1, 1) = alpha(1);
w(2, 1) = alpha(2);

%Run Up To n Points
for j = 1:n
    for i = 1:m
        k(1, i) = h * funct{i}(w(1, j), w(2, j));
        k(2, i) = h * funct{i}(w(1, j) + 0.5 * k(1, 1), w(2, j) + 0.5 * ...
            k(1, 2));
        k(3, i) = h * funct{i}(w(1, j) + 0.5 * k(2, 1), w(2, j) + 0.5 * ...
            k(2, 2));
        k(4, i) = h * funct{i}(w(1, j) + k(3, 1), w(1, j) + k(3, 2));
        w(i, j + 1) = w(i, j) + (1 / 6) * (k(1, i) + 2 * k(2, i) + 2 * ...
            k(3, i) + k(4, i));
    end
end

%Plot Theta
plot(t, w(1, :));
legend('Theta Solution', 'location', 'best');
xlabel('Time');
ylabel('Theta(t)');

%Wait Untl Plot is Closed
uiwait();

%Plot Theta Prime
plot(t, w(2, :));
legend('Theta'' Prime Solution', 'location', 'best');
xlabel('Time');
ylabel('Theta''(t)');