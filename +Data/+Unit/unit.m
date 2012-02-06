function result = unit (fun)
    result = @unit_;
    function res = unit_ ()
        fun ();
        res = Data.Unit.Unit ();
    end
end
