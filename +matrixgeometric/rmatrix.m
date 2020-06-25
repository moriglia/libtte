function R = rmatrix(varargin)
% r = rmatrix(A0, A1, A2, A3, A4, ..., is_rate_matrix, accuracy, STOP)
% A0, A1, A2, A3, A4, ...:    matrixes that form the probability (or rate) transition matrix
% is_rate_matrix:             set it to true if the matrix is a rate transition matrix
% accuracy:                   the accuracy at which to stop the R matrix calculation
% STOP:                       caution stop condition
    lva = length(varargin);
    if lva < 6
        error("You must specify at least 3 matrixes, whether the matrix is a rate matrix, the accuracy and the maximum number of iterations");
    end
    
    is_rate_matrix = varargin{end - 2};
    accuracy = varargin{end - 1};
    if accuracy < 0
        error("accuracy must be positive");
    end
    STOP = varargin{end};
    A0 = varargin{1};
    dim = size(A0, 1);
    factor = inv(~is_rate_matrix*eye(dim) - varargin{2});
    
    n=0;
    R = zeros(dim);
    while(n < STOP && d > accuracy)
        s = zeros(dim);
        Rp = R*R;
        for k = 0:lva-6
            s = s + Rp*varargin{3+k};
            Rp = Rp*R;
        end
        
        tmp = R;
        R = (s + A0)*factor;
        d = max(abs(tmp - R), [], 'all');
        n = n + 1;
    end
   
end