function [t0, t1] = Prob2(initT0, initT1)
    t1 = initT1;
    t0 = initT0;
    percentReduce = .01;
    for i = 1:5
        fprintf("Initial point is: [%.2f, %.2f]\n", t0, t1);

        gradientT1 = (76 * t1 + 20 * t0 - 42);
        gradientT0 = (6 * t0 + 20 * t1 - 12);

        fprintf("Gradient is [%.2f, %.2f]\n", gradientT0, gradientT1);

        t1 = t1 - (percentReduce * gradientT1);
        t0 = t0 - (percentReduce * gradientT0);

        fprintf("Next point becomes [%.2f, %.2f]\n\n", t0, t1);
    end
end