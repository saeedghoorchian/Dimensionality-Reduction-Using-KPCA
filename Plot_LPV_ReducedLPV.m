%% Plot the nonlinear system vs LPV system
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hFig = figure;
%% q1
subplot(4,2,1)
plot(q_Pol1_1.Data(:,1),'r')
hold on
plot(q_Pol1_1.Data(:,2),'k')
plot(q_Pol3_1.Data(:,2),'b')
plot(q_Pol5_1.Data(:,2),'g')
hold off
axis([1 1000 0 0.7])
xlabel('q_{1}','FontSize',15)
ylabel('')
set(gca,'XTick',[1 100 200 300 400 500 600 700 800 900 1000] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[0 1 2 3 4 5 6 7 8 9 10] ); %This is what it's going to appear in those places.
box off
%% q2
subplot(4,2,3)
plot(q_Pol1_2.Data(:,1),'r')
hold on
plot(q_Pol1_2.Data(:,2),'k')
plot(q_Pol3_2.Data(:,2),'b')
plot(q_Pol5_2.Data(:,2),'g')
hold off
axis([1 1000 -0.5 0.6])
xlabel('q_{2}','FontSize',15)
ylabel('')
set(gca,'XTick',[1 100 200 300 400 500 600 700 800 900 1000] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[0 1 2 3 4 5 6 7 8 9 10] ); %This is what it's going to appear in those places.
box off
%% q3
subplot(4,2,5)
plot(q_Pol1_3.Data(:,1),'r')
hold on
plot(q_Pol1_3.Data(:,2),'k')
plot(q_Pol3_3.Data(:,2),'b')
plot(q_Pol5_3.Data(:,2),'g')
hold off
axis([1 1000 -0.4 1])
xlabel('q_{3}','FontSize',15)
ylabel('')
set(gca,'XTick',[1 100 200 300 400 500 600 700 800 900 1000] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[0 1 2 3 4 5 6 7 8 9 10] ); %This is what it's going to appear in those places.
box off
%% q4
subplot(4,2,7)
plot(q_Pol1_4.Data(:,1),'r')
hold on
plot(q_Pol1_4.Data(:,2),'k')
plot(q_Pol3_4.Data(:,2),'b')
plot(q_Pol5_4.Data(:,2),'g')
hold off
axis([1 1000 -1 2])
xlabel('q_{4}','FontSize',15)
ylabel('')
set(gca,'XTick',[1 100 200 300 400 500 600 700 800 900 1000] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[0 1 2 3 4 5 6 7 8 9 10] ); %This is what it's going to appear in those places.
box off
%% w1
subplot(4,2,2)
plot(w_Pol1_1.Data(:,1),'r')
hold on
plot(w_Pol1_1.Data(:,2),'k')
plot(w_Pol3_1.Data(:,2),'b')
plot(w_Pol5_1.Data(:,2),'g')
hold off
axis([1 1000 0 6])
xlabel('w_{1}','FontSize',15)
ylabel('')
set(gca,'XTick',[1 100 200 300 400 500 600 700 800 900 1000] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[0 1 2 3 4 5 6 7 8 9 10] ); %This is what it's going to appear in those places.
box off
%% w2
subplot(4,2,4)
plot(w_Pol1_2.Data(:,1),'r')
hold on
plot(w_Pol1_2.Data(:,2),'k')
plot(w_Pol3_2.Data(:,2),'b')
plot(w_Pol5_2.Data(:,2),'g')
hold off
axis([1 1000 -1 2])
xlabel('w_{2}','FontSize',15)
ylabel('')
set(gca,'XTick',[1 100 200 300 400 500 600 700 800 900 1000] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[0 1 2 3 4 5 6 7 8 9 10] ); %This is what it's going to appear in those places.
box off
%% w3
subplot(4,2,6)
plot(w_Pol1_3.Data(:,1),'r')
hold on
plot(w_Pol1_3.Data(:,2),'k')
plot(w_Pol3_3.Data(:,2),'b')
plot(w_Pol5_3.Data(:,2),'g')
hold off
axis([1 1000 0 6])
xlabel('w_{3}','FontSize',15)
ylabel('')
set(gca,'XTick',[1 100 200 300 400 500 600 700 800 900 1000] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[0 1 2 3 4 5 6 7 8 9 10] ); %This is what it's going to appear in those places.
box off
%% w4
subplot(4,2,8)
plot(w_Pol1_4.Data(:,1),'r')
hold on
plot(w_Pol1_4.Data(:,2),'k')
plot(w_Pol3_4.Data(:,2),'b')
plot(w_Pol5_4.Data(:,2),'g')
hold off
axis([1 1000 0 15])
xlabel('w_{4}','FontSize',15)
ylabel('')
set(gca,'XTick',[1 100 200 300 400 500 600 700 800 900 1000] ); %This are going to be the only values affected.
set(gca,'XTickLabel',[0 1 2 3 4 5 6 7 8 9 10] ); %This is what it's going to appear in those places.
box off

%% Legend
%%%%%%%%%
lgd = legend({'LPV Model','$\ell$ = 1','$\ell$ = 3','$\ell$ = 5'}, ...
          'Interpreter', 'latex');
lgd.FontSize = 15;

%% Positioning Legend
%%%%%%%%%%%%%%%%%%%%%
newPosition = [0.4 0.8 0.23 0.23];
newUnits = 'normalized';
set(lgd,'Position', newPosition,'Units', newUnits);
legend boxoff