function J = CostV(X, y, theta)
    h = sigmoid(X * theta);
    J = sum((-y .* log(h)) - (1-y) .* log(1-h));
end

function g = sigmoid(z)
    g = 1 ./ (1  + exp(-z));
end

% J(-6, 3) = 25.9767