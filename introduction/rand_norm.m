function [y] = rand_norm (x)
%This function generates a set of random numbers between 0 and 1 of size x
%that are normally distributed.
    y = normrnd(0,1,1,x);
    histogram(y)
end