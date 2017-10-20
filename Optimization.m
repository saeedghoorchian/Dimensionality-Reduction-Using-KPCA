%% Solve optimization problem using CVX
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cvx_begin sdp

NormSummationOpt = 0;

%% Set the number of variables of cost function with respect to the desired number of reduced parameters.
%change the remaining part of the code with respect to this.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
variable RZeroOpt(16,10);
variable ROneOpt(16,10);
variable RTwoOpt(16,10);
variable RThreeOpt(16,10);
variable RFourOpt(16,10);
variable RFiveOpt(16,10);
%variable RSixOpt(16,10);

IOpt = eye(4,4);
ZOpt = zeros(4,4);
SOpt = [b13 0   0   0   ;
        0   b14 0   0   ;
        0   0   b15 0   ;
        0   0   0   b15 ];
    
FOpt = [0   0   ;
        0   0   ;
        0   0   ;
        0   0   ;
        b16 0   ;
        0   b17 ;
        0   0   ;
        0   0   ];

CRhoOpt = diag([1;1;1;1;1;1;1;1]);
DRhoOpt = zeros(8,2);

for t = 1:m
    s2Opt = sin(Data_Chosen(t,2));
    s3Opt = sin(Data_Chosen(t,3));
    c2Opt = cos(Data_Chosen(t,2));
    c3Opt = cos(Data_Chosen(t,3));
    if Data_Chosen(t,3)==0
        s3Optbyq3=1;
    else
        s3Optbyq3=s3Opt/Data_Chosen(t,3);
    end
    
    if Data_Chosen(t,2)==0
        s2Optbyq2=1;
    else
        s2Optbyq2=s2Opt/Data_Chosen(t,2);
    end
    
    NOpt = [b1              0          b1*c2Opt               b1*s2Opt*c3Opt                              ;
           0                b3         0                     -b3*s3Opt                                    ;
           b1*c2Opt         0         (b2*(s2Opt^2))+b4      -b2*s2Opt*c2Opt*c3Opt                        ;
           b1*s2Opt*c3Opt  -b3*s3Opt  -b2*s2Opt*c2Opt*c3Opt  (-b2*(s2Opt^2)*(c3Opt^2))+(b5*(s3Opt^2))+b6 ];
    JOpt = [IOpt  ZOpt ;
            ZOpt  NOpt ];
        
    M12Opt = (-b1*Data_Chosen(t,6)*Data_Chosen(t,7))*s2Optbyq2;
    M13Opt = (-b1*s2Opt*Data_Chosen(t,7)*Data_Chosen(t,8))*s3Optbyq3;
    M22Opt = ((b1*Data_Chosen(t,5)*Data_Chosen(t,7)) + (b2*c2Opt*(c3Opt^2)*(Data_Chosen(t,8)^2)) - (b2*c2Opt*(Data_Chosen(t,7)^2)) - (2*b7*s2Opt*c3Opt*Data_Chosen(t,7)*Data_Chosen(t,8)))*s2Optbyq2;
    M32Opt = ((-b1*Data_Chosen(t,5)*Data_Chosen(t,6))-(2*b10*c2Opt*Data_Chosen(t,6)*Data_Chosen(t,7)))*s2Optbyq2;
    M33Opt = ((b1*s2Opt*Data_Chosen(t,5)*Data_Chosen(t,8)) + (b11*c3Opt*(Data_Chosen(t,8)^2)) - (b10*(c2Opt^2)*c3Opt*(Data_Chosen(t,8)^2)))*s3Optbyq3;
    M42Opt = ((b2*s3Opt*c2Opt*(Data_Chosen(t,7)^2)) + (2*b10*c2Opt*(c3Opt^2)*Data_Chosen(t,6)*Data_Chosen(t,8)))*s2Optbyq2;
    M43Opt = ((-b1*s2Opt*Data_Chosen(t,5)*Data_Chosen(t,7)) - (2*b11*c3Opt*Data_Chosen(t,7)*Data_Chosen(t,8)) + (2*b10*(c2Opt^2)*c3Opt*Data_Chosen(t,7)*Data_Chosen(t,8)))*s3Optbyq3;
    MOpt = [0  M12Opt  M13Opt  0;
            0  M22Opt  0       0;
            0  M32Opt  M33Opt  0;
            0  M42Opt  M43Opt  0];
      
    W14Opt = b1*c2Opt*c3Opt*Data_Chosen(t,6);
    W21Opt = -b1*c2Opt*c3Opt*Data_Chosen(t,8);
    W23Opt = (-b8*c3Opt*Data_Chosen(t,8)) + (b7*c3Opt*Data_Chosen(t,8));
    W24Opt = 2*b9*(c2Opt^2)*c3Opt*Data_Chosen(t,7);
    W32Opt = (b8+b7)*c3Opt*Data_Chosen(t,8);
    W34Opt = b10*2*(c2Opt^2)*c3Opt*Data_Chosen(t,6);
    W41Opt = b1*c2Opt*c3Opt*Data_Chosen(t,6);
    W42Opt = 2*b10*(c2Opt^2)*c3Opt*Data_Chosen(t,7);
    W43Opt = b12*c3Opt*Data_Chosen(t,6);
    WOpt = [0       0       0       W14Opt ;
            W21Opt  0       W23Opt  W24Opt ;
            0       W32Opt  0       W34Opt ;
            W41Opt  W42Opt  W43Opt  0      ];
    
    HOpt = [ZOpt   IOpt        ;
           -MOpt  (-SOpt-WOpt) ];
       
    ARhoOpt = JOpt\HOpt; 
    BRhoOpt = JOpt\FOpt;
    %ARhoOpt = inv(JOpt)*HOpt; 
    %BRhoOpt = inv(JOpt)*FOpt; 
    QRhoOpt = [ARhoOpt BRhoOpt ; 
               CRhoOpt DRhoOpt ];
           
    Norm = sum(sum_square_abs(QRhoOpt - (RZeroOpt + ROneOpt*Param_Reduced(t,1) + RTwoOpt*Param_Reduced(t,2) + RThreeOpt*Param_Reduced(t,3) + RFourOpt*Param_Reduced(t,4) + RFiveOpt*Param_Reduced(t,5))));
    %Norm = sum(sum_square_abs(QRhoOpt - (RZeroOpt + ROneOpt*Param_Reduced(t,1) + RTwoOpt*Param_Reduced(t,2) + RThreeOpt*Param_Reduced(t,3) + RFourOpt*Param_Reduced(t,4) + RFiveOpt*Param_Reduced(t,5) + RSixOpt*Param_Reduced(t,6))));
    NormSummationOpt = NormSummationOpt + Norm;
end

CostFunction = (1/n)*NormSummationOpt;

minimize   CostFunction  ;
cvx_end

RZeroFinal = full(RZeroOpt);
ROneFinal = full(ROneOpt);
RTwoFinal = full(RTwoOpt);
RThreeFinal = full(RThreeOpt);
RFourFinal = full(RFourOpt);
RFiveFinal = full(RFiveOpt);
%RSixFinal = full(RSixOpt);

ReducedModel = @(Rho1,Rho2,Rho3,Rho4,Rho5)(RZeroFinal + ROneFinal*Rho1 + RTwoFinal*Rho2 + RThreeFinal*Rho3 + RFourFinal*Rho4 + RFiveFinal*Rho5);
%ReducedModel = @(Rho1,Rho2,Rho3,Rho4,Rho5,Rho6)(RZeroFinal + ROneFinal*Rho1 + RTwoFinal*Rho2 + RThreeFinal*Rho3 + RFourFinal*Rho4 + RFiveFinal*Rho5 + RSixFinal*Rho6);