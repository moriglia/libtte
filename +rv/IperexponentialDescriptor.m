classdef IperexponentialDescriptor
    properties(GetAccess=public, SetAccess=protected)
        phaseCount;
        phaseProbability;
        phaseParameter; % Inverse of the mean
    end
    
    methods
        function obj = IperexponentialDescriptor(phaseProbabilityVector, phaseParameterVector, obj)
            s = size(phaseProbabilityVector);
            if (size(s, 2) ~= 2 || s(1) ~= 1)
                error("Incorrect input size for first parameter");
            end
            if (s ~= size(phaseParameterVector))
                error("The 2 input vector sizes are different");
            end
            obj.phaseCount = s(2);
            obj.phaseProbability = phaseProbabilityVector;
            obj.phaseParameter = phaseParameterVector;
        end
    end
    
end