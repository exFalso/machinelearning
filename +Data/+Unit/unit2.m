function result = unit2 (fun)
    result = Data.FunHandle.lam2 * @unit2_;
    function res = unit2_ (val0, val1)
        fun (val0, val1);
        res = Data.Unit.Unit ();
    end
end        
