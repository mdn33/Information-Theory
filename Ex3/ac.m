function  [codeword,result] = ac(alphabet,probs,string)
format long
alphabet = convertStringsToChars(alphabet);
probs = evalin('base',probs);
probs = double(probs./sum(probs));
string = convertStringsToChars(string);
M = containers.Map('KeyType','char','ValueType','double');
for i=1:size(alphabet,2)
    M(alphabet(i)) = probs(i);
end
[lower, higher] = ac_recursive(0,1,M,string);
[c11,c12] = float2bin(lower);
[c21,c22] = float2bin(higher);
codeword = c12;
result = sprintf("Input String of %d characters encoded by %d bits [%f bit/char]",size(string,2),size(codeword,2),size(codeword,2)/size(string,2));
end