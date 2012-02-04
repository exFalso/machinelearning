classdef Just < Data.Maybe.Maybe

    properties (SetAccess = private)
        d_value
    end

    methods
        function instance = Just (value)
            instance.d_value = value;
        end

        function result = fmap (this, fun)
            result = Just (fun (this.d_value));
        end

        function m_fmap (this, fun)
            this.d_value = fun (this.d_value);
        end

        function result = maybe (this, default, justFunction)
            result = justFunction (this.d_value);
        end
    end
end