function [y] = linear_reg(n)
%Simple linear function taking n as input generating line in form of
% y=ax + b that also adds random error to the values and fits a regression
% line based on the values with errors and plots it on top.
    x=rand(1,n);
    re = normrnd(0,1,1,n); %when u is non-zero, all errors are shifted by u
    y=4*x +2;
    y_re=zeros(1,n);
    for i=1:n
        y_re(i)=y(i)+re(i);
        i=i+1;
    end
    plot(x,y)
    hold on
    plot(x, y_re,'rx')
    hold on
    reg = polyfit(x,y_re,1);
    reg_line = reg(1)*x+reg(2);
    plot(x,reg_line,'bo')
    hold off
end

