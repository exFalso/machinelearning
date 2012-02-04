classdef Nothing < Data.Maybe.Maybe

    methods
        function instance = Nothing
        end

        % functor instance
        function result = fmap (this, fun)
            result = Nothing ();
        end

        function m_fmap (this, fun)
        end

        function result = maybe (this, default, justFunction)
            result = default;
        end
    end
end