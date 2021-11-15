function [Label,V]= SSL_LP2(W,k,o,t,p,beta,lambda)
% [label,P] =  SSL_LP(W,k,class)  Self-supervised Spectral CLustering 
%       - W:  the similarity matrix of data 
%       - k: the number of clusters 
%       - class: The ground truth label 
% Output:
%       - label: the cluster assignment for each point
% Usage:
%      [label,P] =  SSL_LP(W,k,class) 
% Requre:
%       LP3.m
% Set and parse parameters
[n,~]=size(W);
Q=eye(n);
S=randperm(n);
p=min(p,n);
Y=Q(:,S(1:p));
A=[];
for i=1:o
    %cur_lambda=exp(-i);
    [~,V]=LP3(W,Y,beta,t);
    V=bsxfun(@rdivide, V, sqrt(sum(V.^2, 2))+eps);
    Y=Y+V*lambda;
    A=V;
end
[Label,~,~,DD]= kmeans(A, k, 'EmptyAction', 'singleton','Replicates',10);
end




