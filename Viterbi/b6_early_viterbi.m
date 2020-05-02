function final = b6_early_viterbi(clean,D)

final = [];
d1 = [];
d2 = [];

st_w = zeros(2, 1);
early_ind = 1;

for i=1:2:size(clean,2)
    y = clean(i:i+1);
    ed_w = [hamming(y, [0 0]) hamming(y, [1 1]); hamming(y, [0 1]) hamming(y, [1 0])];
    if i==1
          ed_w(2,1) = 5;
          ed_w(2,2) = 5;
    end
    [new_w1, ind_min1] = min([st_w(1,1)+ed_w(1,1) st_w(2,1)+ed_w(2,1)]);
    [new_w2, ind_min2] = min([st_w(1,1)+ed_w(1,2) st_w(2,1)+ed_w(2,2)]);
    
    tmp1 = d1;
    if ind_min1==1
        d1 = [d1 0];
    else
        d1 = [d2 0];
    end
    if ind_min2==1
        d2 = [tmp1 1];
    else
        d2 = [d2 1];
    end
    
    st_w = [new_w1;new_w2];
    
    if new_w1 < new_w2
        decoded_vect = d1;
    else
        decoded_vect = d2;
    end
    % output del bit all'istante i-D della traiettoria con peso minore
    if i>2*D
        final = [final decoded_vect(early_ind)];
        early_ind = early_ind + 1;
    end
    
end
end

function d = hamming(a, b)
    d = sum(a~=b);
end