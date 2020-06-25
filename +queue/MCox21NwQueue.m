classdef MCox21NwQueue
    properties(SetAccess = protected, GetAccess= public)
        cd ;        % Cox Descriptor
        lambda;
        Nw;
        rtm ;       % rate transition matrix
    end
    methods
        function obj = MCox21NwQueue(lambda, mu1, mu2, a, Nw, obj)
            obj.lambda = lambda;
            obj.Nw = Nw;
            obj.cd = libtte.rv.CoxDescriptor([mu1, mu2], a);
            
            M = zeros(2*Nw + 3);
            
            fillcheck = @libtte.sm.fillcheck;
            M = fillcheck(M, @lambdacheck, lambda);
            M = fillcheck(M, @phase1to2check, a*mu1);
            M = fillcheck(M, @phase1completecheck, (1-a)*mu1);
            M = fillcheck(M, @phase2completecheck, mu2);
            obj.rtm = libtte.sm.normalize(M, true);
            
            function ret = lambdacheck(i, j)
                ret = (i==1 && j==2) || (i>=2 && j == i+2) ;
            end
            function ret = phase1to2check(i, j)
                ret = mod(i,2) == 0 && j == i + 1;
            end
            function ret = phase1completecheck(i,j)
                ret = mod(i, 2) == 0 && j == i - 2 || i==2 && j == 1 ;
            end
            function ret = phase2completecheck(i, j)
                ret = (mod(i, 2) == 1 && j == i - 3) || (i==3 && j ==1);
            end
        end
    end
    methods (Static)
        function i = state2index(nw, phi)
            if nw == 0 || nargin < 2
                phi = 2;
            end
            
            i = 2*nw + phi - 1;
        end
        function [nw, phi] = index2state(i)
            nw = floor(i/2);
            phi = mod(i, 2) + 1;
        end
    end
end