load("data/data_MNIST10k.mat");
o=10;
t=20;
beta=0.99;
lambda=0.1;
kk=10;
m=60;
X=data;Y=labels;
[n,~]=size(X);
k=length(unique(Y));
p=min(10*k,n);

X=Normalized_data(X);
[W,Dis,delta]=Computation_SelfSC_W(X,kk,m);

Label=script_lp(W,Y,o,t,p,beta,lambda);
[~,acc,~,~,ari,nmi]=accuray_measures(Label,Y);
