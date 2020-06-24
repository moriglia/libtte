function ret = dtmcevolution(H, p0, n)
% ret = dtmcevolution(H, p0, span)
% H:      Stocastic transition probability matrix DIMxDIM
% p0:     Initial probability vector of DIM elements
% n:      stop evaluating evolution at the step n
% ret:    matrix. Each column is a probability vector of length DIM.
%         The number of colums equals the number of elements of the span
    if (~libtte.sm.stocasticcheck(H))
        error("The H matrix is not stocastic");
    end
    ret = zeros(length(p0), n);
    tmp = H';
    ret(:,1) = tmp*p0';
    if (n >= 2)
        for k=2:n
            ret(:,k) = tmp*ret(:, k - 1);
        end
    end
end