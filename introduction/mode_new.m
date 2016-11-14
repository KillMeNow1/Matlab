function [y] = mode_new(x)
%Function to calculate mode of set of values
un = sort(unique(x)); %this sorts values in order as they are in histogram
h = histogram (x);
counts = h.Values; %counts the frequency of each bin
[Y, I] = max(counts); %tells us highest value for bin and its position
y = un(I); %so mode is the position in un with highest value for bin!
end

