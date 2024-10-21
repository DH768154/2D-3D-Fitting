function b = nchoosek2(n,k)
% nchoosek, but works on k array
b = factorial(n)./factorial(n-k)./factorial(k);
end