function [y] = rand_uniform(x)
% This function generates a uniform distribution of random numbers of size
% x between 0 and 1.
    y= rand(1, x);
    m = mean(y);
    stand_dev = std(y);
    fprintf('Mean is %d.\n',m)
    fprintf('Standard deviation is %d.\n',stand_dev)
    histogram(y);
end