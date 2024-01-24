%{
Generalized Gradual Descent function cause it's soooooo fun

Parameters:
    baseFunction: A function of legit any dimension
    variables: A list of variables used in the baseFunction. 
        Order must match that of baseFunction
    inputVals: List of input numbers. Order must follow variables
    stepPercent: A float for step manipulation by percent
    runTime: Max Iteration Count

Examples:
    syms f(x, y)
    f(x, y) = x.^2 + y.^2
    GradDesc(f(x, y), [x, y], [1, -1], .8, 20) -> [-0.0778, 0.0778]
%}
function res = GradDesc(baseFunction, variables, inputVals, stepPercent, runTime)
    derivativeFuncs = [];
    
    % Derive function with respect to all variables
    for index = 1:numel(variables)
        variable = variables(index);
        
        derivativeFuncs = [derivativeFuncs, diff(baseFunction, variable)];
    end

    res = inputVals;
    % Start the recursive fun
    for recursionCount = 1:runTime
        for index = 1:numel(inputVals)
            equation = symfun(derivativeFuncs(index), variables);
            inputVals(index) = res(index) - (stepPercent * double(subs(equation, variables, res)));
        end
        res = inputVals;
        fprintf("Iteration %d", recursionCount);
        fmt = [' =' repmat(' %f',1,numel(res)) '\n'];
        fprintf(fmt, res);
    end
end



%{
Usage: GradDesc(f(x), 5, .1, 10)
function res = GradDescOLD(baseDerivative, inputNum, stepPercent, runTime)
    res = inputNum;
    syms df(x);
    df(x) = diff(baseDerivative);
    for time = 1:runTime
        res = res - (stepPercent * df(res));
        fprintf("Run %d: %f\n", time, double(res));
    end
    res = double(res);
end
%}