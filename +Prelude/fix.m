% fix :: ((a -> Lazy a) -> a -> Lazy a) -> a -> Lazy a
function result = fix (f)
    import Data.FunHandle.*
    result = lambda1 (fx ((@(g, a) g >= (@(h) f * h * a))))

    % fx :: (Lazy (a -> Lazy a) -> a -> Lazy a) -> a -> Lazy a
    function result = fx (fun)
        import Control.Monad.Lazy.*
        lazyFix = (@(x) Lazy.mreturn (fx (x)))
        lazyApp = Lazy.mreturn (fun) >= lazyFix
        result = (@(x) fun (lazyApp, x));
    end
end
