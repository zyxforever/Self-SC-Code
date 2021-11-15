function sum=class_distribution(class,attribute,data)
n=length(class);
k=length(attribute);
sum=zeros(1,k);
for i=1:n
    for j=1:k
        if isequal(data(class(i)),attribute(j))
            sum(j)=sum(j)+1;
            
        end
    end
end

%for i=1:k
   %sum(i)=sum(i)/n;
%end
