function [splits,values,features,decision]= numerical_tree(ds,labels,values,features,decision,path,sequence,common,numerical,splits)

p = get_prob(labels);
H_c = H(p);

best_split = zeros(1,size(ds,2));

if H_c == 0 || isempty(ds)
     if ~isempty(labels)
         %if it is not empty just take one label (are all the same)
         decision = [decision; labels(1)];
     else
         %otherwise take the most common class of the parent
         decision = common;
     end
     %pay attention to the dimension of the path since it can be shorter
     %than the number of features. I decided to use padding. 
     if size(values,2) > length(path)
            sequence = [sequence ones(1,size(values,2)-length(path))*-1];
            path = [path ones(1,size(values,2)-length(path))*-1];
     end
     %finally append to the matrices the current path and the current
     %sequence of features
     values = [values; path];
     features = [features; sequence];
     return
end

common = mode(labels);

for j = 1:size(ds,2)
      if ismember(j,sequence)
        IGR(j) = -1; %ignore the features already used
        continue
      end
      if numerical(j)==0
        IGR(j) = compute_igr(ds(:,j),labels,H_c);
      else
          tresholds = unique(ds(:,j));
          igr_x = zeros(size(tresholds));
          for t=1:size(tresholds)
              x = zeros(1,size(ds,1))';
              for z =1:size(x)
                  if ds(z,j)>tresholds(t)
                      x(z) = 1;
                  end
              end
              igr_x(t) = compute_igr(x,labels,H_c);
          end
          [IGR(j) index]= max(igr_x);
          best_split(j) = tresholds(index);
      end
end

[~, index] = max(IGR);

if numerical(index)==1
    for i=1:size(ds,1)
        if ds(i,index)>best_split(index)
            ds(i,index) = 1;
        else
            ds(i,index) = 0;
        end
    end
    splits(index) = best_split(index);
end

for value = unique(ds(:,index))'
   [splits,values,features,decision] = numerical_tree(ds(ds(:,index)==value,:),labels(ds(:,index) == value),values,features,decision,[path value],[sequence index],common,numerical,splits);
end

end

function p = get_prob(x)
un = unique(x);
p = zeros(1, length(un));
for i=1:length(p)
    p(i) = sum(x == un(i));
end
p = p/length(x);
end

function igr = compute_igr(x,labels,H_c)
        values = unique(x);
        p_j = get_prob(x); %takes one column
        H_j = H(p_j); %compute H(Xj)
        H_cx = zeros(1, length(p_j));
        % Computing H(C|X=xj)
        for i=1:length(p_j)
            labels_filtered = labels(x == values(i),:);
            H_cx(i) = H(get_prob(labels_filtered));
        end
        H_cxj = sum(p_j.*H_cx);
        I_cxj = H_c - H_cxj;
        igr = I_cxj/H_j;
end