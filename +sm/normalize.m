function ret = normalize(H)
    s = size(H, 1);
    ret = H - H.*eye(s);
    ret = ret + eye(s) - diag(sum(ret, 2));
end