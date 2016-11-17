function A=buildA(N)
    dx=1/N;
    nvar=(N-1)^2;
    e1=ones(nvar,1);
    e2=e1; e2( 1:N-1:nvar)=0;
    e3=e1; e3(N-1:N-1:nvar)=0;
    A=spdiags([-e1 4*e1 -e1],-(N-1):N-1:N-1,nvar,nvar)+spdiags([-e3 -e2], -1: 2 : 1,nvar,nvar);
    A=A/dx^2;
    
    
    %For N=4, there are 5 non-zero diagonals and 33 non-zero elements.
    % Determinant of A is 6.8961e+15 in this case
    % Ainv=inv(A);
    %[i,j] = find(Ainv>0.02)
    %i = 2 4 5 6 8
    %j = 2 4 5 6 8
    
    % AT = transpose(A);
    % spy(A-AT) --> no non-zero entries
    % eig(A) = 18.7452; 41.3726; 41.3726; 64.0000; 64.0000; 64.0000;
    % 86.6274;86.6274;109.2548
