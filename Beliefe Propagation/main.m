prompt = {'Input bits', 'probability'};
title = 'Write the vector c and the probability';
dims = [1, 35];

params = inputdlg(prompt, title, dims);

y = evalin('base',params{1})
p = str2double(params{2}); 
G = [1 0 1 1; 0 1 0 1];
c = codewords(G);
marginals_brute = brute_force(y,p,c)
marginals_distributed = distributed(y,p,getH(G))