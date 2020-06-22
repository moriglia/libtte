classdef RandomVariableSet
    properties(SetAccess = private)
        data
%         IsMeanCached = false;
%         IsVarianceCached = false;
%         IsVariationCoefficientCached = false;
%         cachedMean;
%         cachedVariance;
%         cachedVariationCoefficient;
    end
    methods
        function obj = RandomVariableSet(inputData)
            obj.data = inputData;
        end
        function m = mean(obj)
            m = mean(obj.data);
        end
        function v = var(obj)
            v = var(obj.data);
        end
        function Cx = variationCoefficient(obj)
            Cx = sqrt(obj.var()) / obj.mean();
        end
    end
end