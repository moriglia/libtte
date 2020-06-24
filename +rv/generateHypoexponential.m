function data = generateHypoexponential(descriptor, samples)
    k = length(descriptor.mu);
    data = zeros(1, samples);
    for i=1:k
        data = data + exprnd(descriptor.mu(i)^-1, 1, samples);
    end
    
    data = libtte.rv.RandomVariableSet(data);
end