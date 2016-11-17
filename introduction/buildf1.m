function f1=buildf1(N)
    x=0:1/N:1; 
    y=x;
    f=sin(pi*x)'*sin(pi*y);
    f1=reshape(f(2:N,2:N),(N-1)^2,1);
    
    %For N=4, solution U takes 0.000435 seconds.
    %For N=8, solution U takes 0.002179 seconds.
    %For N=16, solution U takes 0.003060 seconds.
    %For N=32, solution U takes 0.004488 seconds.
    %For N=64, solution U takes 0.039775 seconds.
    %For N=128, solution U takes 0.348389 seconds.