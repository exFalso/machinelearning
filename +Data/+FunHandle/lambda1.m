% lambda1 :: (a -> b) -> FunHandle (a -> b)
function result = lambda1 (fun)
    result = Data.FunHandle.FunHandle (fun);
end
