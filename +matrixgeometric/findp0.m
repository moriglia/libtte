function p0 = findp0(R, varargin)
% p0 = findp0(R, B0, B1, B2, B3, B4, ..., is_rate_matrix=false)
% R:              the R matrix of the matrix geometric method
% B0, B1, ...:    matrixes that form the rate (or transition) probability matrix
% is_rate_matrix: set it to true if the queue is continuous time
    lva = nargin - 1;
    if lva < 1 || isa(varargin{end}, 'logical') && lva < 2
        error("You must specify at least a matrix among the B matrixes");
    end
    if isa(varargin{end}, 'logical')
        is_rate_matrix = varargin{end};
        lva = lva - 1;
    else
        is_rate_matrix = false;
    end
    
    dim = size(R, 1);
    
    Rtmp = eye(dim);
    S = zeros(dim);
    for k=1:lva
        S = S + Rtmp * varargin{k};
        Rtmp = Rtmp * R;
    end
    
    p0 = libtte.stationary.zeropivot(S - eye(dim)*~is_rate_matrix);
    norm_factor = sum(p0/(eye(dim) - R));
    p0 = p0/norm_factor;
end