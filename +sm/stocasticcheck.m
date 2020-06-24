function ret = stocasticcheck(H)
    s = size(H);
    if (length(s) ~= 2 || s(1) ~= s(2) || sum(sum(H,2) == ones(s(1), 1)) ~= s(1))
        ret = false;
    else
        ret = true;
    end
end