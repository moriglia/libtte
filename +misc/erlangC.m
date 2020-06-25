function pd = erlangC(Ao, Ns)
    if Ns == 1
        pd = Ao;
    elseif Ns < 1
        error("There must be at least 1 server");
    elseif Ao == floor(Ao)
        pd = Ns/Ao/(1 + (Ns/Ao - 1)/erlangB(Ao, Ns));
    else
        pd = (1 - Ao / (Ns - 1)) / ((Ns / Ao - 1) / erlangC(Ao, Ns - 1) - 1 / (Ns - 1));
    end
end