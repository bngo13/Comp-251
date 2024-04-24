%% Machine Learning Class - Exercise 6 | Neural Network Learning (Back Propagation)

%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on this exercise. 
%  You will need to complete the following function in this exericse:
%
%     nnCostFunction.m
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
load('ex6data1.mat');
m = size(X, 1);

% Randomly select 100 data points to display and use as testing dataset
rng('default'); rng(1);
rand_indices = randperm(m);
X_test = X(rand_indices(1:100), :);
y_test = y(rand_indices(1:100), :);
X = removerows(X, rand_indices(1:100));
y = removerows(y, rand_indices(1:100));

displayData(X_test);

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================ Part 2: Loading Parameters ================
% In this part of the exercise, we load some fixed pre-calculated 
% neural network parameters for dubugging purposes.

fprintf('\nLoading Saved Neural Network Parameters ...\n')

% Load the weights into variables Theta1 and Theta2
load('ex6weights.mat');
% The matrices Theta1 and Theta2 will now be in your MATLAB environment
% Theta1 has size 25 x 401
% Theta2 has size 10 x 26

% Unroll parameters 
nn_params = [Theta1(:) ; Theta2(:)];

%% ================ Part 3: Compute Cost (forward propagation) ================
%  To the neural network, you should first start by implementing the
%  feedforward part of the neural network that returns the cost only. You
%  should complete the code in nnCostFunction.m to return cost. After
%  implementing the feedforward to compute the cost, you can verify that
%  your implementation is correct by verifying that you get the same cost
%  as us for the fixed debugging parameters.

fprintf('\nFeedforward Using Neural Network ...\n')

J = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y);

fprintf(['Cost at parameters (loaded from ex6weights): %f '...
         '\n(this value should be about 0.287135)'], J);

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%% =============== Part 4: Implement Backpropagation ===============
%  Once your cost calculation is correct, you should proceed to implement the
%  backpropagation algorithm for the neural network. You should add to the
%  code you've written in nnCostFunction.m to return the partial
%  derivatives of the parameters.
%
fprintf('\nChecking Backpropagation... \n');

%  Check gradients by running checkNNGradients (only for debugging
%  purposes)
checkNNGradients;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;


%% =================== Part 5: Training NN ===================
%  You have now implemented all the code necessary to train a neural 
%  network. To train your neural network, we will now use "fmincg", which
%  is a function which works similarly to "fminunc". Recall that these
%  advanced optimizers are able to minimize our cost functions efficiently
%  as long as we provide them with the gradient computations.

fprintf('\nTraining Neural Network... \n')

%  initializing and unrolling parameters
initial_Theta1 = randInitializeWeights(input_layer_size, hidden_layer_size);
initial_Theta2 = randInitializeWeights(hidden_layer_size, num_labels);
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

%  After you have completed the assignment, change the MaxIter to a larger
%  value to see how more training affects the learning algorithm.
options = optimset('UseParallel', true, 'MaxIter', 1000);

% calling fmincg(kind of like a built-in gradient descent
[nn_params, cost] = fmincg(@(t) nnCostFunction(t, input_layer_size, hidden_layer_size, num_labels, X, y), initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), hidden_layer_size, (input_layer_size + 1));
Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), num_labels, (hidden_layer_size + 1));

fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================= Part 6: Make Predictions =================
%  After training the neural network, we would like to use it to predict
%  the labels. You will now use the "predict" function to use the
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

