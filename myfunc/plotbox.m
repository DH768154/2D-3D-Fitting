function p = plotbox(box1,linewidth,style,color)
[xx,yy,zz]=meshgrid(box1(:,1),box1(:,2),box1(:,3));

for i = 1:2
    p1(:,2*i-1:2*i,1) = xx(:,:,i);
    p1(:,2*i-1:2*i,2) = yy(:,:,i);
    p1(:,2*i-1:2*i,3) = zz(:,:,i);
end

p2 = [p1,p1(:,1,:)];
p2(:,4,:) = p1(:,3,:);
p2(:,3,:) = p1(:,4,:);

p = plot3(p2(1,:,1),p2(1,:,2),p2(1,:,3),style,'Color',color,'LineWidth',linewidth);hold on;
plot3(p2(2,:,1),p2(2,:,2),p2(2,:,3),style,'Color',color,'LineWidth',linewidth);hold on;
for i = 1:4
    plot3(p2(:,i,1),p2(:,i,2),p2(:,i,3),style,'Color',color,'LineWidth',linewidth);hold on;
end
p = p(1);
end