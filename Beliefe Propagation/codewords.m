function c = codewords(G)
v = flip(de2bi(0:3),2);
c = mod(v*G,2);
end