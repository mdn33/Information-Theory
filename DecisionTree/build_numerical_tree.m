function [splits,values,features,decision] = build_numerical_tree(ds,labels,numerical)
%wrapper function 
[splits,values,features,decision] = numerical_tree(ds,labels,ones(1,size(ds,2))*-1,ones(1,size(ds,2))*-1,[-1],[],[],mode(labels),numerical,zeros(1,size(ds,2)));
 values = values(2:end,:);
 features = features(2:end,:);
 decision = decision(2:end);
end