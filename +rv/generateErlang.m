function data = generateErlang(descriptor, samples)
    data = libtte.rv.RandomVariableSet(sum(exprnd(1/descriptor.mu, descriptor.k, samples)));
end