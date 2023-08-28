function result = threeight(f,a,b)
    c = (2*a+b)/3;
    d = (a+2*b)/3;
    result = (f(a)+3*f(c)+3*f(d)+f(b))/8 * (b-a);
end