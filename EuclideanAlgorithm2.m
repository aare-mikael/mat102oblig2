function [gcd,x,y] = EuclideanAlgorithm2(a,b)
%gcd = ax+by
a = int64(a);
b = int64(b);
if a == 0
    gcd = b;
    x = 0;
    y = 1;
else
    [gcd,y,x0] = EuclideanAlgorithm2(mod(b,a),a); 
    x = x0 - (idivide(b,a))*y;
end