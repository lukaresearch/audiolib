function Draw_FIR_Biquad_Normal(b,x,y)
M = length(b);
plot([1 2]+x,[0 0]+y,'ko-','linewidth',1,'markersize',3,'MarkerFaceColor','k');
hold on; plot([1.5 2.25]+x,[0 0]+y,'k>','MarkerFaceColor','k');
text(1.5+x,.2+y,sprintf('%.4g',b(1)),'fontname','symbol','fontsize',8,...
    'horizontalalignment','center');
% Loop on 'b' coefficients
for j = 1:(length(b)-1);
    %if b(j+1) ~= 0;
        plot([1 1 2 2]+x,[-(j-1) -j -j -(j-1)]+y,'ko-','linewidth',1,...
            'markersize',3,'MarkerFaceColor','k');
        plot(1+x,y-j+0.5,'kV','MarkerFaceColor','k');
        plot(1.5+x,y-j,'k>','MarkerFaceColor','k');
        plot(2+x,y-j+0.5,'k^','MarkerFaceColor','k');
        text(1.5+x,y-j+.2,sprintf('%.4g',b(j+1)),'fontname','symbol',...
            'fontsize',8,'horizontalalignment','center');
    %end
end