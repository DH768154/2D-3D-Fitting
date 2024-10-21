function p = plotbox_pt(pt,linewidth,style,color)

if isempty(style)
    style = '-';
end

if isempty(linewidth)
    linewidth = 1;
end

if isempty(color)
    color = [0 0.4470 0.7410];
end

if length(style) == 2
    style2 = style(end);
elseif length(style) == 3
    style2 = style(2:3);
else
    style2 = style;
end

f1 = [pt(:,1:4),pt(:,1),pt(:,5:end),pt(:,5)];

p = plot3(f1(1,:),f1(2,:),f1(3,:),...
    style,'Color',color,'LineWidth',linewidth); hold on
for i = 1:3
    plot3(pt(1,[i+1,i+5]),pt(2,[i+1,i+5]),pt(3,[i+1,i+5]),...
        style2,'Color',color,'LineWidth',linewidth);hold on
end

end