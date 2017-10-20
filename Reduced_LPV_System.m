%% Define the range of the Reduced Parameters 
%First plot the columns of the matrix Param to find the range of reduced
%parameters and specify it here
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
PR1 = [-10 -5 0 5 10]';
PR2 = [-0.7 -0.35 0 0.4 0.8]';
PR3 = [-0.4 -0.2 0 0.4 0.8]';
PR4 = [-0.5 -0.25 0 0.2 0.4]';
PR5 = [-0.4 -0.2 0 0.4 0.8]';
%PR6 = [-0.015 -0.0075 0 0.0075 0.015]';

%% Construct Reduced LPV System
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i1 = 1:length(PR1) %size(Param_Reduced,1)
    for i2 = 1:length(PR2) %size(Param_Reduced,1)
        for i3 = 1:length(PR3) %size(Param_Reduced,1)
             for i4 = 1:length(PR4)
                 for i5 = 1:length(PR5)
%                     for i6 = 1:length(PR6)
%Evaluation = ReducedModel(PR1(i1),PR2(i2),PR3(i3),PR4(i4),PR5(i5),PR6(i6));
Evaluation = ReducedModel(PR1(i1),PR2(i2),PR3(i3),PR4(i4),PR5(i5));
ARhoReduced = Evaluation(1:8,1:8);
BRhoReduced = Evaluation(1:8,9:10);
CRhoReduced = Evaluation(9:16,1:8); %eye(8,8); 
DRhoReduced = Evaluation(9:16,9:10); %zeros(8,2);
%sysReduced(:,:,i1,i2,i3,i4,i5,i6) = ss(ARhoReduced,BRhoReduced,CRhoReduced,DRhoReduced);
sysReduced(:,:,i1,i2,i3,i4,i5) = ss(ARhoReduced,BRhoReduced,CRhoReduced,DRhoReduced);
%                     end
                 end
             end
        end
    end
end

rho1Red = PR1;
rho2Red = PR2;
rho3Red = PR3;
rho4Red = PR4;
rho5Red = PR5;
%rho6Red = PR6;

[Rho1Red,Rho2Red,Rho3Red,Rho4Red,Rho5Red] = ndgrid(rho1Red,rho2Red,rho3Red,rho4Red,rho5Red);
%[Rho1Red,Rho2Red,Rho3Red,Rho4Red,Rho5Red,Rho6Red] = ndgrid(rho1Red,rho2Red,rho3Red,rho4Red,rho5Red,rho6Red);

%sysReduced.SamplingGrid = struct('rho1Red',Rho1Red,'rho2Red',Rho2Red,'rho3Red',Rho3Red,'rho4Red',Rho4Red,'rho5Red',Rho5Red,'rho6Red',Rho6Red);
sysReduced.SamplingGrid = struct('rho1Red',Rho1Red,'rho2Red',Rho2Red,'rho3Red',Rho3Red,'rho4Red',Rho4Red,'rho5Red',Rho5Red);

%% Define constants for simulation of reduced LPV system
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ITest = (1/m)*ones(1,m);
KTest = zeros(1,m);