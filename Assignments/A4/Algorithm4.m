function Algorithm4(X, y, theta0, theta1)
    percentChange = 0.01;
    iterations = 1000;
    for I = 1:iterations
        fprintf("Initial point is: [t0 %.2f, t1 %.2f]\n", theta0, theta1);

        gradient1 = 0;
        for i = 1:length(X)
            h = theta1 * X(i) + theta0;
            gradient1 = gradient1 + (2 * X(i) * (h - y(i)));
        end

        gradient0 = 0;
        for i = 1:length(X)
            h = theta1 * X(i) + theta0;
            gradient0 = gradient0 + (2 * (h - y(i)));
        end

        fprintf("Gradient is [t0 %.2f, t1 %.2f]\n", gradient0, gradient1);

        theta1 = theta1 - (percentChange * gradient1);
        theta0 = theta0 - (percentChange * gradient0);

        fprintf("Next point becomes [t0 %.2f, t1 %.2f]\n\n", theta0, theta1);
    end
end
