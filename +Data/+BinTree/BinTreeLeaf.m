classdef BinTreeLeaf < Data.BinTree.BinTree

    properties (GetAccess = private, SetAccess = private)
        d_leafValue
    end

    methods
        function instance = BinTreeLeaf (value)
            instance.d_leafValue = value;
        end

        function result = fmap_ (this, fun)
            result = Data.BinTree.BinTreeLeaf (fun ...
                                               (this.d_leafValue));
        end

        function m_fmap_ (this, fun)
        end

        function result = fold (this, branchFunction, leafFunction)
            result = leafFunction (this.d_leafValue);
        end

        function result = chooseLeaf (this, chooseFun)
            result = this.d_leafValue;
        end

        function result = match (this, branchFunction, leafFunction)
            result = leafFunction (this.d_leafValue);
        end
    end
end
