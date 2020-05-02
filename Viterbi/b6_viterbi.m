function decoded_vect = b6_viterbi(clean_vect)
   
    code1 = [];
    code2 = [];
    weights = zeros(2,1);
    for i=1:2:size(clean_vect,2)
       y = clean_vect(i:i+1);
       distances = [hamming(y, [0 0]) hamming(y, [0 1]);hamming(y, [1 1]) hamming(y, [1 0])];
       if i==1 %lo stato iniziale è sempre uno
          distances(2,1) = 3;
          distances(2,2) = 3;
       end
       
          [peso1,index1] = min([distances(1,1) + weights(1,1), distances(2,1) + weights(2,1)]);
          [peso2,index2] = min([distances(1,2) + weights(1,1), distances(2,2) + weights(2,1)]);
        
          tmp = code1;
          if index1 == 1
           code1 = [code1 0];
          else
           code1 = [code2 0];
          end
          
          if index2 == 1
            code2 = [tmp 1];
          else
            code2 = [code2 1];
          end
          
          weights = [peso1;peso2];

      end
    if peso1 < peso2 
        decoded_vect = code1;
    else
        decoded_vect = code2;
    end
    
end


function d = hamming(a, b)
d = 0;
for i=1:size(a,2)
    if a(i) ~= b(i)
        d = d + 1;
    end
end
end