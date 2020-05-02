function label = predict(values,features,decision, x,numerical,split)

for i=1:size(values,1)
    found=1;
    for j=1:size(values,2)
        if values(i,j) ~= -1 && features(i,j) ~=-1
            if numerical(features(i,j))==1
                if  x(features(i,j))>split(features(i,j)) && values(i,j)==0
                    found=0;
                    break
                elseif x(features(i,j))<=split(features(i,j)) && values(i,j)==1
                    found=0;
                    break
                end
            else
                if x(features(i,j))~= values(i,j) 
                    found=0;
                    break
                end
            end
        end
    end
    if found==1
        label = decision(i);
        break
    end
end
end
