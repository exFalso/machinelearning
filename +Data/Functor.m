% (Functor f) => f :: * -> *
classdef Functor < handle
    
    properties (GetAccess = public, SetAccess = protected)
        fmap
        m_fmap
    end
    
    methods
        function instance = Functor ()
            instance.fmap = Data.FunHandle.lam1 * @instance.fmap_;
            instance.m_fmap = Data.FunHandle.lam1 * @instance.m_fmap_;
        end
    end

    methods (Abstract)
        % fmap :: ({f a}, a -> b) -> f b
        result = fmap_ (fun)
        
        % mutating version (returns reference to self)
        % m_fmap :: ({f a}, a -> b) -> f b
        result = m_fmap_ (fun)
    end
end