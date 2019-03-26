%Variable and Function to Differentiate
syms x;
fun = (x^5 - (10 / 9) * x^3 + (5 / 21) * x);

%Function Handle to Input Points
funct = matlabFunction(fun);

%Calculate Derivative
fun_prime = diff(fun);

%Derivative Handle
funct_prime = matlabFunction(fun_prime);

for p0 = -1:0.5:1
    %Initial Variables
    init = 2;
    tol = 1E-7;
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
    fprintf('\n')
end