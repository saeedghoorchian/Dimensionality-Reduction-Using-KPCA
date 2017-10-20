%% Specify parameters. 
%l is the number of reduced parameters and m is the number of data points 
%which we use to train the KPCA algorithm
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
l = 5;
Kernel_Var = 2;
m = 7000;
%m = size(Data.Data,1);

%% Train KPCA with Polynomial
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Im = (1/m)*ones(m,m);
KernelMatrix = zeros(m,m);
Param = Data.Data(:,[2:3,5:8]);
Training_Data = Param(1:m,:);
Data_Chosen = Data.Data(1:m,:);

for i=1:m
    for j=1:m
    KernelMatrix(i,j) = KernelMatrix(i,j) + (Training_Data(j,:)*(Training_Data(i,:)'))^(Kernel_Var);
   end
end

KernelMatrix_Centered = KernelMatrix - (Im*KernelMatrix) - (KernelMatrix*Im) + (Im*KernelMatrix*Im);

[EigVec,EigVal] = eig(KernelMatrix_Centered);
EigVal = real(diag(EigVal));
[SortedEigVal,index] = sort(EigVal,'descend');
%SortedEigValMatrix = EigVal(:,index);
SortedEigVec = EigVec(:,index); 
for i=1:m
  SortedEigVec(:,i) = SortedEigVec(:,i)/(sqrt(SortedEigVal(i)));
end

%% Projection of training data points on the first l eigenvectors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Param_Reduced = KernelMatrix_Centered*SortedEigVec(:,1:l);