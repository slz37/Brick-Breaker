%Function
funct = @(x)(x^5 - x^4 + 2 * x^3 - 3 * x^2 + x - 4);

%Create Matrix of Zeros of Max Iterations
maxn = 100;
p = zeros(3, maxn + 1);

%Initial Variables
p(1, 1) = 1; 
p(1, 2) = 2;
p(1, 3) = 3;

p(2, 1) = 1 + 1i;
p(2, 2) = 2 + 1i;
p(2, 3) = 3 + 1i;

p(3, 1) = -1 + 1i;
p(3, 2) = -2 + 1i;
p(3, 3) = -3 + 1i;
tol = 1E-6;
init = 4;

%Run Up to Number of Initial Guesses
for j = 1:3
    %Run Up to Max Iterations
    for i = init:(maxn + 1)
        %Coefficients
        a = ((p(j, i - 2) - p(j, i - 1)) * (funct(p(j, i - 3)) - ...
            funct(p(j, i - 1))) - (p(j, i - 3) - p(j, i - 1)) * ...
            (funct(p(j, i - 2)) - funct(p(j, i - 1)))) / ((p(j, i - ...
            3) - p(j, i - 1)) * (p(j, i - 2) - p(j, i - 1)) * (p(j, i - ...
            3) - p(j, i - 2)));
        b = ((p(j, i - 3) - p(j, i - 1))^2 * (funct(p(j, i - 2)) - ...
            funct(p(j, i - 1))) - (p(j, i - 2) - p(j, i - 1))^2 * ...
            (funct(p(j, i - 3)) - funct(p(j, i - 1)))) / ((p(j, i - ...
            3) - p(j, i - 1)) * (p(j, i - 2) - p(j, i - 1)) * (p(j, i - ...
            3) - p(j, i - 2)));
        c = funct(p(j, i - 1));

        %Find Next p
        p(j, i) = p(j, i - 1) - ((2 * c) / (b + sign(b) * sqrt(b^2 - ...
            4 * a * c)));

        %Stop If Tolerance is Reached
        if abs(p(j, i) - p(j, i - 1)) < tol
            break;
        end

        %Print p
        fprintf('After %d iterations: %.8f + %.8fi\n', i - init + 1, ...
            real(p(j, i)), imag(p(j, i)))
    end

    %Print Results
    if i == maxn + 1
      fprintf('Method reached %d iterations: %.8f + %.8fi\n', maxn, ...
          real(p(j, i)), imag(p(j, i)))
    else
      fprintf('After %d iterations: %.8f + %.8fi\n', i - init + 1, ...
            real(p(j, i)), imag(p(j, i)))
    end
    
    %Separate Outputs
    fprintf('\n')
end