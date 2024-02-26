function theta = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %


    % Calculate all of h(x)
    h = (X * theta);
    % Calculate coefficient * (h(x) - y)
    gradient = X' * (h - y);
    % Update thetas
    theta = theta - (2 * alpha * gradient);

    % ============================================================

end

end
