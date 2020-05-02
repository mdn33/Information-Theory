function [K,diff_entropy,bound]= differential_entropy(fun,a,b)


val = integral(fun,a,b);
K = 1/val;
fun = @(x) fun(x).*K;
diff = @(x) fun(x).*log2(fun(x));
diff_entropy = -integral(diff,a,b);
mean = integral(@(x) fun(x).*x,a,b);
variance = integral(@(x) fun(x).*x.^2,a,b) - mean^2;
bound = 0.5*log2(2*pi*variance*exp(1));
end

