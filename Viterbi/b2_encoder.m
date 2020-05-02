function encoded = b2_encoder(input)
%consider the 2 trellis proposed
%one matrix for the output and one for the next state
output = [0 1;3 2]; %numbers must me converted 
state = [1 2; 1 2];

next_state = 1;
encoded = [];

%for each bit of the input compute the next state and the output
for i=1:size(input, 2)
   encoded = [encoded flip(de2bi(output(next_state, input(i)+1), 2))];
   next_state = state(next_state, input(i)+1);
end

end