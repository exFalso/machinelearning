function res = curry (f)
    res = Data.FunHandle.lambda2 (@curry2)
    function res2 = curry2 (a)
        res2 = @curry3
        function res3 = curry3 (b)
            res3 = f (a, b)
        end
    end
end