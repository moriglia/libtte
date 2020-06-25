function checker = check_previous_greater(i_lower_bound)
% checker = check_previous_greater(i_lower_bound)
    if (nargin < 1)
        i_lower_bound = 2;
    end
    function ret = check_previous(i, j)
        ret = (i == j+1) && i >= i_lower_bound ;
    end
    
    checker = @check_previous;
end