function z = BezierInterpScatterZ(xi,yi,coeff,kb_move,varargin)

if numel(coeff)~=size(coeff,1)
    fit_order = size(coeff)-1;
    coeff = reshape(coeff,numel(coeff),1);
else
    if nargin == 4
        error('Input Fit Order for the 5th Input')
    end
    fit_order = varargin{1};
end

numpt = length(xi);

% x = xi*kb_move(1)+kb_move(2);
% y = yi*kb_move(1)+kb_move(3);
x = xi*kb_move(1,1)+kb_move(1,2);
y = yi*kb_move(2,1)+kb_move(2,2);

k = {0:fit_order(1),0:fit_order(2)};
A = nchoosek2(fit_order(1),k{1}).*(1-x).^(fit_order(1)-k{1}).*x.^k{1};
B = nchoosek2(fit_order(2),k{2}).*(1-y).^(fit_order(2)-k{2}).*y.^k{2};

basis_c = arrayfun(@(i) reshape(A(i,:)'* B(i,:),1,[]), ...
    1:numpt, 'UniformOutput', false);
basis = cell2mat(basis_c');

z = basis*coeff;
end