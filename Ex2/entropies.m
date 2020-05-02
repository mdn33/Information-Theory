function  [Hx,Hy,Hz,H_xyz,Hfun,checks] = entropies(r1,r2,r3,pd1,pd2,pd3,f)
format long
pd1= pd1./sum(pd1);
pd2 = pd2./sum(pd2);
pd3 = pd3./sum(pd3);

Hx = H(pd1);
Hy = H(pd2);
Hz = H(pd3);

M = containers.Map('KeyType','double','ValueType','double');
P_xyz = zeros(length(pd1), length(pd2), length(pd3));

for i = 1:size(r1,2)
   for j = 1:size(r2,2)
        for z = 1:size(r3,2)
            if isKey(M,f(r1(i),r2(j),r3(z)))
                M(f(r1(i),r2(j),r3(z))) =  M(f(r1(i),r2(j),r3(z))) + pd1(i)*pd2(j)*pd3(z);
            else
                M(f(r1(i),r2(j),r3(z))) =  pd1(i)*pd2(j)*pd3(z);
            end
            P_xyz(i,j,z) = pd1(i)*pd2(j)*pd3(z);
        end
    end
end
P = cell2mat(M.values());
Hfun = H(P(:));
H_xyz = H(P_xyz(:));
Hx_yz = Hx - H_xyz;
Hy_xz = Hy - H_xyz;
Hz_xy = Hz - H_xyz;

checks = '';
if Hx >= 0 && Hx <= log2(size(pd1,2))
   checks = strcat(checks,'0<= H(X)<= log2(N)\n ');
end
if Hy >= 0 && Hx <= log2(size(pd2,2))
   checks = strcat(checks,'0<= H(Y)<= log2(N)\n ');
end
if Hz >= 0 && Hz <= log2(size(pd3,2))
   checks = strcat(checks,'0<= H(Z)<= log2(N)\n ');
end
if Hfun >= 0 && Hfun <= log2(size(P,2))
   checks = strcat(checks,'0<= H(f(X,Y,Z))<= log2(N)\n ');
end
if Hx_yz<=Hx 
   checks = strcat(checks,'h(X|Y,Z) <= h(X)\n');
end
if Hz_xy<=Hz
   checks = strcat(checks,'h(Z|X,Z) <= h(Z)\n');
end
if Hy_xz<=Hy
   checks = strcat(checks,'h(Y/X,Z) <= h(Y)\n');
end
if Hfun<=H_xyz 
   checks = strcat(checks,"H(f(X,Y,Z)) <= H(X,Y,Z)\n");
end
if H_xyz<= Hx+Hy+Hz + eps
   checks = strcat(checks,"H(X,Y,Z) <= H(X)+H(Y)+H(Z)\n");
end

end
