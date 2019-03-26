%Initial Variables
a = 0;
b = pi / 4;
tot_sum = 0;
nodes = [0, -0.53847191, 0.53847191, -0.90617985, 0.90617985];
coeff = [0.5688888889, 0.4786286705, 0.4786286705, 0.2369268850, ...
    0.2369268850];

%Function
funct = @(x)((cos(x)).^2);
fun = @(t)(((b - a) / 2) * (cos(0.5 * ((b - a) * t + a + b)))^2);

%Run For All Nodes
for i = 1:size(nodes, 2)
    tot_sum = tot_sum + coeff(i) * fun(nodes(i));
end

%Compute Actual Integral
act = integral(funct, 0, pi / 4);

%Error
err = abs(act - tot_sum);

%Output
fprintf('Approximate Value is: %.8f with error: %.8f\n', tot_sum, err);