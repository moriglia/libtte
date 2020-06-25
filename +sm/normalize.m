function ret = normalize(H, is_rate_transition_matrix)
    if nargin < 2
        is_rate_transition_matrix = false;
    end
    s = size(H, 1);
    ret = H - H.*eye(s);
    ret = ret + (~is_rate_transition_matrix)*eye(s) - diag(sum(ret, 2));
end