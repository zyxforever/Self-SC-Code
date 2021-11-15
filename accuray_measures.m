function [statistic,AC,PE,RE,ARI,NMI]=accuray_measures(new_class,class)
[sums,cluster]=equation(new_class);
r=length(new_class);
l=length(sums);
cs=unique(class);
n=length(cs)+2;
statistic=zeros(l,n);
statistic(:,1)=sums;
ms=0;
PE=0;
AC=0;
RE=0;
true_class=zeros(1,r);
for i=1:l
    s=class_distribution(setdiff(cluster(i,:),0),cs,class);
    for j=2:n-1
        statistic(i,j)=s(j-1);
    end
    [maxvalue,maxrow]=max(s);
    attr_class=unique(class);
    for clusteri=1:length(setdiff(cluster(i,:),0))
        if isequal(class(cluster(i,clusteri)),attr_class(maxrow))
            true_class(cluster(i,clusteri))=1;
        end
    end
    statistic(i,n)=maxvalue/sums(i);
    PE=PE+maxvalue/sums(i);
    ms=ms+max(s);
end
for i=1:l
    [maxvalue,maxrow]=max(statistic(i,[2:n-1]));
if sum(statistic(:,maxrow+1))~=0
    RE=RE+maxvalue/sum(statistic(:,maxrow+1));
    %RE=RE+max(statistic(:,i+1))/sum(statistic(:,i+1));
end
end
AC=ms/r;
PE=PE/l;
RE=RE/l;
ARI=CorrectedRandIndex(new_class,class);
NMI=MutualInfromation(new_class,class);