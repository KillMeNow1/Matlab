function [y] = mean_new(x)
%Function to calculate the mean of a given array or matrix of numbers
    if length(sum(x)) == 1
        y = sum(x)/length(x);
    else
       y = sum(sum(x))/numel(x);
    end
end

