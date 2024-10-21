function [u,r] = bcinterp(pts0,pts1,p)
% Barycentric Interpolation

[row,col] = size(pts1);

% Get Barycentric Coordinates for Target Point
r = pinv([pts0;ones(1,col)])*[p;1];

% Find Corresponding Points in Deformed Coordinates
u = [pts1;ones(1,col)] * r;
u = u(1:row);

end