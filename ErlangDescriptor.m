classdef ErlangDescriptor
    properties(GetAccess=public, SetAccess=protected)
        k;  % number of phases
        mu; %parameter of each phase
    end
    methods
        function obj = ErlangDescriptor(k, mu, obj)
            obj.k = k;
            obj.mu = mu;
        end
        function m = mean(obj)
            m = obj.k / obj.mu;
        end
        function v = var(obj)
            v = obj.k/obj.mu^2 - (obj.k/obj.mu)^2;
        end
        function variationCoefficient(obj);
            m = obj.k^(-0.5);
        end
    end
end