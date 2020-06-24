function id = estimateIperexponential(m, Cx)

    % Test on Cx
    if (Cx <= 1)
        error("The variation coefficient must be greater than 1. Value is %f", Cx);
    end
    
    % Test on m
    if (m <= 0)
        error("The mean must be greater than zero. Value is %f", m);
    end
    
    % Initial q values
    q = [0.5, 0.5];
    
    Cxsq = Cx^2;
    tries = 0;
    STOP = 1e3;
    while (Cxsq >= 1+2*q(1)/q(2))
        if (tries >= STOP)
            error("Too many trials to find suitable probabilities");
        end
        q(2) = q(2)*0.5;
        q(1) = 1 - q(2);
        tries = tries + 1;
    end
    
    mu = (m*([1 1] + [-sqrt(q(2)/q(1)*(Cxsq - 1)/2) sqrt(q(1)/q(2)*(Cxsq - 1)/2)])).^-1;
    
    id = libtte.rv.IperexponentialDescriptor(q, mu);
end