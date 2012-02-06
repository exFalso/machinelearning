classdef Maybe < handle & Data.Functor & Control.Monad

    methods (Abstract)
        % functor instance
        result = fmap_ (fun)
        m_fmap_ (fun)

        result = maybe (default, justFunction)
    end
    
    methods
        function result = bind (this, fun)
            result = this.maybe (Data.Maybe.Nothing (), fun);
        end
    end
    
    methods (Static)
        function result = mreturn (value)
            result = Data.Maybe.Just (value);
        end
    end
end