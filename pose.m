function X = pose(EOP,t)

X0 = EOP(1);X1 = EOP(2);X2 = EOP(3); 
Y0 = EOP(4);Y1 = EOP(5);Y2 = EOP(6); 
Z0 = EOP(7);Z1 = EOP(8);Z2 = EOP(9); 

Xs = X0+X1*t+X2*t^2;
Ys = Y0+Y1*t+Y2*t^2;
Zs = Z0+Z1*t+Z2*t^2;

X = [Xs;Ys;Zs];
end