classdef HypoexponentialDescriptor
    properties(SetAccess=protected, GetAccess=public)
        mu;
    end
    methods 
        function obj = HypoexponentialDescriptor(mu, obj)
            obj.mu = mu;
        end
    end
end