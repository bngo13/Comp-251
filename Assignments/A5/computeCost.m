function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.


% J(x) = (h(x^i) - y^i)^2

h = (X * theta);

Ji = (h - y).^2;

J = sum(Ji);

% =========================================================================

end
