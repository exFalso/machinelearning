% lambda2 :: (a -> b -> c) -> FunHandle (a -> FunHandle (b -> c))
function result = lambda2 (fun)
    result = Data.FunHandle.FunHandle (@lambda1_);
    function res = lambda1_ (a)
        funa = fun (a);                 % partial application here
        res = Data.FunHandle.lambda1 (funa);
    end
end
