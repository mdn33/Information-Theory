function [l,h] = ac_recursive(l,h,M,string)

if isempty(string)
    return;
end
newl = l;
newh = h;
distance = h-l;
for c=M.keys()
    c = char(c);
    if c ~= string(1)
        newl = newl+distance*M(c);
    else
        newh = newl + distance*M(c);
        break;
    end
end
[l,h] = ac_recursive(newl,newh,M,string(2:length(string)));
end