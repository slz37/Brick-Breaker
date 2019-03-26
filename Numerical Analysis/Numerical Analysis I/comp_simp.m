function integ = comp_simp(x)
syms t

%Function
fun = (1 / sqrt(2 * pi)) * exp(-t^2 / 2);

%Function Handle to Input Points
funct = matlabFunction(fun);

%Calculate 4th Derivative
fun_prime = diff(fun);

for i = 1:3
    fun_prime = diff(fun_prime);
end

%Derivative Handle
funct_prime = matlabFunction(fun_prime);

%Intial Variables
a = 0;
b = x;
tsum = 0;
fsum = 0;

%Find n and h Through Error
maxi = funct_prime(fminbnd(@(z) - funct_prime(z), -1, 1));
n = ceil((((b - a)^5 * maxi) / (180 * 1E-8))^(1 / 4));
h = (b - a) / n;

%2 and 4 Factor Terms
for i = 1:(n - 1)
    y = a + i * h;

    if mod(i , 2) == 0
        tsum = tsum + funct(y);
    else
        fsum = fsum + funct(y);
    end
end

%Compute Composite Simpson
integ = (h / 3) * (funct(a) + 2 * tsum + 4 * fsum + funct(b));