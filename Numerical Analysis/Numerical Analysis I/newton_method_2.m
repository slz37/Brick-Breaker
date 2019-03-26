%Function and Derivative
funct = @(x) comp_simp(x) - 0.45;
%funct = @(x) comp_trap(x) - 0.45;
funct_prime = @(x) (1 / sqrt(2 * pi)) * exp(-x^2 / 2);

%Initial Variables
p0 = 0.5;
init = 2;
tol = 1E-5;
maxn = 100;

%Create Matrix of Zeros of Max Iterations
p = zeros(1, maxn + 1);

%First p-value
p(1) = p0 - (funct(p0) / funct_prime(p0));

%Run Up to Max Iterations
for i = init:(maxn + 1)
    %Find Next p
    p(i) = p(i - 1) - (funct(p(i - 1)) / funct_prime(p(i - 1)));
    
    %Stop If Tolerance is Reached
    if abs(p(i) - p(i - 1)) < tol
        break;
    end
    
    %Print p
    fprintf('After %d iterations: %.8f\n', i - init + 1, p(i))
end

%Print Results
if i == maxn + 1
  fprintf('Method reached %d iterations: %.8f\n', maxn, p(i))
else
  fprintf('After %d iterations: %.8f\n', i - init + 1, p(i))
end