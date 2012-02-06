classdef ListCons < Data.List.List

    properties (SetAccess = private)
        d_value
    end

    properties (GetAccess = private, SetAccess = private)
        d_rest
    end

    methods
        function instance = ListCons (value, rest)
            instance.d_value = value;
            instance.d_rest = rest;
        end

        function result = fmap_ (this, fun)
            rest = this.d_rest.fmap (fun);
            result = Data.List.ListCons (fun (this.d_value), rest);
        end

        function result = m_fmap_ (this, fun)
            this.d_value = fun (this.d_value);
            this.d_rest.m_fmap (fun);
            result = this;
        end

        function result = foldr (this, consFunction, default)
            rest = this.d_rest.foldr (consFunction, default);
            result = consFunction (this.d_value, rest);
        end

        function result = foldl (this, consFunction, default)
            value = consFunction (default, this.d_value);
            result = this.d_rest.foldl (consFunction, value);
        end

        function result = match (this, consFunction, default)
            result = consFunction (this.d_value, this.d_rest);
        end
    end
end