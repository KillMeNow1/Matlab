function f2=buildf2(N)
    x=0:1/N:1; 
    y=x;
    f=max(x,1-x)'*max(y,1-y);
    f2=reshape(f(2:N,2:N),(N-1)^2,1);
    
    % For N = 4, solution U takes 0.004520 seconds - 10x slower than f1.
    % For N = 8, solution U takes 0.000972 seconds.
    % For N = 16, solution U takes 0.000365 seconds.
    % For N = 32, solution U takes 0.003588 seconds.
    % For N = 64, solution U takes 0.020615 seconds.
    % For N = 128, solution U takes 0.399772 seconds.
    