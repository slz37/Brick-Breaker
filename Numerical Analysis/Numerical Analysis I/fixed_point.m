%List of Functions to Use
funct1 = @(x)(x * (1 + ((7 - x^5) / (x^2)))^3);
funct2 = @(x)(x - ((x^5 - 7) / (x^2)));
funct3 = @(x)(x - ((x^5 - 7) / (5 * x^4)));
funct4 = @(x)(x - ((x^5 - 7) / (12)));
functions = {funct1, funct2, funct3, funct4};

%Iterate For Every Function
for j = 1:length(functions)
    %Current Function Being Iterated
    funct = functions{j};

    %Initial Variables
    p0 = 1;
    tol = 1E-20;
    max_iterations = 100;

    %Create Matrix of Zeros of Max Iterations
    p = zeros(1, max_iterations + 1);

    %Store Initial
    p(1) = p0;

    %Run Up to Max Iterations
    for i = 2:(max_iterations + 1)
        %Find Next p
        p(i) = funct(p(i - 1));

        %Stop If Tolerance is Reached
        if abs(p(i) - p(i - 1)) < tol
            break;
        end
    end

    %Print Results
    if i == max_iterations + 1
      fprintf('Method reached %d iterations: %.8f\n', max_iterations, p(i))
    else
      fprintf('After %d iterations: %.8f\n', i, p(i))
    end
end