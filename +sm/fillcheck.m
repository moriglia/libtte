function M = fillcheck(matrix, checker, value)
% M = fillcheck(matrix, checker, value)
% This function fills the 'value' into the cells 
% of the matrix that satisfy the check implemented by 'checker'
% Note that if 'value' is a function, it will be called
% with the matrix indexes that satisfy the check in order to retrieve
% a value which is dependent on the indexes.

    is_function_handle = isa(value, 'function_handle');
    [rmax, cmax] = size(matrix);
    for r=1:rmax
        for c=1:cmax
            if checker(r,c)
                if is_function_handle
                    matrix(r,c) = value(r,c);
                else
                    matrix(r,c) = value;
                end
            end
        end
    end
    
    M = matrix;
end