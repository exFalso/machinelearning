classdef Matrix < handle & Data.Functor
    
    properties (SetAccess = private)
        d_matrix
    end
        
    methods
        function instance = Matrix (matrix)
            instance.d_matrix = matrix;
        end
        
        function result = fmap (this, fun)
            result = arrayfun (fun, this.d_matrix);
        end
        
        function m_fmap (this, fun)
            this.d_matrix = this.fmap (fun);
        end
        
        function result = filter (this, fun)
            result = this.d_matrix (fun (this.d_matrix));
        end
        
        function result = m_filter (this, fun)
            this.d_matrix = this.filter (fun);
        end
    end
end