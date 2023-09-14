function Draw_IIR_PF_Transposed(C,B,A)
colordef white;
C = round(C*10^4)/(10^4); B = round(B*10^4)/(10^4); A = round(A*10^4)/(10^4);
k = size(A,1); xl = 0; xh = 2+k*2.5+1; yl = -2.25; yh = 0.5;
plot([0.5 5],[0 0],'ko-','linewidth',1,'markersize',3,...
    'MarkerFaceColor','k');
hold on;
if C==0,
    offset=0;
else
    plot(2.5,0,'k>','MarkerFaceColor','k');
    text(2.5,.2,sprintf('%.4g',C),'fontname','symbol','fontsize',8,...
    'horizontalalignment','center')
    offset=-0.5;
end
for j=1:k,
    DrawBiquad_Transposed(B(j,:),A(j,:),1,offset-2.5*(j-1));
    if offset | j>1,
        plot([1 1 2],[0 offset-2.5*(j-1) offset-2.5*(j-1)],'ko-',...
            'linewidth',1,'markersize',3,'MarkerFaceColor','k')
        plot(1,offset-2.5*(j-1)+1.5,'kV','MarkerFaceColor','k')
        plot([3 4.5 4.5],[offset-2.5*(j-1) offset-2.5*(j-1) 0],'ko-',...
            'linewidth',1,'markersize',3,'MarkerFaceColor','k')
        plot(4.5,offset-2.5*(j-1)+1.5,'k^','MarkerFaceColor','k')
    end
end
text(0.4,0,'{\itx}({\itn})','fontname','times','fontsize',10,...
    'horizontalalignment','right','verticalalignment','middle');
text(5.2,0,'{\ity}({\itn})','fontname','times','fontsize',10,...
    'horizontalalignment','left','verticalalignment','middle')
ylim([-2.5*k-1 0.1]); xlim([0 5.5]); axis equal off;
set(gcf,'color','w'); colordef none;