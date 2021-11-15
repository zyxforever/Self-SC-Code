function [W,Dis,delta]=Computation_SelfSC_W(data,kk,g)
[n,~]=size(data);
data=Normalized_data(data);
%k=length(unique(class));
m=distances_means2(data);
%m=0.1;
delta=2*m/g;
%delta=0.1;
[n,~]=size(data);
Dis=squareform(pdist(data,'euclidean' ));
W=exp(-Dis.^2/delta);
%W= ConstructKNN(data,30,delta);
W=W-diag(diag(W));
[~,I]=sort(W,2,'descend');
W=Get_A(W,I,kk,n);
degs = sum(W, 2);
D    = sparse(1:size(W, 1), 1:size(W, 2), degs);
%L = D - (1/(1+alpha))*W;
degs(degs == 0) = eps;
D = spdiags(1./degs, 0, size(D, 1), size(D, 2));
W =D *W;
W=(W+W')/2;
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