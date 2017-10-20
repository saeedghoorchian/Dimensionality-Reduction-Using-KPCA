% Provides parameters for the Gyroscope simulation adn experiment. Is
% automatically loaded when the model is opened.

% Initial conditions
q1dot_0 = 0;
q2_0 = 0;
q3_0 = 0;


%sampling time
%ts = 1*0.000884;   %in multiples of 0.000884   %max 1.15khz
ts = 0.01;

% to perform differentiation with approximate integrator
f = 30;   %lowpass for differentiation  filters 30-100 Hz
diff_filter = c2d(tf([2*pi*f 0],[1 2*pi*f]),ts,'tustin');

% physical parameters taken from full nonlinear model by Hossam Abbas
sys.parameters.data.K_A = 0.0670;
sys.parameters.data.I_B = 0.0119;
sys.parameters.data.J_B = 0.0178;
sys.parameters.data.K_B = 0.0297;
sys.parameters.data.I_C = 0.0092;
sys.parameters.data.J_C = 0.0230;
sys.parameters.data.K_C = 0.0220;
sys.parameters.data.I_D = 0.0148;
sys.parameters.data.J_D = 0.0273;
%K_D =I_D

sys.parameters.data.fv1 = 1.8700e-4;
sys.parameters.data.fv2 = 0.0118;
sys.parameters.data.fv3 = 0.0027;
sys.parameters.data.fv4 = 0.0027;