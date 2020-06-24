function p = equationelimination(M)
% p = equationelimination(M)
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
    
    B = M(1:(s(1)-1), 1:(s(1)-1));
    d = M(s(1), 1:(s(1)-1));
    
    p = ones(1, s(1));
    p(1:(s(1)-1)) = -d/B;
    p = p/sum(p);

end