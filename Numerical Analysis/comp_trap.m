function integ = comp_trap(x)
syms t

%Function
fun = (1 / sqrt(2 * pi)) * exp(-t^2 / 2);

%Function Handle to Input Points
funct = matlabFunction(fun);

%Calculate 2nd Derivative
fun_prime = diff(fun);
fun_prime = diff(fun_prime);

%Derivative Handle
funct_prime = matlabFunction(fun_prime);

%Intial Variables
a = 0;
b = x;
tsum = 0;

%Find n and h Through Error
maxi = funct_prime(fminbnd(@(z) - funct_prime(z), -5, 5));
n = ceil((((b - a)^3 * maxi) / (12 * 1E-8))^(1 / 2));
h = (b - a) / n;

%Summation Term
for i = 1:(n - 1)
    y = a + i * h;
    tsum = tsum + funct(y);
end

%Compute Composite Trapezoid
integ = (h / 2) * (funct(a) + 2 * tsum + funct(b));