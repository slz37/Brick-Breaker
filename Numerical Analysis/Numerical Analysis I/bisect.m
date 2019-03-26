%Function
funct = @(x)(cos(x) - x);

%Initial Variables
a = 0;
b = pi / 2;
tol = 1E-20;
maxn = 100;
fa = funct(a);

%Store Initial Interval
ainit = a;
binit = b;

%Create Zero Vector to Store p-Values
p = zeros(1, maxn + 1);

%Run For Maximum Iterations
for i = 1:(maxn + 1),
  %Calculate p(i) and f(p)
  p(i) = (a + b) / 2;
  fp = funct(p(i));

  %Break if Root or Error Less Than Tolerance
  if fp == 0 || ((binit - ainit) / 2^i) < tol
    fprintf('Absolute error at iteration %d: %.8f\n', i, abs_err);
    break;
  end
  
  %Absolute Error
  abs_err = abs(25^(1/3) - p(i));
  
  %Print Absolute Error Every 5 Iterations
  if mod(i, 5) == 0
      fprintf('Absolute error at iteration %d: %.8f\n', i, abs_err);
  end

  %New Endpoints
  if fa * fp > 0 
    a = p(i); 
    fa = fp;
  else
    b = p(i);
  end
end

%Print Results
if i == maxn + 1
  fprintf('Method reached %d iterations: %.8f\n', maxn, p(i))
else
  fprintf('After %d iterations: %.8f\n', i, p(i))
end