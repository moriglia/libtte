function ed = estimateErlang(m, Cx)
    if (m <= 0)
        error("Invalid mean %f", m);
    end
    if (Cx >= 1 || Cx <= 0)
        error("Invalid variation coefficient %f", Cx);
    end
    krough = Cx^-2;
    kest = round(krough);
    if (kest == 0)
        error("Coefficient leads to a too poor estimate of the Erlang order: %f", krough);
    end
    if(abs(kest - krough)/krough > 0.25)
        warning("The estimation is poor. Please consider distributions other than Erlang");
    end
    mu = kest / m;
    
    ed = libtte.ErlangDescriptor(kest, mu);
end