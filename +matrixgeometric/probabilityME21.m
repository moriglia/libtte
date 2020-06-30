function [p0, R] = probabilityME21(lambda, mu, accuracy, STOP)
% [B, A] = probabilityMCox21(lambda, mu, accuracy, STOP)
%     lambda:           Poisson arrival rate
%     mu:               phase 1 & 2 service rate
%     accuracy:         the minimum accuracy for the R matrix approximation
%     STOP:             the maximum number of iterations to find R
% 
% [B, A] = probabilityMCox21(lambda, ed, accuracy, STOP)
%     ed:         ErlangDescriptor with 2 phases
%     
% Return:
%     A:          matrix list of the second block column
%                 of the matrix (rate or probability)
%                 for the matrix geometric method
%     B:          matrix list of the first block column
%                 of the matrix (rate or probability)
%                 for the matrix geometric method
    import libtte.rv.* libtte.matrixgeometric.*;

    if isa(mu, 'ErlangDescriptor')
        mu = mu.mu;
    else
        mu = mu;
    end
    
    if 2*lambda/mu >= 1
        error("The chain is not ergodic");
    end
    
    A{1} = [lambda 0; 0 lambda];
    A{2} = -A{1} + [-mu mu; 0 -mu];
    A{3} = [0 0; mu 0];
    B{1} = -A{1};
    B{2} = A{3};
    
    % Pass true as 'is_rate_matrix': the Erlang distribution is a
    % continuous time distribution and the matrix associated to the chain
    % is a rate transition matrix
    R = rmatrix(A{:}, true, accuracy, STOP);
    p0 = findp0(R, B{:}, true);
end