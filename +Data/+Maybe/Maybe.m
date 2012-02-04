classdef Maybe < Data.Functor & handle

    methods (Abstract)
        % functor instance
        result = fmap (fun)
        m_fmap (fun)

        result = maybe (default, justFunction)
    end
end