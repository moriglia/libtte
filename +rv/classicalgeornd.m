function data = classicalgeornd(p, samples)
% Generate Classical Geometric R.V. Samples
% classicalgeornd(p, samples)
% p is the probability of having an event in any time slot
% samples is the data vector length
% The data will be distributed like the probability
% of having the first event in n steps: p*(1-p)^(n-1)
    data = ones(1, samples) + geornd(p, 1, samples);
end