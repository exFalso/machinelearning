classdef Functor < handle
    methods (Abstract)
        % functor map, builds up new structures
        result = fmap (this, fun)

        % mutating version
        m_fmap (this, fun)
    end
end