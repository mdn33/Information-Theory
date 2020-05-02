function mod_vect = b3_psk(encoded)
alpha = 1;
mod_vect = ones(1, size(encoded,2));
%if the bit is zero change it to -1
for i=1:size(encoded,2)
  if encoded(i)==0
      mod_vect(i) = -alpha;
  else
      mod_vect(i) = alpha;
  end
end
end