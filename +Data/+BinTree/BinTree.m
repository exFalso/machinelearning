classdef BinTree < handle & Data.Functor

    methods (Abstract)
        % Functor instance
        result = fmap_ (fun)
        m_fmap_ (fun)

        % folds the tree using two handles
        result = fold (branchFunction, leafFunction)

        % chooses a leaf using the (possibly stateful) handles for branches
        result = chooseLeaf (chooseFun)

        % pattern matches
        result = match (branchFunction, leafFunction)
    end
end