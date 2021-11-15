

function [Label,P]= LP3(W,Y,beta,t)
% [label,P] = LP3(W,Y,alpha,class): Label Propagation 
% Input:
%       - W: the similarity matrix of data 
%       - y: the init state of R  
%       - alpha: the balalnce importance of each term 
%       - class: The ground truth label 
% Output:
%       - label: the cluster assignment for each point
% Usage:
%       [label,P] = LP3(W,Y,alpha,class)
% Set and parse parameters
[n,~]=size(W);
P=Y;
for j=1:t
U=W*P;
P=(1-beta)*Y+beta*U;
end
[~,Label]=max(P,[],2);
end

