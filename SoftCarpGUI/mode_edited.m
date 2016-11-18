function [y] = mode_edited(x)
%% Function to calculate mode of set of values
%
% Input : x = vector of values
%
% Output : y = mode of x
%
%% Sort unique values
un = sort(unique(x)); 
%% Count frequency
h = histogram (x);
counts = h.Values; 
%% Find location of maximum value of frequency in sorted order
[Y, I] = max(counts); 
%% Find value of maximum
y = un(I); 

end

%{ 
Original function from Monday:
function [y] = mode_new(x)
% Function to calculate mode of set of values
un = sort(unique(x)); %this sorts values in order as they are in histogram
h = histogram (x);
counts = h.Values; %counts the frequency of each bin
[Y, I] = max(counts); %tells us highest value for bin and its position
y = un(I); %so mode is the position in un with highest value for bin!
end }%