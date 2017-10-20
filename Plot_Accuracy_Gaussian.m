%PLot accuracy with respect to the number of reduced parameters and
%different Gaussian parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Parameters
%%%%%%%%%%%%%
SigmaVector = [0.01 0.03 0.1 0.3 1 3 10 30 100 300]';
SiVecSize = size(SigmaVector,1);
l = 6;
m = 7000;

%% Computing K and its eigenvalues
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ImforAccuracy = (1/m)*ones(m,m);
Param = Data.Data(:,[2:3,5:8]);
AccuracyMatrix_Gaussian = zeros(l,SiVecSize);
for k = 1:SiVecSize
    KernelMatrixforAcuuracy = zeros(m,m);
    for i=1:m
        for j=1:m
    KernelMatrixforAcuuracy(i,j) = KernelMatrixforAcuuracy(i,j) + exp(-(norm(Param(i,:)-Param(j,:))^2)/SigmaVector(k)); 
        end
    end
KernelMatrixforAcuuracy_Centered = KernelMatrixforAcuuracy - (ImforAccuracy*KernelMatrixforAcuuracy) - (KernelMatrixforAcuuracy*ImforAccuracy) + (ImforAccuracy*KernelMatrixforAcuuracy*ImforAccuracy);
[~,EigValforAccuracy] = eig(KernelMatrixforAcuuracy_Centered);
EigValforAccuracy = real(diag(EigValforAccuracy));
SortedEigValforAccuracy = sort(EigValforAccuracy,'descend');
Total = sum(SortedEigValforAccuracy);
    for q = 1:l
    AccuracyMatrix_Gaussian(q,k) = AccuracyMatrix_Gaussian(q,k) + (sum(SortedEigValforAccuracy(1:q,:))/Total);
    end
end

%% Plot Accuracy for Gaussian
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
surf(AccuracyMatrix_Gaussian,'FaceAlpha',0.9)
set(gca,'XTick',[1 2 3 4 5 6 7 8 9 10] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[0.01 0.03 0.1 0.3 1 3 10 30 100 300] ); %This is what it's going to appear in those places.
xlabel('RBF Param')
ylabel('No. of Reduced Param')
zlabel('Accuracy')
set(gcf,'color','w');