classdef Nothing < Data.Maybe.Maybe

    methods
        function instance = Nothing
        end

        % functor instance
        function result = fmap_ (this, fun)
            result = Nothing ();
        end

        function m_fmap_ (this, fun)
        end

        function result = maybe (this, default, justFunction)
            result = default;
        end
    end
end