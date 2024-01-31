function [t0, t1] = Prob1(initT0, initT1)
    t1 = initT1;
    t0 = initT0;
    for i = 1:10
        fprintf("Initial point is: [%.2f, %.2f]\n", t0, t1);

        gradientT0 = (2 * t0);
        gradientT1 = (2 * t1);

        fprintf("Gradient is [%.2f, %.2f]\n", gradientT0, gradientT1);

        t1 = t1 - (.25 * gradientT1);
        t0 = t0 - (.25 * gradientT0);

        fprintf("Next point becomes [%.2f, %.2f]\n\n", t0, t1);
    end
end