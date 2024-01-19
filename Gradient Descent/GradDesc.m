% Usage: double(GradDesc(f(x), 5, .1, 10))
function res = GradDesc(baseDerivative, inputNum, stepPercent, runTime)
    res = inputNum;
    syms df(x);
    df(x) = diff(baseDerivative);
    for time = 0:runTime
        res = res - (stepPercent * df(res));
    end
end