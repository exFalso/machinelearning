classdef BinTreeBranch < Data.BinTree.BinTree

    properties (SetAccess = private)
        d_branchValue
        d_left
        d_right
    end

    methods
        function instance = BinTreeBranch (value, leftTree, rightTree)
            instance.d_branchValue = value;
            instance.d_left = leftTree;
            instance.d_right = rightTree;
        end

        function result = fmap (this, fun)
            left = this.d_left.fmap (fun);
            right = this.d_right.fmap (fun);
            value = fun (this.d_branchValue);
            result = Data.BinTree.BinTreeBranch (value, left, right);
        end

        function m_fmap (this, fun)
            this.d_branchValue = fun (this.d_branchValue);
            this.d_left.m_fmap (fun);
            this.d_right.m_fmap (fun);
        end

        function result = fold (this, branchFunction, leafFunction)
            lVal = this.d_left.fold (branchFunction, leafFunction);
            rVal = this.d_right.fold (branchFunction, leafFunction);
            result = branchFunction (this.d_branchValue, lVal, rVal);
        end

        function result = chooseLeaf (this, chooseFun)
            if (chooseFun (this.d_branchValue))
                result = this.d_left.chooseLeaf (chooseFun);
            else
                result = this.d_right.chooseLeaf (chooseFun);
            end
        end

        function result = match (this, branchFunction, leafFunction)
            result = branchFunction (this.d_value, this.d_left, ...
                                     this.d_right);
        end
    end
end