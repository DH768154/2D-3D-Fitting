function c_fit = polyfit3(xs,ys,zs,mag,fit_order)

pt_num = length(xs);
% terms_mag = prod(fit_order+1);

A = xs.^(0:fit_order(1));
B = ys.^(0:fit_order(2));
C = zs.^(0:fit_order(3));

% basis = zeros(pt_num,terms_mag);
% for i = 1:pt_num
%     basis(i,:) = reshape(reshape(A(i,:)'*B(i,:),1,[])'*C(i,:),1,[]);          
% end

basis_c = arrayfun(@(i) reshape(reshape(A(i,:)'*B(i,:),1,[])'...
    *C(i,:),1,[]), 1:pt_num, 'UniformOutput', false);
basis = cell2mat(basis_c');

c_fit = pinv(basis)*mag;

end