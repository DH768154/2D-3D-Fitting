function varargout = BezierInterpSurf(xi,yi,coeff,kb,varargin)

if length(coeff) == numel(coeff) && nargin~=5
    error('If Coefficient is n*1 Array, Need Fitting Order as Optional Input')
elseif length(coeff) == numel(coeff) && nargin==5
    coeff = reshape(coeff,varargin{1}+1);
end

order_fit = size(coeff)-1;

% x = xi*kb(1)+kb(2);
% y = yi*kb(1)+kb(3);
x = xi*kb(1,1)+kb(1,2);
y = yi*kb(2,1)+kb(2,2);

k = {0:order_fit(1),0:order_fit(2)};
A = nchoosek2(order_fit(1),k{1}).*(1-x).^(order_fit(1)-k{1}).*x.^k{1};
B = nchoosek2(order_fit(2),k{2}).*(1-y).^(order_fit(2)-k{2}).*y.^k{2};
zz = (A*coeff*B')';

if nargout == 3
    [xx,yy] = meshgrid(xi,yi);
    varargout{1} = xx;
    varargout{2} = yy;
    varargout{3} = zz;
else
    varargout{1} = zz;
end

end