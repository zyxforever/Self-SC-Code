load("data/data_MNIST10k.mat");
X=data;Y=labels;

o=20;
t=20;
beta=1;
lambda=0.1;
kk=10;
m=90;
[n,~]=size(X);
k=length(unique(Y));
p=min(10*k,n);

X=Normalized_data(X);
[W,Dis,delta]=Computation_SelfSC_W(X,kk,m);

Label=script_lp(W,Y,o,t,p,beta,lambda);
[~,acc,~,~,ari,nmi]=accuray_measures(Label,Y);
