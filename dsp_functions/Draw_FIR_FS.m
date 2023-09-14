function Draw_FIR_FS(C,B,A)
colordef white;
C = round(C*10^4)/(10^4); B = round(B*10^4)/(10^4); A = round(A*10^4)/(10^4);
A3 = A(:,3); L1 = length(A3); L2 = length(REMOVETRAILZEROS(A3)); L = L1-L2;
M = 2*L2+L;

plot([0.5,1,1.5,2,3,5,5.5,6],[0,0,0,0,0,0,0,0],'ko-','linewidth',1,...
    'markersize',3,'MarkerFaceColor','k'); hold on;
plot([0.75,1.25,1.75,2.5,4,5.25,5.75],[0,0,0,0,0,0,0],'k>',...
    'MarkerFaceColor','k');

% Draw initinal factor: (1-z^{-M})/M
plot([1,1,1.5,1.5],[0,-0.5,-0.5,0],'k-','linewidth',1,...
    'markersize',3,'MarkerFaceColor','k');
plot(1.25,-0.5,'k>','MarkerFaceColor','k');
text(0.75,0.1,sprintf('1/%g',M),'fontname','symbol','fontsize',8,...
    'horizontalalignment','center','verticalalignment','bottom');
text(1.25,-0.6,sprintf('-z^{-%g}',M),'fontname','times','fontsize',8,...
    'horizontalalignment','center','verticalalignment','top');

% Draw H(0) factor
plot([3,3,5,5],[0,-0.5,-0.5,0],'ko-','linewidth',1,...
    'markersize',3,'MarkerFaceColor','k');
plot(3,-0.25,'k^','MarkerFaceColor','k');
plot(4,-0.5,'k<','MarkerFaceColor','k');
plot(5,-0.25,'kV','MarkerFaceColor','k');
text(4,-0.4,'{\itz}^{-1}','fontname','times','fontsize',8,...
            'horizontalalignment','center','verticalalignment','bottom');
text(2.5,0.1,sprintf('%.4g',C(L2+1)),'fontname','symbol','fontsize',8,...
        'horizontalalignment','center','verticalalignment','bottom');

% Draw H(M/2) factor, if exist
if L > 1
    plot([2,2,5.5,5.5],[0,1,1,0],'ko-','linewidth',1,...
        'markersize',3,'MarkerFaceColor','k');
    plot([2.5,4,5.25],[1,1,1],'k>','MarkerFaceColor','k');
    plot(2,0.5,'k^','MarkerFaceColor','k');
    plot(5.5,0.5,'kV','MarkerFaceColor','k');
    plot([3,3,5,5],[0,-0.5,-0.5,0]+1,'ko-','linewidth',1,...
        'markersize',3,'MarkerFaceColor','k');
    plot(3,-0.25+1,'k^','MarkerFaceColor','k');
    plot(4,-0.5+1,'k<','MarkerFaceColor','k');
    plot(5,-0.25+1,'kV','MarkerFaceColor','k');
    text(4,-0.4+1,'{-\itz}^{-1}','fontname','times','fontsize',8,...
        'horizontalalignment','center','verticalalignment','bottom');
    text(2.5,0.1+1,sprintf('%.4g',C(L2+2)),'fontname','symbol','fontsize',8,...
        'horizontalalignment','center','verticalalignment','bottom');
end

% Draw H(k) biquads
offset = -1;
for j=1:L2,
    Draw_IIR_Biquad_Normal(B(j,:),A(j,:),2,offset-2.5*(j-1));
    if j == 1
        plot([2 2 3],[0 -1 -1],'ko-',...
            'linewidth',1,'markersize',3,'MarkerFaceColor','k');
        plot([4 5.5 5.5],[-1 -1 0],'ko-',...
            'linewidth',1,'markersize',3,'MarkerFaceColor','k');
        plot(2,-0.5,'kV','MarkerFaceColor','k');
        plot(5.5,-0.5,'k^','MarkerFaceColor','k');
        plot(2.5,-1,'k>','MarkerFaceColor','k');
        text(2.5,-0.9,sprintf('%.4g',C(j)),'fontname','symbol','fontsize',8,...
            'horizontalalignment','center','verticalalignment','bottom');
    end
    if j>1,
        plot([2 2 3],[0 offset-2.5*(j-1) offset-2.5*(j-1)],'ko-',...
            'linewidth',1,'markersize',3,'MarkerFaceColor','k')
        plot(2,offset-2.5*(j-1)+1.5,'kV','MarkerFaceColor','k')
        plot([4 5.5 5.5],[offset-2.5*(j-1) offset-2.5*(j-1) 0],'ko-',...
            'linewidth',1,'markersize',3,'MarkerFaceColor','k')
        plot(5.5,offset-2.5*(j-1)+1.5,'k^','MarkerFaceColor','k')
        plot(2.5,offset-2.5*(j-1),'k>','MarkerFaceColor','k');
        text(2.5,offset-2.5*(j-1)+0.1,sprintf('%.4g',C(j)),...
            'fontname','symbol','fontsize',8,...
            'horizontalalignment','center','verticalalignment','bottom');
    end
end
text(0.4,0,'{\itx}({\itn})','fontname','times','fontsize',10,...
    'horizontalalignment','right','verticalalignment','middle');
text(6.1,0,'{\ity}({\itn})','fontname','times','fontsize',10,...
    'horizontalalignment','left','verticalalignment','middle')
ylim([-2.5*L2-1 L-0.5]); xlim([0 6.5]); 
axis equal off; axis([0,6.5,-2.5*L2-1 L-0.5]);
set(gcf,'color','w'); colordef none;