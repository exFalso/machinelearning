% in order to make matlab functions like disp behave sane we first have to
% "unitify" them so that they return unit. then uncurry them and put
% them into FunHandle
classdef Unit < handle
        
    methods
        function instance = Unit ()
        end
    end

end