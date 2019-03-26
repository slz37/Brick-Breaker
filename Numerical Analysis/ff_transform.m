%Initial Variables
m = 4;
s = 0;
s1 = 0;
finex = -pi:0.01:pi;
xdata = -pi:(pi / m):(pi - pi / m);
ydata = (1 - xdata).^2 .* sin(xdata).^2;

%Fast Fourier Transform
newy = fftshift(ydata);
d = fft(newy);
newd = fftshift(d);

%Basis Functions
for k=0:(2 * m - 1)
    s = s + d(k + 1) * exp(1i * k * finex);
end

%Complete Basis Function
s = s  / (2 * m);

%Basis Functions - Go From -4 to 3 to reduce oscillations
for k=-m:(m - 1)
    s1 = s1 + newd(m + k + 1) * exp(1i * k * finex);
end

%Complete Basis Function
s1 = s1 / (2 * m);

%Plot
hold on;
plot(xdata, ydata, 'k*');
plot(finex, s, 'b');
plot(finex, s1, 'r');
xlabel('x');
ylabel('f(x)');
legend('Data Points', 'High Oscillation FFT', 'Low Oscillation FFT', ...
    'location', 'best');
hold off;