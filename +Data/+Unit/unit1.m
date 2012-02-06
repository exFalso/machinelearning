function result = unit1 (fun)
    result = Data.FunHandle.lam1 * @unit1_;
    function res = unit1_ (val0)
        fun (val0);
        res = Data.Unit.Unit ();
    end
end
