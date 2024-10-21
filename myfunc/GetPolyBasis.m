function fc = GetPolyBasis(dim,fit_order)

syms x y z real

A = x.^(0:fit_order(1));
B = y.^(0:fit_order(2));

if dim == 2

    func_fit = reshape(A'*B,1,[]);
    func_fit(1) = sym('ones');
elseif dim == 3

    C = z.^(0:fit_order(3));
    func_fit = reshape(reshape(A'*B,1,[])'*C,1,[]);
    func_fit(1) = sym('ones');
end

fc = matlabFunction(func_fit);

end