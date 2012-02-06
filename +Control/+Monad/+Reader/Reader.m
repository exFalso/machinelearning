classdef Reader < handle & Control.Monad.Monad
    
    properties (GetAccess = private, SetAccess = private)
        d_runReader
    end
    
    methods (Access = private)
        function instance = Reader (runReader)
            instance.d_runReader = runReader;
        end
    end

    methods (Static)
        function result = mreturn (value)
            result = Reader (const (value));
        end
    end
    
    methods
        function result = ask ()
            result = Reader (id);
        end
        
        function result = runReader (this, r)
            result = this.d_runReader (r);
        end
        
        % (r -> a) -> (a -> r -> b) -> (r -> b)
        function result = bind (this, fun)
            result = Reader (@bindFun);
            function res = bindFun (r)
                a = this.runReader (r);
                rb = fun (a);
                res = rb.runReader (r);
            end
        end
    end
end
        
