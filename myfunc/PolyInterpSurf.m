function varargout = PolyInterpSurf(x1,y1,coeff,varargin)

if length(coeff) == numel(coeff) && nargin~=4
    error('If Coefficient is n*1 Array, Need Fitting Order as Optional Input')
elseif length(coeff) == numel(coeff) && nargin==4
    coeff = reshape(coeff,varargin{1}+1);
end

order_fit = size(coeff)-1;

A = x1.^(0:order_fit(1));
B = y1.^(0:order_fit(2));
zz = (A*coeff*B')';

if nargout == 3
    [xx,yy] = meshgrid(x1,y1);
    varargout{1} = xx;
    varargout{2} = yy;
    varargout{3} = zz;
else
    varargout{1} = zz;
end

end