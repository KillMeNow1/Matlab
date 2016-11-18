function [y] = median_edited(x)
%% The function calculates median of a given array or matrix
%
% Test functions - please check if outputs are different!
% median_new_friday(1:5) = 3;
% median_new_friday(1:6) = 3.5;
%
%% function body
    vec = x(:);       %vectorise input 
    sorted = sort(vec);
    half = numel(x)/2;
    if rem(half,1) == 0     % checking if input has even number of elements
                y = (sorted(half)+sorted(half+1))/2;
    else
                half_new = ceil(half);      %rounding up if odd number of elements
                y = sorted (half_new);
    end
end

%%Original function from Monday for median calculation.
%% function [y] = median_new(x)
%{
The function calculates median of a given array or matrix
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
%}
