ds = [30 0 10;30 0 70;30 1 20;30 1 80;60 0 40;60 0 60;60 1 50;60 1 60];
labels = [0 0 0 1 0 1 0 1]';


[splits,values,features,decision] = build_numerical_tree(ds,labels,[1 0 1])
fprintf("label\tprediction\n")
for i=1:size(ds,1)
    class = predict_numerical(values,features,decision, ds(i,:),[1 0 1],splits);
    fprintf("%d\t\t%d\n",labels(i),class) 
end       

%use the function
%predict_numerical(values,features,decision,x,numerical,splits)
%where values,features,decision,splits are returned by the function
%build_numerical_tree.
%x is the vector to be evaluated and numerical is an array wich identify
%the numerical columns. if feature i is numerical numerical(i)=1
