%% Plot accuracy with respect to the number of parameters for different but fixed gaussian parameter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hold on;
plot(AccuracyMatrix_Gaussian(:,1))
plot(AccuracyMatrix_Gaussian(:,2))
plot(AccuracyMatrix_Gaussian(:,3))
plot(AccuracyMatrix_Gaussian(:,4))
plot(AccuracyMatrix_Gaussian(:,5))
plot(AccuracyMatrix_Gaussian(:,6))
plot(AccuracyMatrix_Gaussian(:,7))
%plot(AccuracyMatrix_Gaussian(:,8))
plot(AccuracyMatrix_Gaussian(:,9))
%plot(AccuracyMatrix_Gaussian(:,10))
hold off;

%% Settings
%%%%%%%%%%%
set(gca,'XTick',[1 2 3 4 5 6 7 8 9 10] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[1 2 3 4 5 6] ); %This is what it's going to appear in those places.
xlabel('No. of Reduced Param')
ylabel('Accuracy')
set(gcf,'color','w'); 
text(5.5,0.2,texlabel('sigma = 0.01'))
text(5.5,0.4,texlabel('sigma = 0.03'))
text(5.5,0.68,texlabel('sigma = 0.1'))
text(5.5,0.85,texlabel('sigma = 0.3'))
text(5.5,0.94,texlabel('sigma = 1'))
text(2.85,0.9,'\leftarrow \sigma = 3')
text(4,0.98,'\sigma = 10 \uparrow')
text(2.84,0.97,'\sigma = 100 \downarrow')
fig=gcf;
set(findall(fig,'-property','FontSize'),'FontSize',15) 