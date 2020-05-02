function marginals = distributed(y,p,H)

M0 = [];
M1 = [];
for i=1:length(y)
    if y(i)==1
        M0 = [M0; [p p]];
        M1 = [M1; [1-p 1-p]];
    else
        M0 = [M0; [1-p 1-p]];
        M1 = [M1; [p p]];
    end
end
M0 = M0.*H;
M1 = M1.*H;

%gallager formula
newM1 = zeros(size(M1));
for i=1:size(M1,1)
   product = prod(1-2.*M1(1:end~=i, :),1);
   newM1(i,:) = (1 + product)./2;
end
M0 = newM1.*H;
M1 = (1-newM1).*H;

probabilities = ([y' y'] == [0 1]) * (1-p) + ([y' y'] ~= [0 1])*p;

marginals = ones(size(M0));

for i=1:size(M0,1)
   for j=1:2
        if j==1
            if M0(i,1) ~= 0
                marginals(i,j) = marginals(i,j)*M0(i,1);
            end
            if M0(i,2) ~= 0
                marginals(i,j) = marginals(i,j)*M0(i,2);
            end
            marginals(i,j) = marginals(i,j)*probabilities(i,j);
        else
             if M1(i,1) ~= 0
                marginals(i,j) = marginals(i,j)*M1(i,1);
            end
            if M1(i,2) ~= 0
                marginals(i,j) = marginals(i,j)*M1(i,2);
            end
            marginals(i,j) = marginals(i,j)*probabilities(i,j);
        end
   end
end

marginals = marginals./(marginals(:,1)+marginals(:,2));

newM0 = zeros(size(M0));
for j=1:2
    for i=1:size(M0,1)
        if j==1
            other=2;
        else
            other=1;
        end
        if M0(i,other) ~= 0
            newM0(i,j) = M0(i,other)*probabilities(i,1);
        else
            newM0(i,j) = probabilities(i,1);
        end
    end
end
newM1 = zeros(size(M1));
for j=[1 2]
    for i=1:size(M1,1)
        if j==1
            other=2;
        else
            other=1;
        end
        if M1(i,other) ~= 0
            newM1(i,j) = M1(i,other)*probabilities(i,2);
        else
            newM1(i,j) = probabilities(i,2);
        end
    end
end
M0 = (newM0./(newM1+newM0)).*H;
M1 = (newM1./(newM1+newM0)).*H;

newM1 = zeros(size(M1));
for i=1:size(M1,1)
   product = prod(1-2.*M1(1:end~=i, :),1);
   newM1(i,:) = (1 + product)./2;
end
M0 = newM1.*H;
M1 = (1-newM1).*H;

marginals = ones(size(M0));

for i=1:size(M0,1)
   for j=1:2
        if j==1
            if M0(i,1) ~= 0
                marginals(i,j) = marginals(i,j)*M0(i,1);
            end
            if M0(i,2) ~= 0
                marginals(i,j) = marginals(i,j)*M0(i,2);
            end
            marginals(i,j) = marginals(i,j)*probabilities(i,j);
        else
             if M1(i,1) ~= 0
                marginals(i,j) = marginals(i,j)*M1(i,1);
            end
            if M1(i,2) ~= 0
                marginals(i,j) = marginals(i,j)*M1(i,2);
            end
            marginals(i,j) = marginals(i,j)*probabilities(i,j);
        end
   end
end

marginals = marginals./(marginals(:,1)+marginals(:,2));
marginals = marginals';
end