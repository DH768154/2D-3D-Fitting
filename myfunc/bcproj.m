function [c,rmv] = bcproj(qrp,a)
% Projection in the Triangle using Barycentric Form

rmv = NaN(3,1);
rmv(1:2) = (qrp(:,1:2)-qrp(:,3))\(a-qrp(:,3));
rmv(3) = 1-sum(rmv(1:2));
c = qrp*rmv;

end