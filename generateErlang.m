function data = generateErlang(descriptor, samples)
    data = libtte.RandomVariableSet(sum(exprnd(1/descriptor.mu, descriptor.k, samples)));
end