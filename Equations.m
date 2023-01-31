clc;
clear;
close all;

syms X0 X1 X2 Y0 Y1 Y2 Z0 Z1 Z2 w0 w1 w2 p0 p1 p2 k0 k1 k2 X Y Z x y f t x0 y0 c
Xs = X0+X1*t+X2*t^2;
Ys = Y0+Y1*t+Y2*t^2;
Zs = Z0+Z1*t+Z2*t^2;
w = w0+w1*t+w2*t^2;
p = p0+p1*t+p2*t^2;
k = k0+k1*t+k2*t^2;

Rx = [1 0 0;0 cos(w) -sin(w);0 sin(w) cos(w)];
Ry = [cos(p) 0 sin(p);0 1 0;-sin(p) 0 cos(p)];
Rz = [cos(k) -sin(k) 0;sin(k) cos(k) 0;0 0 1];
R = Rz*Ry*Rx;

dX = [X-Xs;Y-Ys;Z-Zs];
Eq = R*dX;
Fx = -f*(Eq(1)/Eq(3));
Fy = -f*(Eq(2)/Eq(3))-y;

B = jacobian([Fx,Fy],[X0 X1 X2 Y0 Y1 Y2 Z0 Z1 Z2 w0 w1 w2 p0 p1 p2 k0 k1 k2]);
R = Rx*Ry*Rz;
T = R*[x-x0;y-y0;-c]
