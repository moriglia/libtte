function pl = erlangB(Ao, Ns)
    if Ns < 0
        error("Ns must be non negative");
    end
    if Ns == 0
        pl = 1;
    else
        pl = Ao / (Ao + Ns/erlangB(Ao, Ns - 1));
    end
end