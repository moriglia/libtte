function [eigenval, eigenvect, p0coeff] = findeigenvector(H, p0)
% [eigenval, eigenvect, p0coeff] = findeigenvector(H, p0)
% H:      matrix to find eigenvalues and eigenvectors of.
% p0:     initial probability vector;
% 
% eigenval:   vector of eigenvalues
% eigenvect:  matrix of left eigenvectors (one per row (one per eigenval))
% p0coeff:    coefficients that express p0 as a linear combination of eigenvectors
    [eigenvect , eigenval] = eig(H');
    eigenvect = eigenvect';
    p0coeff = p0/eigenvect;
end

