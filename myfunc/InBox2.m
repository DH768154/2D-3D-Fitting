function varargout = InBox2(data)

minmaxdata = minmax(data,1);
move1 = -minmaxdata(1,:);

scale = (minmaxdata(2,:)-minmaxdata(1,:))/0.95;
data = (data+move1)./scale;


move2 = (1-max(data))/2;
data = data+move2;

kb = [1./scale',(move1./scale+move2)'];

if nargout == 0 || nargout == 1
    varargout{1} = kb;
elseif nargout ==2
    varargout{1} = kb;    
    varargout{2} = data(:,1);
elseif nargout ==3
    varargout{1} = kb;    
    varargout{2} = data(:,1);    
    varargout{3} = data(:,2);
elseif nargout >=4
    varargout{1} = kb;    
    varargout{2} = data(:,1);    
    varargout{3} = data(:,2);    
    varargout{4} = data(:,3);
end
end