%% Constants in the LPV model
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
I = eye(4,4);
Z = zeros(4,4);

S = [b13 0   0   0  ;
     0   b14 0   0  ;
     0   0   b15 0  ;
     0   0   0   b15];
 
F = [0   0   ;
     0   0   ;
     0   0   ;
     0   0   ;
     b16 0   ;
     0   b17 ;
     0   0   ;
     0   0   ];

CRho = eye(8,8);
DRho = zeros(8,2);

%% Gridding in the valid range of Original Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
q2 = (pi/180)*(-30:6:30);
q3 = (pi/180)*(-30:6:30);
w1 = -1:1:1;
w2 = -1:1:1;
w3 = -1:1:1;
w4 = -1:1:1;

%% Construct full order LPV System
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i = 1:length(q2)
    for j = 1:length(q3)
        for k = 1:length(w1)
            for l = 1:length(w2)
                for m = 1:length(w3)
                    for n = 1:length(w4)
                        
    s2 = sin(q2(i));
    s3 = sin(q3(j));
    c2 = cos(q2(i));
    c3 = cos(q3(j));
    
    if q3(j)==0
        s3byq3=1;
    else
        s3byq3=s3/q3(j);
    end
    
    if q2(i)==0
        s2byq2=1;
    else
        s2byq2=s2/q2(i);
    end
    
    N = [b1          0       b1*c2           b1*s2*c3                          ;
        0            b3      0              -b3*s3                             ;
        b1*c2        0      (b2*(s2^2))+b4  -b2*s2*c2*c3                       ;
        b1*s2*c3   -b3*s3   -b2*s2*c2*c3    (-b2*(s2^2)*(c3^2))+(b5*(s3^2))+b6 ];
    
    J = [I  Z ;
         Z  N ];
    
    M12 = (-b1*w2(l)*w3(m))*s2byq2;
    M13 = (-b1*s2*w3(m)*w4(n))*s3byq3;
    M22 = ((b1*w1(k)*w3(m)) + (b2*c2*(c3^2)*(w4(n)^2)) - (b2*c2*(w3(m)^2)) - (2*b7*s2*c3*w3(m)*w4(n)))*s2byq2;
    M32 = ((-b1*w1(k)*w2(l))-(2*b10*c2*w2(l)*w3(m)))*s2byq2;
    M33 = ((b1*s2*w1(k)*w4(n)) + (b11*c3*(w4(n)^2)) - (b10*(c2^2)*c3*(w4(n)^2)))*s3byq3;
    M42 = ((b2*s3*c2*(w3(m)^2)) + (2*b10*c2*(c3^2)*w2(l)*w4(n)))*s2byq2;
    M43 = ((-b1*s2*w1(k)*w3(m)) - (2*b11*c3*w3(m)*w4(n)) + (2*b10*(c2^2)*c3*w3(m)*w4(n)))*s3byq3;
    M = [0  M12  M13  0 ;
         0  M22  0    0 ;
         0  M32  M33  0 ;
         0  M42  M43  0 ];
    
    W14 = b1*c2*c3*w2(l);
    W21 = -b1*c2*c3*w4(n);
    W23 = (-b8*c3*w4(n)) + (b7*c3*w4(n));
    W24 = 2*b9*(c2^2)*c3*w3(m);
    W32 = (b8+b7)*c3*w4(n);
    W34 = b10*2*(c2^2)*c3*w2(l);
    W41 = b1*c2*c3*w2(l);
    W42 = 2*b10*(c2^2)*c3*w3(m);
    W43 = b12*c3*w2(l);
    W = [0    0    0    W14 ;
         W21  0    W23  W24 ;
         0    W32  0    W34 ;
         W41  W42  W43  0   ];
    
    H = [Z  I      ;
        -M  (-S-W) ];
    
    ARho = J\H;
    %ARho = inv(J)*H;
    BRho = J\F;
    %BRho = inv(J)*F;
    
    sysLPV(:,:,i,j,k,l,m,n) = ss(ARho,BRho,CRho,DRho); 
    
                    end
                end
            end
        end
    end
end

[Q1,Q2,W1,W2,W3,W4] = ndgrid(q2,q3,w1,w2,w3,w4);
sysLPV.SamplingGrid = struct('q2',Q1,'q3',Q2,'w1',W1,'w2',W2,'w3',W3,'w4',W4);