classdef Just < Data.Maybe.Maybe

    properties (SetAccess = private)
        d_value
    end

    methods
        function instance = Just (value)
            instance.d_value = value;
        end

        function result = fmap_ (this, fun)
            result = Data.Maybe.Just (fun (this.d_value));
        end

        function result = m_fmap_ (this, fun)
            this.d_value = fun (this.d_value);
            result = this;
        end

        function result = maybe (this, default, justFunction)
            result = justFunction (this.d_value);
        end
    end
end