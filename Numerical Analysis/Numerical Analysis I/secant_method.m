%Function
funct = @(x)(sqrt(1 + x) - x);

%Create Matrix of Zeros of Max Iterations
p = zeros(1, maxn + 1);

%Initial Variables
init = 3;
p(1) = 0;
p(2) = 1;
tol = 1E-5;
maxn = 100;

%Run Up to Max Iterations
for i = init:(maxn + 1)
    %Find Next p
    p(i) = p(i - 1) - ((funct(p(i - 1)) * (p(i - 1) - p(i - 2))) / ...
        (funct(p(i - 1)) - funct(p(i - 2))));
    
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