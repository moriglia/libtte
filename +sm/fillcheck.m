function M = fillcheck(matrix, checker, value)
    [rmax, cmax] = size(matrix);
    for r=1:rmax
        for c=1:cmax
            if checker(r,c)
                matrix(r,c) = value;
            end
        end
    end
    
    M = matrix;
end