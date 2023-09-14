function Draw_IIR_DF1_Transposed(b,a)
colordef white;
b = b/a(1); b = round(b*10^4)/(10^4);
a = a/a(1); a = round(a*10^4)/(10^4);
N=length(a); M=length(b);
plot([0.5 4.5],[0 0],'ko-','linewidth',1,'markersize',3,'MarkerFaceColor','k');
hold on; plot([0.75 1.5 2.5 3.5 4.25],[0 0 0 0 0],'k>','MarkerFaceColor','k');
text(0.4,0,'{\itx}({\itn})','fontname','times','fontsize',10,...
    'horizontalalignment','right'); 
text(4.7,0,'{\ity}({\itn})','fontname','times','fontsize',10,...
    'horizontalalignment','left'); 
text(3.5,.25,sprintf('%.4g',b(1)),'fontname','symbol','fontsize',8,...
    'horizontalalignment','center');
% Loop on 'a' coefficients
for j = 1:(length(a)-1);
    if a(j+1) ~= 0;
        plot([1 1 2 2],[-(j-1) -j -j -(j-1)],'ko-','linewidth',1,...
            'markersize',3,'MarkerFaceColor','k');
        plot(1,-j+0.5,'k^','MarkerFaceColor','k'); 
        plot(1.5,-j,'k<','MarkerFaceColor','k'); 
        plot(2,-j+0.5,'kV','MarkerFaceColor','k');
        text(1.5,-j+.25,sprintf('%.4g',-a(j+1)),'fontname','symbol',...
            'fontsize',8,'horizontalalignment','center');
        text(1.1,-j+0.6,'{\itz}^{-1}','fontname','times','fontsize',10);
    end
end
% Loop on 'b' coefficients
for j = 1:(length(b)-1); 
    if b(j+1) ~= 0;
        plot([3 3 4 4],[-(j-1) -j -j -(j-1)],'ko-','linewidth',1,...
            'markersize',3,'MarkerFaceColor','k');
        plot(3,-j+0.5,'kV','MarkerFaceColor','k'); 
        plot(3.5,-j,'k>','MarkerFaceColor','k'); 
        plot(4,-j+0.5,'k^','MarkerFaceColor','k');
        text(3.5,-j+.25,sprintf('%.4g',b(j+1)),'fontname','symbol',...
            'fontsize',8,'horizontalalignment','center');
        text(4.1,-j+0.6,'{\itz}^{-1}','fontname','times','fontsize',10);
    end
end
ylim([-max([M N])-0.1 0.1]); xlim([0 6]); axis off
set(gcf,'color','w'); colordef none; hold off;