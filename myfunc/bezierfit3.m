function [c_fit,kb_move] = bezierfit3(xs0,ys0,zs0,ms0,fit_order)

%%
% Output Type, n*1 coefficient or matrix form

pt_num = length(xs0);

%%
[kb_move,xs3,ys3,zs3] = InBox2([xs0,ys0,zs0]);

k = {0:fit_order(1),0:fit_order(2),0:fit_order(3)};
A = nchoosek2(fit_order(1),k{1}).*(1-xs3).^(fit_order(1)-k{1}).*xs3.^k{1};
B = nchoosek2(fit_order(2),k{2}).*(1-ys3).^(fit_order(2)-k{2}).*ys3.^k{2};
C = nchoosek2(fit_order(3),k{3}).*(1-zs3).^(fit_order(3)-k{3}).*zs3.^k{3};
% A = xs3.^(0:fit_order(1));
% B = ys3.^(0:fit_order(2));
% C = zs3.^(0:fit_order(3));

basis_c = arrayfun(@(i) reshape(reshape(A(i,:)'*B(i,:),1,[])'...
    *C(i,:),1,[]), 1:pt_num, 'UniformOutput', false);
basis = cell2mat(basis_c');

c_fit = pinv(basis)*ms0;

end