function [t0, t1, t2] = Prob3(initT0, initT1, initT2)
    t2 = initT2;
    t1 = initT1;
    t0 = initT0;
    percentReduce = .2;
    
    for i = 1:100
        fprintf("Initial point is: [%.2f, %.2f, %.2f]\n", t0, t1, t2);

        gradientT2 = (2 * t2 + 2 * t0);
        gradientT1 = (0.5 * t1 + t0);
        gradientT0 = (6 * t0 + 2 * t2 + t1 - 2);

        fprintf("Gradient is [%.2f, %.2f, %.2f]\n", gradientT0, gradientT1, gradientT2);

        t2 = t2 - (percentReduce * gradientT2);
        t1 = t1 - (percentReduce * gradientT1);
        t0 = t0 - (percentReduce * gradientT0);

        fprintf("Next point becomes [%.2f, %.2f, %.2f]\n\n", t0, t1, t2);
    end
end