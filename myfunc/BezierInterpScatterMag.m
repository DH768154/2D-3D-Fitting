function mag = BezierInterpScatterMag(xi,yi,zi,coeff,kb_move,fit_order)

if length(xi)~=length(yi) || length(xi)~=length(zi)
    error('x,y,z need to be n*1 array, equal size')
end

x2 = xi*kb_move(1,1)+kb_move(1,2);
y2 = yi*kb_move(2,1)+kb_move(2,2);
z2 = zi*kb_move(3,1)+kb_move(3,2);

pt_num = length(x2);

% A = x2.^(0:fit_order(1));
% B = y2.^(0:fit_order(2));
% C = z2.^(0:fit_order(3));

k = {0:fit_order(1),0:fit_order(2),0:fit_order(3)};
A = nchoosek2(fit_order(1),k{1}).*(1-x2).^(fit_order(1)-k{1}).*x2.^k{1};
B = nchoosek2(fit_order(2),k{2}).*(1-y2).^(fit_order(2)-k{2}).*y2.^k{2};
C = nchoosek2(fit_order(3),k{3}).*(1-z2).^(fit_order(3)-k{3}).*z2.^k{3};

basis_c = arrayfun(@(i) reshape(reshape(A(i,:)'*B(i,:),1,[])'...
    *C(i,:),1,[]), 1:pt_num, 'UniformOutput', false);
basis = cell2mat(basis_c');

mag = basis*coeff;

end