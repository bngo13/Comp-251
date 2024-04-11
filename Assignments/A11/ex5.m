%% Machine Learning Class - Exercise 5 | Forward Propagation in Neural Networks

%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on this exercise.
%  You will need to complete the following function in this exericse:
%
%     predict.m
%
%  For this exercise, you will not need to change any code in this file,
%  or any other files other than the one mentioned above.
%

%% Initialization
clear ; close all; clc

%% Setup the parameters you will use for this exercise
input_layer_size  = 400;  % 20x20 Input Images of Digits
hidden_layer_size = 25;   % 25 hidden units
num_labels = 10;          % 10 labels, from 1 to 10   
                          % (note that we have mapped "0" to label 10)

%% =========== Part 1: Loading and Visualizing Data =============
%  We start the exercise by first loading and visualizing the dataset. 
%  You will be working with a dataset that contains handwritten digits.
%

% Load Training Data
fprintf('Loading and Visualizing Data ...\n')

% data stored in arrays X, y
load('ex5data1.mat');
m = size(X, 1);

% Randomly select 100 data points to display
rng('default'); rng(1);
rand_indices = randperm(m);
X_test = X(rand_indices(1:100), :);
y_test = y(rand_indices(1:100), :);
X = removerows(X, rand_indices(1:100));
y = removerows(y, rand_indices(1:100));

displayData(X_test);

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 2: Loading Pameters ================
% In this part of the exercise, we load some pre-calculated 
% neural network parameters.

fprintf('\nLoading Saved Neural Network Parameters ...\n')

% Load the weights into variables Theta1 and Theta2
load('ex5weights.mat');
% The matrices Theta1 and Theta2 will now be in your MATLAB environment
% Theta1 has size 25 x 401
% Theta2 has size 10 x 26

%% ================= Part 3: Implement Predict =================
%  We would like to use this (already trained) nerual network to predict
%  the labels. You will now implement the "predict" function to use the
%  neural network to predict the labels of the testing set. This lets
%  you compute the testing set accuracy.

pred = predict(Theta1, Theta2, X_test);
fprintf('\nTesting Set Accuracy: %f\n', mean(double(pred == y_test)) * 100);

fprintf('Program paused. Press enter to continue.\n');
pause;

%  To give you an idea of the network's output, you can also run
%  through the testing examples one at the a time to see what it is predicting.

%  m will become number of examples in testing dataset
m = size(X_test, 1);

figure;
fprintf('\nDisplaying Example Image\n');
for i = 1:m
    % Display 
    displayData(X_test(i, :));

    pred = predict(Theta1, Theta2, X_test(i, :));
    fprintf('\nModel Prediction: %d', mod(pred, 10));
    fprintf('\nActual Value: %d\n', mod(y_test(i, :), 10));
    
    % Pause with quit option
    s = input('Paused - press enter to continue, q to exit:','s');
    if s == 'q'
      break
    end
end

