%PLot accuracy with respect to the number of reduced parameters and
%different polynomial degree
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Parameters
%%%%%%%%%%%%%
Polynomial_Degree = [2 3 4 5 6 7 8 9]';
SiVecSize = size(Polynomial_Degree,1);
l = 6;
m = 7000;

%% Computing K and its eigenvalues
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ImforAccuracy = (1/m)*ones(m,m);
Param = Data.Data(:,[2:3,5:8]);
AccuracyMatrix_Polynomial = zeros(l,SiVecSize);
for k = 1:SiVecSize
    KernelMatrixforAcuuracy = zeros(m,m);
    for i=1:m
        for j=1:m
    KernelMatrixforAcuuracy(i,j) = KernelMatrixforAcuuracy(i,j) + (Param(j,:)*(Param(i,:)'))^(Polynomial_Degree(k));
        end
    end
KernelMatrixforAcuuracy_Centered = KernelMatrixforAcuuracy - (ImforAccuracy*KernelMatrixforAcuuracy) - (KernelMatrixforAcuuracy*ImforAccuracy) + (ImforAccuracy*KernelMatrixforAcuuracy*ImforAccuracy);
[~,EigValforAccuracy] = eig(KernelMatrixforAcuuracy_Centered);
EigValforAccuracy = real(diag(EigValforAccuracy));
SortedEigValforAccuracy = sort(EigValforAccuracy,'descend');
Total = sum(SortedEigValforAccuracy);
    for q = 1:l
    AccuracyMatrix_Polynomial(q,k) = AccuracyMatrix_Polynomial(q,k) + (sum(SortedEigValforAccuracy(1:q,:))/Total);
    end
end

%% Plot accuracy matrix for polynomial kernel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
surf(AccuracyMatrix_Polynomial,'FaceAlpha',0.9)
set(gca,'XTick',[1 2 3 4 5 6 7 8] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[2 3 4 5 6 7 8 9] ); %This is what it's going to appear in those places.
xlabel('Polynomial Degree')
ylabel('No. of Reduced Param')
zlabel('Accuracy')
set(gcf,'color','w');