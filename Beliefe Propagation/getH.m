function H = getH(G)
R = G(:, 3:4);
I = eye(2);
H = [R;I];
end