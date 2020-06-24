function hd = estimateHypoexponential(m, Cx)
    Cxsq = Cx^2;
    if (Cxsq < 0.5 || Cxsq >= 1 || Cx < 0)
        error("Invalid variation coefficient for Hyperexponential distribution: %f", Cx);
    end
    if (m <= 0)
        error("Invalid mean value: %f", m);
    end
    
    hd = libtte.rv.HypoexponentialDescriptor((m*([1 1] + [1 -1]*sqrt(1 + 2*(Cxsq - 1)))/2).^-1);
end