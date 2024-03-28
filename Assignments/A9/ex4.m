%% Machine Learning Class - Exercise 4 | One-vs-all

%  Instructions
%  ------------
%
%  This file contains code that helps you get started on the one-vs-all
%  logistic regression exercise. You will need to complete the following functions
%  in this exericse:
%
%     lrCostFunction.m (logistic regression cost function)
%     oneVsAll.m
%     predictOneVsAll.m
%
%  For this exercise, you will not need to change any code in this file,
%  or any other files other than those mentioned above.
%

%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this part of the exercise
input_layer_size  = 400;  % 20x20 Input Images of Digits
num_labels = 10;          % 10 labels, from 1 to 10
                          % (note that we have mapped "0" to label 10)

%% =========== Part 1: Loading and Visualizing Data =============
%  We start the exercise by first loading and visualizing the dataset.
%  You will be working with a dataset that contains handwritten digits.
%

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

load('ex4data1.mat'); % training data stored in arrays X, y
m = size(X, 1);

% Randomly select 100 data points to display and use as testing dataset
rng('default'); rng(1);
rand_indices = randperm(m);
X_test = X(rand_indices(1:100), :);
y_test = y(rand_indices(1:100), :);
X = removerows(X, rand_indices(1:100));
y = removerows(y, rand_indices(1:100));
m = size(X, 1);

displayData(X_test);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============ Part 2a: Vectorize Logistic Regression ============
%  In this part of the exercise, you will reuse your logistic regression
%  code from the last exercise. You task here is to make sure that your
%  logistic regression implementation is vectorized. After that, you will 
%  implement one-vs-all classification for the handwritten digit dataset.
%

% Test case for lrCostFunction
fprintf('\nTesting lrCostFunction()');

theta_t = [-2; -1; 1; 2];
X_t = [ones(5,1) reshape(1:15,5,3)/10];
y_t = ([1;0;1;0;1] >= 0.5);
[J, grad] = lrCostFunction(theta_t, X_t, y_t);

fprintf('\nCost: %f\n', J);
fprintf('Expected cost: 3.674\n');
fprintf('Gradients:\n');
fprintf(' %f \n', grad);
fprintf('Expected gradients:\n');
fprintf(' 0.7328\n 0.2572\n 0.6236\n 0.9900\n');

fprintf('Program paused. Press enter to continue.\n');
pause;
%% ============ Part 2b: One-vs-All Training ============
fprintf('\nTraining One-vs-All Logistic Regression...\n')

[all_theta] = oneVsAll(X, y, num_labels);

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================ Part 3: Predict for One-Vs-All ================


%  Note that prediction is being made on the testing dataset created above
pred = predictOneVsAll(all_theta, X_test);
fprintf('\nTesting Set Accuracy: %f\n', mean(double(pred == y_test)) * 100);
fprintf('Program paused. Press enter to continue.\n');
pause;

%  To give you an idea of the model's output, you can also run
%  through the examples one at a time to see what it is predicting.

%  m will become number of examples in testing dataset
m = size(X_test, 1);

figure;
fprintf('\nDisplaying Example Image\n');
for i = 1:m
    % Display 
    displayData(X_test(i, :));

    pred = predictOneVsAll(all_theta, X_test(i, :));
    fprintf('\nModel Prediction: %d', mod(pred, 10));
    fprintf('\nActual Value: %d\n', mod(y_test(i, :), 10));
    
    % Pause with quit option
    s = input('Paused - press enter to continue, q to exit:','s');
    if s == 'q'
      break
    end
end


