function [c1,c2] = float2bin(num)
c2 = [];
k = 0;
if num==0
    c1 = 0;
    c2 = 0;
    return
end
if num==1
    c1 = 1;
    c2 = 0;
    return;
end
c1 = 0;
while num ~= 0
   num = num*2;
   if num>=1
        num = num-1;
        c2 = [c2, 1];
   else
      c2 = [c2 0];
   end
   k = k+1;
end
end