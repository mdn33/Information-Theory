function  ok = controls(alphabet,probs,string)
alphabet = convertStringsToChars(alphabet);
probs = evalin('base',probs);
probs = double(probs./sum(probs));
string = convertStringsToChars(string);
ok = 1;
if size(probs,2) ~= size(alphabet,2) 
    ok = 0;
end
for i=1:size(string,2)
    if ~contains(alphabet,string(i))
        ok = 0;
        break;
    end
end
end