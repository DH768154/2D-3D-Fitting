function plot4pt(pts,linewidth,style,color)
plot3(pts(1,:),pts(2,:),pts(3,:),style,'Color',color,'LineWidth',linewidth);hold on;
plot3(pts(1,[1,4]),pts(2,[1,4]),pts(3,[1,4]),style,'Color',color,'LineWidth',linewidth);hold on;
plot3(pts(1,[2,4]),pts(2,[2,4]),pts(3,[2,4]),style,'Color',color,'LineWidth',linewidth);hold on;
plot3(pts(1,[1,3]),pts(2,[1,3]),pts(3,[1,3]),style,'Color',color,'LineWidth',linewidth);hold on;
end