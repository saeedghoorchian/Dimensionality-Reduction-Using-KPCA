%compute accuracy matrix for PCA and compare it to polynomial kernel

%% Parameters
%%%%%%%%%%%%%
l = 6;
n = 6;
m = 7000;

%% Computing covariance matrix C and its eigenvalues
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Param = Data.Data(:,[2:3,5:8]);
z = zeros(1,n);
AccuracyMatrix_PCA = zeros(6,1);
for i=1:m
    z = z + Param(i,:);
end
Average = (1/m)*z;
CenteredParam = zeros(m,n);
for i=1:m
    for j=1:n
    CenteredParam(i,j) = Param(i,j) - Average(1,j);
    end
end
Covariance = (CenteredParam')*CenteredParam;
[~,EigValforLinear] = eig(Covariance);
EigValforLinear = real(diag(EigValforLinear));
SortedEigValforLinear = sort(EigValforLinear,'descend');
Total = sum(SortedEigValforLinear);
 for q = 1:l
    AccuracyMatrix_PCA(q,1) = AccuracyMatrix_PCA(q,1) + (1/Total)*sum(SortedEigValforLinear(1:q,:));
 end

%% Plot the Accuracy with respect to the neumber of parameters as a comparison 
%between polynomial kernel and PCA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure();
plot(AccuracyMatrix_PCA(:,1),'--*b');
hold on;
plot(AccuracyMatrix_Polynomial(:,1),':>k');
%plot(a(:,1),':<k');
hold off;
axis([1 6 0.9 1])
xlabel('Number of Reduced Parameters','FontSize',15)
ylabel('Accuracy')
set(gca,'XTick',[1 2 3 4 5 6] );
set(gca,'XTickLabel',[1 2 3 4 5 6] );
box off
lgd = legend({'PCA','Polynomial Kernel with d = 2'}, ...
          'Interpreter', 'latex');
lgd.FontSize = 20;

%% Positioning Legend
%%%%%%%%%%%%%%%%%%%%%
newPosition = [0.5 0.3 0.4 0.1];
newUnits = 'normalized';
set(lgd,'Position', newPosition,'Units', newUnits);
legend boxoff