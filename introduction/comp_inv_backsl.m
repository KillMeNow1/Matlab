for n=1:10
    l(n)=2^n;
    A=randn(l(n));
    b=randn(l(n),1);
    tic, x1=inv(A)*b; e1(n)=toc;
    tic, x2=A\b; e2(n)=toc;
end
loglog(l,e1,'rx',l,e2,'go')
xlabel('Matrix size')
ylabel('Elapsed time')
title('Comparison of times to solve a matrix problem using inv and backslash')
legend('inv','backslash')
clear