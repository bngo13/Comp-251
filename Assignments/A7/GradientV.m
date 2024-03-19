function theta = GradientV(X, y, theta)
    iters = 1000;
    alpha = 0.05;

    for i = 1:iters
        gradient = X' * (sigmoid(X * theta) - y);
        fprintf('gradients are [%.4f] [%.4f]\n', gradient);

        theta = theta - alpha * gradient;
        fprintf('thetas are [%.4f] [%.4f]\n\n', theta);
    end
end

function g = sigmoid(z)
    g = 1 ./ (1  + exp(-z));
end

% Gradient Descent Result: -5.2739, 1.1233
% Cost of result: 4.8744