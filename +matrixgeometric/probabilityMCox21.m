function [p0, R] = probabilityMCox21(varargin)
% [B, A] = probabilityMCox21(lambda, mu1, mu2, alpha, accuracy, STOP)
%     lambda:           Poisson arrival rate
%     mu1:              phase 1 service rate
%     mu2:              phase 2 service rate
%     alpha:            routing probability from phase 1 to phase 2
%     accuracy:         the minimum accuracy for the R matrix approximation
%     STOP:             the maximum number of iterations to find R
% 
% [B, A] = probabilityMCox21(lambda, cd, accuracy, STOP)
%     cd:         CoxDescriptor with 2 phases and 1 routing probability
%     
% Return:
%     A:          matrix list of the second block column
%                 of the matrix (rate or probability)
%                 for the matrix geometric method
%     B:          matrix list of the first block column
%                 of the matrix (rate or probability)
%                 for the matrix geometric method
    switch(nargin)
        case(4)
            % Assuming that the argument is a CoxDescriptor
            % with 2 phases; raises errors when this is not true
            cd = varargin{2};
            mu = cd.mu;
            a = cd.a;
        case(6)
            mu = [varargin{2}, varargin{3}] ;
            a = varargin{4};
        otherwise
            error("Incorrect number of arguments");
    end
    lambda = varargin{1};
    
    if lambda*(1/mu(1) + a/mu(2)) >= 1
        error("The chain is not ergodic");
    end
    
    A{1} = [lambda 0; 0 lambda];
    A{2} = -A{1} + [-mu(1) a*mu(1); 0 -mu(2)];
    A{3} = [(1-a)*mu(1) 0; mu(2) 0];
    B{1} = -A{1};
    B{2} = A{3};
    
    % Pass true as 'is_rate_matrix': the Cox distribution is a continuous
    % time distribution and the matrix associated to the chain is
    % a rate transition matrix
    R = libtte.matrixgeometric.rmatrix(A{:}, true, varargin{(end-1):end});
    p0 = libtte.matrixgeometric.findp0(R, B{:}, true);
end