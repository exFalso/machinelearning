% a wrapper around a function handle so we can do funky stuff
classdef FunHandle < handle
    
    properties %(GetAccess = private, SetAccess = private)
        d_funHandle
    end
    
    methods
        % (a -> b) -> FunHandle (a -> b)
        function instance = FunHandle (lambda1)
            instance.d_funHandle = lambda1;
        end

        % function application operator so we can treat it the same
        % as an actual handle
        % subsindex :: ({FunHandle (a -> b)}, a) -> b
        function result = subsref (this, val)
            result = this.d_funHandle (val.subs{1});
        end
        
        % "times" so we can simulate fun(a)(b)(c) with fun*a*b*c,
        % freakin matlab parser cant do ()()
        % mtimes :: ({FunHandle (a -> b)}, a) -> b
        function result = mtimes (this, val)
            result = this.d_funHandle (val);
        end
        
        % composition
        % mpower :: ({FunHandle (b -> c)}, FunHandle (a -> b)) ->
        % FunHandle (a -> c)
        function result = mpower (this, fun)
            result = Data.FunHandle.lambda1 (@(x) this * (fun * x));
        end
    end    
end