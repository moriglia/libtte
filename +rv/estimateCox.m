function cdesc = estimateCox(m, Cx)
    if(Cx <= 0)
        error("Invalid Cx: %f", Cx);
    end
    if (m <= 0)
        error("Invalid m: %f", m);
    end
    
    Cxsq = Cx^2;
    
    if (Cx <= 1)
        k = ceil(1/Cxsq);
        b1 = (2*k*Cxsq+(k-2)-sqrt(k^2+4-4*k*Cxsq))/(2*(Cxsq+1)*(k-1));
        mu = (k-b1*(k-1))/m;
        a = ones(1,k-1);
        a(1) = 1 - b1;
        cdesc = libtte.rv.CoxDescriptor(mu*ones(1, k), a);
    else
        cdesc = libtte.rv.CoxDescriptor([2 1/Cxsq]./m, [1/(2*Cxsq)]);
    end
end