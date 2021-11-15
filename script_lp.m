
function [Label]=script_lp(W,class,o,t,p,beta,lambda)
k=length(unique(class));
%[S]=max_min_distance(Dis,p);
[Label,V]= SSL_LP2(W,k,o,t,p,beta,lambda);
end

function A=Get_A(W,I,k,n)
A=zeros(n,n);
for i=1:n
    A(i,I(i,1:k))=W(i,I(i,1:k));
    %A(i,I(i,1:k))=1;
end
% degs = sum(A, 2);
% D    = sparse(1:size(A, 1), 1:size(A, 2), degs);
% %L = D - (1/(1+alpha))*W;
% degs(degs == 0) = eps;
% D = spdiags(1./(degs.^0.5), 0, size(D, 1), size(D, 2));
% A =D *A * D;
end
