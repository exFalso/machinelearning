classdef Monad < handle

    methods (Abstract)
        result = bind (fun)
    end

    methods (Static, Abstract)
        result = mreturn (value)
    end
end