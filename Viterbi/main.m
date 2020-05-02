bers_vect = [];
L = 100;
snr_db = 0;

while snr_db <= 4
    generated = 0;
    wrong = 0;
    while wrong < 100
        r = b1_random_bit_generator(L);
        enc = b2_encoder(r);
        mod = b3_psk(enc);
        snr = 10^(snr_db/10);
        noisy = b4_additive_gaussian(mod,snr);
        clean = b5_decision_rule(noisy);
        dec = b6_viterbi(clean);
        generated = generated + size(r(1:end),2);
        wrong = wrong + sum(r(1:end)~=dec);
    end
    ber = wrong/generated;
    bers_vect = [bers_vect ber];
    snr_db = snr_db + 1;
end
semilogy(bers_vect)
title('Bit Error rate curve')
xlabel('snr(dB)') 
ylabel('BER')