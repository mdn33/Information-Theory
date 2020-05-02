function clean = b5_decision_rule(noisy)
clean = ones(1, size(noisy,2));
for i=1:size(noisy,2)
    if noisy(i)<0
            clean(i) = 0;
    end
end