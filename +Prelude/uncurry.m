function res = uncurry (f)
    res = @uncurry2;
    function res2 = uncurry2(a, b)
        ga = f(a);
        res2 = ga(b);
    end
end
