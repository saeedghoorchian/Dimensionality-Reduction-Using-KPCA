The application of PCA and KPCA method to perform dimensionality reduction on the LPV system of gyroscope

Step 1: Run the matlab file "Parameters"
This defines the physical parameters in the LPV system of gyroscope

Step 2: Run the matlab file "LPV_System"
This file constructs the LPV system by calculating it over a fine grid across the valid range of scheduling variables of the LPV system

Step 3: Run the matlab file "InitGyro"
This file together with the file "Multibody_system" is taken from previous work. These two help to simulate the nonlinear model of gyroscope
to be able to compare it with the LPV model

Step 4: Run the simulink "LPV_Nonlinear_Simulation"
Specify the input and initial point. Run it to compare the behavior of LPV model and nonlinear model.
Here we collect the data as our training data points to train KPCA algorithm

Step 5: Run of the files "KPCA_Gaussian" or "KPCA_Polynomial"
To train the KPCA algorithm first decide the kernel function and run the corresponding matlab file. 
In this step we train the KPCA algorithm to find the principal axes and reduced data points in feature space

Step 6: Run the matlab file "Optimization"
This code solves the optimization problem to obtain the reduced LPV model using CVX.
CVX is  an open source software which help us solve this optimization problem.
Note: Set the different parts of code with respct to the desired number of reduced parameters.

Step 7: run the matlab file "Reduced_LPV_System"
This code constructs the reduced lpv system of the gyroscope across the range of reduced parameter5s in the gridding points.
First plot the reduced parameters to see the range of each of them and define this range before running the program

Step 8: Run the simulink "LPV_ReducedLPV_Simulation"
To observe the beahviour of the reduced LPV model of the gyroscope comjpared to the LPV model run this simulation.
In this part we are testing our trained KPCA algorithm on the new previously unseen data points.
Note that in the matlab function you can choose the kernel function the same as the on you used for training the KPCA algorithm, in the step 5

Step 9: Run the matlab file "Plot_LPV_Nonlinear"
Plot the dynamical behavior of LPV model vs nonlinear model of the gyroscope

Step 10: Run the matlab file "Plot_LPV_ReducedLPV"
Plot the dynamical behavior of LPV model vs reduced LPV model of the gyroscope

Step 11: Run the matlab file "Plot_Accuracy_Polynomial"
Plot the accuracy of the reduced LPV model with respect to the number of reduced parameters and polynomial kernel degree

Step 12: Run the matlab file "Plot_Accuracy_Gaussian"
Plot the accuracy of the reduced LPV model with respect to the number of reduced parameters and Gaussian kernel parameter

Step 13: Run the matlab file "Plot_Accuracy_Fixed_Gaussian_Parameter"
Plot the accuracy of the reduced LPV model with respect to the number of reduced parameters for different but fixed Gaussian parameters

Step 14: Run the matlab file "Plot_Accuracy_PCA_Polynomial"
Plot the accuracy of the reduced LPV as a coparison between PCA method and KPCA with polynomial kernel


Should you have any question regarding the codes, please contact me via the email address: saeid.ghoorchian@gmail.com
