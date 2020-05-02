function random = b1_random_bit_generator(L)
%generate a random sequence of L bits + D zero bits 
random = [randi([0 1],1,L)];
end