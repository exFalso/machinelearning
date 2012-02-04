classdef ListEmpty < Data.List.List

    methods
        function instance = ListEmpty
        end

        function result = fmap (this, fun)
            result = Data.List.ListEmpty ();
        end

        function m_fmap (this, fun)
        end

        function result = foldr (this, consFunction, default)
            result = default;
        end

        function result = foldl (this, consFunction, default)
            result = default;
        end

        function result = match (this, consFunction, default)
            result = default;
        end
    end
end