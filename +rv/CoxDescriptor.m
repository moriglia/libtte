classdef CoxDescriptor
    properties(GetAccess = public, SetAccess = protected)
        mu; % parameters
        a;  % probability of continuing
    end
    methods
        function obj = CoxDescriptor(mu, a, obj)
            if (length(mu) ~= length(a) + 1)
                error("The length of mu must be one more than the length of a");
            end
            if (sum(mu > 0)~=length(mu))
                error("mu must be greater than 0");
            end
            checkA = (a>=0).*(a<=1);
            if (sum(checkA)~= length(a))
                error("All 'a' must be between 0 and 1");
            end
            obj.mu = mu;
            obj.a = a;
        end
        function cd = nextCox(obj)
            cd = libtte.rv.CoxDescriptor(obj.mu(2:length(obj.mu)), obj.a(2:length(obj.a)));
        end
    end
end