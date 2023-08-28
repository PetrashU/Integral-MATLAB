function result = simpson(f,a,b)
    c = (a+b)/2;
    result = (f(a)+4*f(c)+f(b))/6 * (b-a);
end