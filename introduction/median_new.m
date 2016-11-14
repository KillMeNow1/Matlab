function [y] = median_new(x)
%The function calculates median of a given array or matrix
    if length(size(x)) == 1
        sorted = sort(x);
        half = length(x)/2;
    else 
        vec = reshape(x,1,numel(x));
        sorted = sort(vec);
        half = numel(x)/2;
    end
    if rem(half,1) == 0
                y = (sorted(half)+sorted(half+1))/2;
    else
                half_new = ceil(half);
                y = sorted (half_new);
    end
end

