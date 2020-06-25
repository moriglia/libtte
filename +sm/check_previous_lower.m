function checker = check_previous_lower(i_upper_bound)
    function ret = check_previous(i, j)
        ret = (i == j+1) && i <= i_upper_bound ;
    end
    
    checker = @check_previous;
end