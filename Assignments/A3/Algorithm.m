function [t0, t1] = Algorithm(initT0, initT1)
    percentChange = 0.02;
    t1 = initT1;
    t0 = initT0;
    for i = 1:500
        fprintf("Initial point is: [%.2f, %.2f]\n", t0, t1);

        gradientT1 = (78 * t1 + 22 * t0 - 46);
        gradientT0 = (22 * t1 + 8 * t0 - 14);

        fprintf("Gradient is [%.2f, %.2f]\n", gradientT0, gradientT1);

        t1 = t1 - (percentChange * gradientT1);
        t0 = t0 - (percentChange * gradientT0);

        fprintf("Next point becomes [%.2f, %.2f]\n\n", t0, t1);
    end
end
