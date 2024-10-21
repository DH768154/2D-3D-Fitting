function coef = polyfit2(xs,ys,zs,fit_order,varargin)
% Given x,y,z value, fit for z using polynomials:
% [1,x,x^2,x^3...] and [1,y,y^2,y^3...]
% 
% [c,func] = polyfit2(xs,ys,zs,fit_order)
% [c,func] = polyfit2(xs,ys,zs,fit_order,return_type)
% c = polyfit2(xs,ys,zs,fit_order)
%
% fit_order = [fit_order_x, fit_order_y]
%
% Optional Input:
% return_type: Coefficient in array or matrix form
% 
% Output:
% c : Coefficient
%%
if nargin == 5
    type = varargin{1};
else
    type = 'poly';
end

%%
pt_num = length(xs);



A = xs.^(0:fit_order(1));
B = ys.^(0:fit_order(2));

%     Pre Version, New One Use arrayfun avoid loop
%     terms_pos = prod(fit_order+1);
%     basis = zeros(pt_num,terms_pos);
%     for i = 1:pt_num
%         basis(i,:) = reshape(A(i,:)'*B(i,:),1,[]);
%     end

basis_c = arrayfun(@(i) reshape(A(i,:)'* B(i,:),1,[]), ...
    1:pt_num, 'UniformOutput', false);
basis = cell2mat(basis_c');

%%
zfit = reshape(zs',[],1);
c_fit= pinv(basis)*zfit;

mx_fit = reshape(c_fit,fit_order+1);
% mx_fit for A * mx_fit * B

%%
if strcmpi(type,'matrix')
    coef = mx_fit;
else
    coef = c_fit;
end


end