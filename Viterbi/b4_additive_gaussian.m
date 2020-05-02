function noisy = b4_additive_gaussian(mod_vect,snr)
%generate normally distributed numbers using the formula with the snr
std = 1/sqrt(2*snr);
noise = randn(1, size(mod_vect,2))*std;
noisy = mod_vect + noise;
end