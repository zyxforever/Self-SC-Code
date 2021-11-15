function [sum,class]=equation(Column)
k=unique(Column);
m=length(k);
n=length(Column);
sum=zeros(1,m);
for i=1:n
    for j=1:m
        if isequal(Column(i),k(j))
            sum(j)=sum(j)+1;
            class(j,sum(j))=i;
        end
    end
end
