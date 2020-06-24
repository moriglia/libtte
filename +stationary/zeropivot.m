function p = zeropivot(M)
% p = zeropivot(M)
% M:      Rate transition matrix (for CTMC)
%         or I-H (transition probability matrix for DTMC)
% p:      Stationary solution
    s = size(M);
    if (length(s) ~= 2)
        error("Matrix is not flat");
    end
    if (s(1)~=s(2))
        error("Matrix is not square");
    end
    
    [L, U] = lu(M');
    
    p = zeros(s(1), 1);
    p(s(1)) = 1;
    for k = (s(1)-1):-1:1
        p(k) = - U(k,(k+1):s(1))*p((k+1):s(1)) / U(k,k);
    end
    
    p = p'/sum(p);
end
