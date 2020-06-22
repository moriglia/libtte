function data = generateIperexponential(descriptor, samples)
    data = randsrc(1, samples, [descriptor.phaseParameter.^-1; descriptor.phaseProbability]);
    data = exprnd(data);
    data = libtte.RandomVariableSet(data);
end