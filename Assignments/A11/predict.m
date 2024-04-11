function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);

% You need to return the following variables correctly 
% Note your matrix of inputs, X, has one example in each row. Therefore, p here
% (which is to contain the final prediction of the network for each example), 
% is expected to finally be organize in the form of a vector with the same
% number of rows as X
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in columns, then, 
%       you can use max(A, [], 1) to obtain 
%       the [max_value ,  index_of_the_max_element] for each column.
%

a1 = X';
a2 = sigmoid(Theta1 * [ones(1, m); a1]);
a3 = sigmoid(Theta2 * [ones(1, m); a2]);

[val, p] = max(a3, [], 1);
p = p';







% =========================================================================


end
