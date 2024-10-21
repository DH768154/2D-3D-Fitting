function mag = PolyInterpScatterMag(x1,y1,z1,coeff,fit_order)

if length(x1)~=length(y1) || length(x1)~=length(z1)
    error('x,y,z need to be n*1 array, equal size')
end

numpt = length(x1);

    A = x1.^(0:fit_order(1));
    B = y1.^(0:fit_order(2));
    C = z1.^(0:fit_order(3));
    basis_c = arrayfun(@(i) reshape(reshape(A(i,:)'*B(i,:),1,[])'...
        *C(i,:),1,[]), 1:numpt, 'UniformOutput', false);
    basis = cell2mat(basis_c');


mag = basis*coeff;

end