function data = generateCox(cd, samples, upper_layer)
    data = exprnd(cd.mu(1)^-1, 1, samples);
    if (length(cd.mu) > 1)
        data = data + (rand(1, samples) < cd.a(1)).*libtte.generateCox(cd.nextCox(), samples, false);
    end
    if (nargin <= 2 || upper_layer)
        data = libtte.RandomVariableSet(data);
    end
end