function result = lol ()
    import Control.Monad.Lazy.*
    import Prelude.*
    result = curry (@lol_);
    function res = lol_ (f, a)
        import Control.Monad.Lazy.*
        disp(f);
        if a < 2
            res = Lazy.mreturn (a);
        else
            res = f (a / 2.0);
        end
    end
end