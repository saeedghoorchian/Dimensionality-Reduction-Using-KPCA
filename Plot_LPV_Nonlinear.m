%% Plot the nonlinear system vs LPV system
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hFig = figure;
%% q1
subplot(4,2,1)
plot(q_Non_1.Data,'b')
hold on
plot(q_LPV_1.Data,'r')
hold off
axis([1 10000 -2 4])
xlabel('q_{1}','FontSize',15)
ylabel('')
set(gca,'XTick',[1 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[0 10 20 30 40 50 60 70 80 90 100] ); %This is what it's going to appear in those places.
box off
%% q2
subplot(4,2,3)
plot(q_Non_2.Data,'b')
hold on
plot(q_LPV_2.Data,'r')
hold off
axis([1 10000 -0.2 0.6])
xlabel('q_{2}','FontSize',15)
ylabel('')
set(gca,'XTick',[1 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000] );
set(gca,'XTickLabel',[0 10 20 30 40 50 60 70 80 90 100] );
box off
%% q3
subplot(4,2,5)
plot(q_Non_3.Data,'b')
hold on
plot(q_LPV_3.Data,'r')
hold off
axis([1 10000 -0.6 0.2])
xlabel('q_{3}','FontSize',15)
ylabel('')
set(gca,'XTick',[1 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000] );
set(gca,'XTickLabel',[0 10 20 30 40 50 60 70 80 90 100] );
box off
%% q4
subplot(4,2,7)
plot(q_Non_4.Data,'b')
hold on
plot(q_LPV_4.Data,'r')
hold off
axis([1 10000 -0.003 0.001])
xlabel('q_{4}','FontSize',15)
ylabel('')
set(gca,'XTick',[1 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000] );
set(gca,'XTickLabel',[0 10 20 30 40 50 60 70 80 90 100] );
box off
%% w1
subplot(4,2,2)
plot(w_Non_1.Data,'b')
hold on
plot(w_LPV_1.Data,'r')
hold off
axis([1 10000 -0.05 0.15])
xlabel('w_{1}','FontSize',15)
ylabel('')
set(gca,'XTick',[1 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000] );
set(gca,'XTickLabel',[0 10 20 30 40 50 60 70 80 90 100] );
box off
%% w2
subplot(4,2,4)
plot(w_Non_2.Data,'b')
hold on
plot(w_LPV_2.Data,'r')
hold off
axis([1 10000 -0.1 0.1])
xlabel('w_{2}','FontSize',15)
ylabel('')
set(gca,'XTick',[1 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000] );
set(gca,'XTickLabel',[0 10 20 30 40 50 60 70 80 90 100] );
box off
%% w3
subplot(4,2,6)
plot(w_Non_3.Data,'b')
hold on
plot(w_LPV_3.Data,'r')
hold off
axis([1 10000 -0.04 0.04])
xlabel('w_{3}','FontSize',15)
ylabel('')
set(gca,'XTick',[1 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000] );
set(gca,'XTickLabel',[0 10 20 30 40 50 60 70 80 90 100] );
box off
%% w4
subplot(4,2,8)
plot(w_Non_4.Data,'b')
hold on
plot(w_LPV_4.Data,'r')
hold off
axis([1 10000 -0.00015 0.00015])
xlabel('w_{4}','FontSize',15)
ylabel('')
set(gca,'XTick',[1 1000 2000 3000 4000 5000 6000 7000 8000 9000 10000] );
set(gca,'XTickLabel',[0 10 20 30 40 50 60 70 80 90 100] );
box off

%% Construct a Legend with the data from the sub-plots
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
lgd = legend({'Nonlinear','LPV'}, ...
          'Interpreter', 'latex');
lgd.FontSize = 15;

%% Positioning legend
%%%%%%%%%%%%%%%%%%%%%
newPosition = [0.08 0.83 0.25 0.23];
newUnits = 'normalized';
set(lgd,'Position', newPosition,'Units', newUnits);
legend boxoff