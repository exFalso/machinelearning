% Lazy monad for epic laziness

% Lazy :: * -> *
classdef Lazy < handle & Control.Monad.Monad
    properties (GetAccess = private, SetAccess = private)
        % d_thunk :: a
        d_thunk
    end
    
    methods (Access = private)
        % Lazy :: a -> Lazy a
        function instance = Lazy (thunk)
            instance.d_thunk = thunk;
        end
    end
    
    methods
        % bind :: ({Lazy a}, (a -> Lazy b)) -> Lazy b
        function result = bind (this, fun)
            result = Control.Monad.Lazy.Lazy (@bind_);
            function res = bind_ ()
                inter = fun (this.evalLazy ());
                res = inter.evalLazy ();
            end
        end
   
        % strictly evaluate the monad
        % evalLazy :: Lazy a -> a
        function result = evalLazy (this)
            result = this.d_thunk ();
        end
    end
    
    methods (Static)
        % mreturn :: a -> Lazy a
        function result = mreturn (value)
            result = Control.Monad.Lazy.Lazy (@mreturn_);
            function res = mreturn_ ()
                res = value;
            end
        end
    end        
end