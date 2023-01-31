function T = T0_function(EOP,f,xy,t)
xo = 0;
yo = 0;
x = 0;
y = xy(:,2);

w0 = EOP(10);w1 = EOP(11);w2 = EOP(12); 
p0 = EOP(13);p1 = EOP(14);p2 = EOP(15); 
k0 = EOP(16);k1 = EOP(17);k2 = EOP(18);

T =[                                                                                                                                                                                  cos(k2*t^2 + k1*t + k0)*cos(p2*t^2 + p1*t + p0)*(x - xo) - f*sin(p2*t^2 + p1*t + p0) - cos(p2*t^2 + p1*t + p0)*sin(k2*t^2 + k1*t + k0)*(y - yo)
 (x - xo)*(sin(k2*t^2 + k1*t + k0)*cos(w2*t^2 + w1*t + w0) + cos(k2*t^2 + k1*t + k0)*sin(p2*t^2 + p1*t + p0)*sin(w2*t^2 + w1*t + w0)) + (y - yo)*(cos(k2*t^2 + k1*t + k0)*cos(w2*t^2 + w1*t + w0) - sin(k2*t^2 + k1*t + k0)*sin(p2*t^2 + p1*t + p0)*sin(w2*t^2 + w1*t + w0)) + f*cos(p2*t^2 + p1*t + p0)*sin(w2*t^2 + w1*t + w0)
 (x - xo)*(sin(k2*t^2 + k1*t + k0)*sin(w2*t^2 + w1*t + w0) - cos(k2*t^2 + k1*t + k0)*sin(p2*t^2 + p1*t + p0)*cos(w2*t^2 + w1*t + w0)) + (y - yo)*(cos(k2*t^2 + k1*t + k0)*sin(w2*t^2 + w1*t + w0) + sin(k2*t^2 + k1*t + k0)*sin(p2*t^2 + p1*t + p0)*cos(w2*t^2 + w1*t + w0)) - f*cos(p2*t^2 + p1*t + p0)*cos(w2*t^2 + w1*t + w0)];

end