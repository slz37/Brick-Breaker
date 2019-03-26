%Function
funct = @(x)((1 + x.^2).^(-1));
n1 = [5, 10, 15, 20];

xtot = [];
ytot = [];
x1 = linspace(-5, 5, 1000);
t1 = funct(x1);

%Plot
hold on;
plot(x1, t1, '--', 'color', [0, 0.5, 0]);

%Markers
mrk = {'-','--',':', '-.'};

%Run Through All n
for i = 1:size(n1, 2)
    %Initial Variables
    n = n1(i);
    x = linspace(-5, 5, n + 1);
    y = funct(x);

    %Calculate Spline
    s = spline(x, y, x1);
    
    %Add Nodes
    xtot = [xtot, x];
    ytot = [ytot, y];
    
    %Plot s_n(x)
    plot(x1, s, 'linestyle', mrk{i});
end
plot(x, y, 'o', 'color', [0.5, 0, 0.5]);
legend('f(x)', 's_5(x)', 's_{10}(x)', 's_{15}(x)', ...
    's_{20}(x)', 'x_n', 'location', 'best');
title('Cubic Spline Interpolation');
hold off;