function [c_fit,kb_move] = bezierfit2(xs,ys,zs,fit_order,varargin)

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
% kb_move: Move to Box

%%
% Output Type, n*1 coefficient or matrix form
if nargin == 5
    type = varargin{1};
else
    type = 'poly';
end
%%
pt_num = length(xs);

% Put In the Box 0~1
%[kb_move,x3,y3] = InBox([xs,ys]);
[kb_move,x3,y3] = InBox2([xs,ys]);

k = {0:fit_order(1),0:fit_order(2)};
A = nchoosek2(fit_order(1),k{1}).*(1-x3).^(fit_order(1)-k{1}).*x3.^k{1};
B = nchoosek2(fit_order(2),k{2}).*(1-y3).^(fit_order(2)-k{2}).*y3.^k{2};

basis_c = arrayfun(@(i) reshape(A(i,:)'* B(i,:),1,[]), ...
    1:pt_num, 'UniformOutput', false);
basis = cell2mat(basis_c');

c_bezier= basis\zs;
mx_bezier = reshape(c_bezier,fit_order+1);
%%

if strcmpi(type,'matrix')
    c_fit = mx_bezier;
else
    c_fit = c_bezier;
end
end














