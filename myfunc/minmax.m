function mm = minmax(data,dir)

if dir == 1
    mm = [min(data,[],dir);max(data,[],dir)];
elseif dir == 2
    mm = [min(data,[],dir),max(data,[],dir)];
end

end