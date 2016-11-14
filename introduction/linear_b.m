function [y] = linear_b(a,b,n)
%Simple linear function taking a and b as inputs as well as n (number of
% inputs) generating line in form of
% y=ax + b that also adds random error to the values.
    x=rand(1,n);
    re = normrnd(0,1,1,n); %when u is non-zero, all errors are shifted by u
    y=a*x +b;
    y_re=zeros(1,n);
    for i=1:n
        y_re(i)=y(i)+re(i);
        i=i+1;
    end
    plot(x,y)
    hold on
    plot(x, y_re,'rx')
    hold off
end

