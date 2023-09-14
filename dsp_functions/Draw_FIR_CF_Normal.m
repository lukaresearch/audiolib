function Draw_FIR_CF_Normal(b0,B)
colordef white;
b0 = round(b0*10^4)/(10^4); B = round(B*10^4)/(10^4);
k = size(B,1); xl = 0; xh = 2+k*1.5+1; yl = -2.25; yh = 0.5;
plot([1 2+k*1.5],[0 0],'ko-','linewidth',1,'markersize',3,...
    'MarkerFaceColor','k');
hold on; plot(1.5,0,'k>','MarkerFaceColor','k')
% Loop on biquads
for j = 1:k,
    Draw_FIR_Biquad_Normal(B(j,:),1+1.5*(j-1),0);
end
text(0.9,0,'{\itx}({\itn})','fontname','times','fontsize',10,...
    'horizontalalignment','right','verticalalignment','middle');
text(2.1+1.5*k,0,'{\ity}({\itn})','fontname','times','fontsize',10,...
    'horizontalalignment','left','verticalalignment','middle');
text(1.5,.25,sprintf('%.4g',b0),'fontname','symbol','fontsize',8,...
    'horizontalalignment','center');
ylim([-2.1 0.1]); xlim([0 2+3*k]); axis equal off; axis([xl,xh,yl,yh]);
set(gcf,'color','w'); colordef none; hold off;