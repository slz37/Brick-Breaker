%Initial Variables
n = 4;
s1 = 0;
m = 2 * n;
finex = -pi:0.01:pi;
xdata = -pi:(pi / m):(pi - pi / m);
ydata = xdata.^2 .* cos(xdata);

%Fast Fourier Transform
newy = fftshift(ydata);
d = fft(newy);
newd = fftshift(d);

%Basis Functions - Reduce Oscillations
for k=-m:(m - 1)
    s1 = s1 + newd(m + k + 1) * exp(1i * k * finex);
end

%Complete Reduced Oscillation Basis Function
s1 = s1 / (2 * m);

%Plot
hold on;
plot(xdata, ydata, 'k*');
plot(finex, s1, 'r');
xlabel('x');
ylabel('f(x)');
title('Fast Fourier Transform n = 4');
legend('Data Points', 'Fourier Approximation', 'location', 'best');
hold off;