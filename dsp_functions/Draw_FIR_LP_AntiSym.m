function Draw_FIR_LP_AntiSym(b)
% Draw_FIR_LP_AntiSym(b)
% Draw FIR Linear-Phase Structure given the Anti-Symmetric impulse response b

% Prologue
colordef white;
b = REMOVETRAILZEROS(b); b = round(b*10^4)/(10^4); M = length(b); 
if M <= 1
    close;error('*** No Linear-Phase Structure Possible: length(h) <= 1 ***');
end
% Check M-even or M-odd
Meven = 0; Modd = 0;
if M == 2*floor(M/2)
    Meven = 1; N = M/2; % M is even, N: Number of LP sections
else
     Modd = 1; N = (M-1)/2; % M is Odd,  N: Number of LP sections
end

% Draw the initial structure for b(1) and b(M)
plot([0.5,1,1,1],[0,0,-0.75,-1.5],'ko-','linewidth',1,'markersize',3,...
    'MarkerFaceColor','k'); hold on;
plot([0.75],[0],'k>','MarkerFaceColor','k');
plot([1],[-0.375],'kV','MarkerFaceColor','k');
plot([1],[-1.125],'k^','MarkerFaceColor','k');
text(1.1,-1.1,'-1','fontname','symbol','fontsize',8,...
    'horizontalalignment','left');
plot([1,0.875,0.875,1.625],[-0.75,-0.75,-2.5,-2.5],'k-','linewidth',1);
plot([1.625],[-2.5],'ko','markersize',3,'MarkerFaceColor','k');
plot([0.875],[-2],'kV','MarkerFaceColor','k');
plot([1.25],[-2.5],'k>','MarkerFaceColor','k');
text(0.8,-2,sprintf('%.4g',b(1)),'fontname','symbol','fontsize',8,...
    'horizontalalignment','right');
text(0.4,0,'{\itx}({\itn})','fontname','times','fontsize',10,...
    'horizontalalignment','right','verticalalignment','middle');

%% Draw structure for M-even
if Meven
    % Draw Remaining structures
    x0 = 1; x1 = 1.75;
    if N > 1
        % Draw Remaining structures except last
        for n = 2:N
            plot([x0,x1,x1,x1,x0],[0,0,-0.75,-1.5,-1.5],'ko-',...
                'linewidth',1,'markersize',3,'MarkerFaceColor','k');
            plot([x0+0.375],[0],'k>','MarkerFaceColor','k');
            plot([x1],[-0.375],'kV','MarkerFaceColor','k');
            plot([x1],[-1.125],'k^','MarkerFaceColor','k');
            text(x1+0.1,-1.1,'-1','fontname','symbol','fontsize',8,...
                'horizontalalignment','left');
            plot([x0+0.375],[-1.5],'k<','MarkerFaceColor','k');
            plot([x1,x1-0.125,x1-0.125,x1+0.625],[-0.75,-0.75,-2.5,-2.5],...
                'k-','linewidth',1);
            plot([x1+0.625],[-2.5],'ko','markersize',3,'MarkerFaceColor','k');
            plot([x1-0.125],[-2],'kV','MarkerFaceColor','k');
            plot([x1+0.25],[-2.5],'k>','MarkerFaceColor','k');
            text(x1-0.2,-2,sprintf('%.4g',b(n)),'fontname','symbol',...
                'fontsize',8,'horizontalalignment','right');
            text([x0+0.375],[0.1],'{\itz}^{-1}','fontname','times',...
                'fontsize',10,'horizontalalignment','center',...
                'verticalalignment','bottom');
            text([x0+0.375],[-1.4],'{\itz}^{-1}','fontname','times',...
                'fontsize',10,'horizontalalignment','center',...
                'verticalalignment','bottom');
            x0 = x0+0.75; x1 = x1+0.75;
        end
    end
    % Draw the last structure for b(N) and b(N+1)
    x0 = (N-1)*0.75+1;
    plot([x0,x0+0.75,x0+0.75,x0],[0,0,-1.5,-1.5],'k-','linewidth',1);
    plot([x0+0.75],[-0.75],'kV','MarkerFaceColor','k');
    text([x0+0.85],[-0.75],'{\itz}^{-1}','fontname','times',...
        'fontsize',10,'horizontalalignment','left',...
        'verticalalignment','bottom');
    plot([x0+0.375],[0],'k>','MarkerFaceColor','k');
    plot([x0+0.375],[-1.5],'k<','MarkerFaceColor','k');
    text(N*0.75+1-0.025,-2.5,'{\ity}({\itn})','fontname','times','fontsize',10,...
    'horizontalalignment','left','verticalalignment','middle');
end

%% Draw structure for M-odd
if Modd
    % Draw Remaining structures
    x0 = 1; x1 = 1.75;
    if N > 1
        % Draw Remaining structures except last
        for n = 2:N
            plot([x0,x1,x1,x1,x0],[0,0,-0.75,-1.5,-1.5],'ko-',...
                'linewidth',1,'markersize',3,'MarkerFaceColor','k');
            plot([x0+0.375],[0],'k>','MarkerFaceColor','k');
            plot([x1],[-0.375],'kV','MarkerFaceColor','k');
            plot([x1],[-1.125],'k^','MarkerFaceColor','k');
            text(x1+0.1,-1.1,'-1','fontname','symbol','fontsize',8,...
                'horizontalalignment','left');
            plot([x0+0.375],[-1.5],'k<','MarkerFaceColor','k');
            plot([x1,x1-0.125,x1-0.125,x1+0.625],[-0.75,-0.75,-2.5,-2.5],...
                'k-','linewidth',1);
            if n ~= N
                plot([x1+0.625],[-2.5],'ko','markersize',3,...
                    'MarkerFaceColor','k');
            end
            plot([x1-0.125],[-2],'kV','MarkerFaceColor','k');
            plot([x1+0.25],[-2.5],'k>','MarkerFaceColor','k');
            text(x1-0.2,-2,sprintf('%.4g',b(n)),'fontname','symbol',...
                'fontsize',8,'horizontalalignment','right');
            text([x0+0.375],[0.1],'{\itz}^{-1}','fontname','times',...
                'fontsize',10,'horizontalalignment','center',...
                'verticalalignment','bottom');
            text([x0+0.375],[-1.4],'{\itz}^{-1}','fontname','times',...
                'fontsize',10,'horizontalalignment','center',...
                'verticalalignment','bottom');
            x0 = x0+0.75; x1 = x1+0.75;
        end
    end
    % Draw the last structure for b(N+1)=0
    x0 = (N-1)*0.75+1;
    plot([x0,x0+0.75,x0+0.75,x0],[0,0,-1.5,-1.5],'k-','linewidth',1);
    plot([x0+0.75],[-0.75],'kV','MarkerFaceColor','k');
    text([x0+0.85],[-0.75],'{\itz}^{-2}','fontname','times',...
        'fontsize',10,'horizontalalignment','left',...
        'verticalalignment','bottom');
    %plot([x0+0.375],[0],'k>','MarkerFaceColor','k');
    %plot([x0+0.375],[-1.5],'k<','MarkerFaceColor','k');
    text(N*0.75+1-0.025,-2.5,'{\ity}({\itn})','fontname','times','fontsize',10,...
        'horizontalalignment','left','verticalalignment','middle');
    plot(x1-0.125,-2.5,'ko','markersize',3,'MarkerFaceColor','k');
end

% Epilogue
ylim([-2.5 0.5]); xlim([0 (Meven/2+1)*0.75+1.5]); axis equal off;
set(gcf,'color','w'); colordef none; hold off;