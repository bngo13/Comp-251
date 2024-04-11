function result = Problem2(t1, t2, t3, X)
    a1 = [ones(1, size(X, 2)); X];
    
    a2 = sigmoid(t1 * a1);
    a2 = [ones(1, size(a2, 2)); a2];

    a3 = sigmoid(t2 * a2);
    a3 = [ones(1, size(a3, 2)); a3];

    a4 = sigmoid(t3 * a3);

    result = a4;
end

function result = sigmoid(z)
    result = 1 ./ (1 + exp(-z));
end

% Result: [.2849 .5732]
