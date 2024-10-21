function z = PolyInterpScatterZ(x1,y1,coeff,varargin)
% x,y are column arrays
% z = PolyInterpScatterZ(x1,y1,coeff,varargin)
%
% z = PolyInterpScatterZ(x1,y1,coeff,varargin)

if length(x1)~=length(y1)
    error('x,y need to be n*1 array, equal size')
end

if numel(coeff)~=size(coeff,1)
    fit_order = size(coeff)-1;
    coeff = reshape(coeff,numel(coeff),1);
else
    if nargin == 3
        error('Input Fit Order for the 4th Input')
    end
    fit_order = varargin{1};
end

numpt = length(x1);

A = x1.^(0:fit_order(1));
B = y1.^(0:fit_order(2));
basis_c = arrayfun(@(i) reshape(A(i,:)'* B(i,:),1,[]), ...
    1:numpt, 'UniformOutput', false);
basis = cell2mat(basis_c');

z = basis*coeff;

end