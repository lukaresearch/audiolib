function Draw_FIR_DF_Transposed(b)
% Prologue
colordef white;
b = REMOVETRAILZEROS(b); b = round(b*10^4)/(10^4); M = length(b); M1 = M-1;
if M == 0
    close;error('*** No Structure Possible ***');
end

% Initial structure for b(1)
plot([0.5 1.5 1.5 2.5]+M1,[0 0 -1 -1],'ko-','linewidth',1,'markersize',3,...
    'MarkerFaceColor','k'); hold on
plot([1 2]+M1,[0 -1],'k>','MarkerFaceColor','k');
plot([1.5]+M1,[-0.5],'kV','MarkerFaceColor','k'); 
text(1.6+M1,-0.5,sprintf('%.4g',b(1)),'fontname','symbol','fontsize',8,...
    'horizontalalignment','left');
% loop over the remaining 'b' coefficients
if M > 1
    for m = 2:M
        x0 = (m-2);
        plot([0.5 1.5 1.5 2.5]+x0,[0 0 -1 -1],'ko-','linewidth',1,...
            'markersize',3,'MarkerFaceColor','k');
        plot([1 2]+x0,[0 -1],'k>','MarkerFaceColor','k');
        plot([1.5]+x0,[-0.5],'kV','MarkerFaceColor','k');
        text(1.6+x0,-0.5,sprintf('%.4g',b(M+2-m)),'fontname','symbol',...
            'fontsize',8,'horizontalalignment','left');
        text(2+x0,-1.05,'{\itz}^{-1}','fontname','times','fontsize',10,...
            'horizontalalignment','center','verticalalignment','top');
    end
end

% Place input and output node signals
text(0.4,0,'{\itx}({\itn})','fontname','times','fontsize',10,...
    'horizontalalignment','right','verticalalignment','middle'); 
text(M+1.6,-1,'{\ity}({\itn})','fontname','times','fontsize',10,...
    'horizontalalignment','left','verticalalignment','middle'); 

% Epilogue
ylim([-1.5 0.1]); xlim([0 M+2]); axis equal off;
set(gcf,'color','w'); colordef none; hold off;