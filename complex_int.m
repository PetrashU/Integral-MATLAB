function result = complex_int(f,a,b,method,n)
    x = linspace(a,b,n);
    result=0;
    for i = 1 : n-1
        a_1 = x(i);
        b_1 = x(i+1);
        result = result + method(f,a_1,b_1);
    end
end