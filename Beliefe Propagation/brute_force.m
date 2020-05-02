function marginals = brute_force(y,p,c)

delta = zeros(2,size(y,2));
for i=1:2
    for j=1:size(y,2)
        if y(j) == (i-1)
            delta(i,j) = 1-p;
        else
            delta(i,j) = p;
        end
    end
end

prob = ones(1,pow2(2));
for i=(1:4)
   for j=(1:4)
       prob(i) = prob(i)*delta(c(i,j)+1,j);
   end
end
prob = prob/sum(prob);

marginals = zeros(2,4);
for i=(1:2)
    for j=(1:4)
        for z=(1:4)
            if c(z,j)==(i-1)
                marginals(i,j) = marginals(i,j) + prob(z);
            end
        end
    end
end

end
