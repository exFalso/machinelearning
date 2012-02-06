% (Monad m) => m :: * -> *
classdef Monad < handle

    methods (Abstract)
        % bind :: ({m a}, (a -> m b)) -> m b
        result = bind (fun)
    end

    methods (Static, Abstract)
        % mreturn :: a -> m a
        result = mreturn (value)
    end
    
    methods
        % >= overload for bind
        function result = ge (this, fun)
            result = this.bind (fun);
        end
    end
    
    methods (Static)
        % liftM :: (a -> b) -> (m a -> m b)
        function result = liftM (f)
            result = Data.FunHandle.lambda1 (@liftM_);
            function res = liftM_ (ma)
                res = ma >= (@(a) mreturn (f (a)));
            end
        end
    end
end