% lambda3 :: (a -> b -> c -> d) -> FunHandle (a -> FunHandle (b ->
% FunHandle (c -> d)))
function result = lambda3 (fun)
    result = Data.FunHandle.FunHandle (@lambda2_);
    function res = lambda2_ (a)
        funa = fun (a);                 % partial application here
        res = Data.FunHandle.lambda2 (funa);
    end
end
