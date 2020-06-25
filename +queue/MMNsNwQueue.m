classdef MMNsNwQueue
    properties(SetAccess=protected, GetAccess=public)
        mu;
        lambda;
        Ns;
        Nw;
        rtm; % rate transition matrix
    end
    methods
        function obj = MMNsNwQueue(lambda, mu, Ns, Nw, obj)
            obj.mu = mu;
            obj.lambda = lambda;
            obj.Ns = Ns;
            obj.Nw = Nw;
            
            obj.rtm = zeros(Ns + Nw + 1);
            obj.rtm = libtte.sm.fillcheck(obj.rtm, @libtte.sm.check_next, lambda);
            obj.rtm = libtte.sm.fillcheck(obj.rtm, libtte.sm.check_previous_greater(Ns+1), Ns*mu);
            obj.rtm = libtte.sm.fillcheck(obj.rtm, libtte.sm.check_previous_lower(Ns), @yieldrate);
            obj.rtm = libtte.sm.normalize(obj.rtm, true);
            
            function val = yieldrate(~,c)
                val = c * mu;
            end
        end
    end
    methods(Static)
        function s = index2state(i)
            s = i - 1;
        end
        function i = state2index(s)
            i = s + 1;
        end
    end
end