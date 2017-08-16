syms x y
h = ezsurf(sin(x)*cos(y), [-pi, pi]);
h.EdgeColor = 'none';

hold on;
h1 = ezsurf(0*sin(x)*cos(y), [-pi, pi]);
h1.FaceAlpha = 0.5;
h1.EdgeColor = 'none';
h1.FaceColor = 'black';

hold on;
x1 = linspace(-pi,pi,25);
y1 = linspace(-pi,pi,25);
X = [];
Y = [];
Z = [];
for x11 = x1
    for y11 = y1
        disp(x11)
        disp(y11)
        X = [X; x11];
        Y = [Y; y11];
        Z = [Z; sin(x11) * cos(y11) + normrnd(0,0.16)];
    end
end

scatter3(X, Y, Z,10)

