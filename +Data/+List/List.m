classdef List < handle & Data.Functor & Data.Monad

    methods (Abstract)
        % Functor instance
        result = fmap (fun)
        m_fmap (fun)

        % foldrs the list using the handle and a default
        result = foldr (consFunction, default)

        % foldls the list using the handle and a default
        result = foldl (consFunction, default)

        % pattern matches
        result = match (consFunction, default)
    end

    methods
        % concatenate a list of lists (COPY)
        function result = concat (this)
            result = this.foldl (@foldOne, Data.List.ListEmpty ());

            function res = foldOne (cl, l)
                res = l.foldl (@(rest, a) Data.List.ListCons (a, rest), cl);
            end
        end

        function result = bind (this, fun)
            result = this.fmap (fun).concat ();
        end    
            
    end

    methods (Static)
        % Monad instance
        function result = mreturn (value)
            result = Data.List.ListCons (value, Data.List.ListEmpty ());
        end
    end
end