function Draw_IIR_Biquad_Normal(b,a,x,y)
N = length(a); M = length(b);
plot([1 3]+x,[0 0]+y,'ko-','linewidth',1,'markersize',3,'MarkerFaceColor','k');
hold on; plot([1.5 2.5 3.25]+x,[0 0 0]+y,'k>','MarkerFaceColor','k');
text(2.5+x,.2+y,sprintf('%.4g',b(1)),'fontname','symbol','fontsize',8,...
    'horizontalalignment','center');
% Loop on 'b' coefficients
for j = 1:(length(b)-1);
    %if b(j+1) ~= 0;
        plot([2 2 3 3]+x,[-(j-1) -j -j -(j-1)]+y,'ko-','linewidth',1,...
            'markersize',3,'MarkerFaceColor','k');
        plot(2.5+x,y-j,'k>','MarkerFaceColor','k');
        plot(3+x,y-j+0.5,'k^','MarkerFaceColor','k');
        text(2.5+x,y-j+.2,sprintf('%.4g',b(j+1)),'fontname','symbol',...
            'fontsize',8,'horizontalalignment','center');
    %end
end
% Loop on 'a' coefficients
for j = 1:(length(a)-1);
    %if a(j+1) ~= 0;
        plot([1 1 2 2]+x,y+[-(j-1) -j -j -(j-1)],'ko-','linewidth',1,...
            'markersize',3,'MarkerFaceColor','k');
        plot(1+x,y-j+0.5,'k^','MarkerFaceColor','k');
        plot(1.5+x,y-j,'k<','MarkerFaceColor','k');
        plot(2+x,y-j+0.5,'kV','MarkerFaceColor','k');
        text(1.5+x,y-j+.2,sprintf('%.4g',-a(j+1)),'fontname','symbol',...
            'fontsize',8,'horizontalalignment','center');
        text(2.1+x,y-j+0.6,'{\itz}^{-1}','fontname','times','fontsize',10);
    %end
end