%% Machine Learning Online Class
%  Exercise 2: Linear regression with multiple variables
%
%  Instructions
%  ------------
% 
%  This file contains code that helps you get started on the
%  linear regression with mutiple variables exercise. 
%
%  You will need to complete the following functions in this 
%  exericse:
%
%     ex2.m
%     featureNormalize.m
%     computeCostMulti.m
%     gradientDescentMulti.m
%     normalEqn.m
%
%  Note: For this programming exercise, besides the files mentioned above, 
%  you will need to change some parts of the code below in this file (ex2.m)
%  (e.g., when estimating the price of a 1650 sq-ft, 3 br house once using 
%   gradient descent model and once using normal equations model).
%  

%% Initialization

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
data = load('ex2data1.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf(' x = [%.0f %.0f], y = %.0f \n', [X(1:10,:) y(1:10,:)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);
fprintf('mean computed for "house size" feature = %f\n', mu(1));
fprintf('Expected mean value (approx) for "house size" feature 2000\n\n');
fprintf('mean computed for "number of bedrooms" feature = %f\n', mu(2));
fprintf('Expected mean value (approx) for "number of bedrooms" feature 3.17\n\n');
fprintf('standard deviation computed for "house size" feature = %f\n', sigma(1));
fprintf('Expected standard deviation (approx) for "house size" feature 794.7\n\n');
fprintf('standard deviation computed for "number of bedrooms" feature = %f\n', sigma(2));
fprintf('Expected standard deviation (approx) for "number of bedrooms" feature 0.76\n\n');

% Add intercept term to X
X = [ones(m, 1) X];


%% ================ Part 2: Gradient Descent ================

% ====================== YOUR CODE HERE ======================
% Instructions: We have provided you with the following starter
%               code that runs gradient descent with a particular
%               learning rate (alpha). 
%
%               Your task is to first make sure that your functions - 
%               computeCost and gradientDescent already work with 
%               this starter code and support multiple variables.
%
%               Finally, you should complete the code at the end
%               to predict the price of a 1650 sq-ft, 3 br house.
%
% Hint: At prediction, make sure you do the same feature normalization.
%

fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.001;
num_iters = 400;

% Init Theta and Run Gradient Descent 
theta = zeros(3, 1);
theta = gradientDescentMulti(X, y, theta, alpha, num_iters);

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
fprintf(' %f \n', theta);
fprintf('Expected theta values from gradient descent (approx):\n');
fprintf(' 340412.66\n  110631.05\n -6649.47\n');
fprintf('\n');

% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
% Recall that the first column of X is all-ones. Thus, it does
% not need to be normalized.
normPredict = [1 ([1650 3] - mu) ./ sigma];
price = normPredict * theta;


% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house (using gradient descent):\n $%f\n'], price);
fprintf('Expected price of a 1650 sq-ft, 3 br house (using gradient descent):\n $293081.47\n\n');
         
fprintf('Program paused. Press enter to continue.\n');
pause;

%% ================ Part 3: Normal Equations ================

fprintf('Solving with normal equations...\n');

% ====================== YOUR CODE HERE ======================
% Instructions: The following code computes the closed form 
%               solution for linear regression using the normal
%               equations. You should complete the code in 
%               normalEqn.m
%
%               After doing so, you should complete this code 
%               to predict the price of a 1650 sq-ft, 3 br house.
%

%% Load Data
data = load('ex2data1.txt');
X = data(:, 1:2);
y = data(:, 3);
m = length(y);

% Add intercept term to X
X = [ones(m, 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
fprintf(' %f \n', theta);
fprintf('Expected theta values from the normal equations (approx):\n');
fprintf(' 89597.91\n  139.21\n -8738.02\n');
fprintf('\n');


% Estimate the price of a 1650 sq-ft, 3 br house
% ====================== YOUR CODE HERE ======================
price = 0; % You should change this


% ============================================================

fprintf(['Predicted price of a 1650 sq-ft, 3 br house (using normal equations):\n $%f\n'], price);
fprintf('Expected price of a 1650 sq-ft, 3 br house (using normal equations):\n $293081.46\n\n');

