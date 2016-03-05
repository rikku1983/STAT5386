% Input is a upper triangular matrix x with dimension nxn and a vector y
% with dimension nx1
% output the solution of b
function b=backsubstitution(x,y)
    n=length(y);
    b=zeros(n,1);
    temp=0;
    for i=n:-1:2
        b(i)=(y(i)-temp)/x(i,i);
        temp=x(i-1,i:n)*b(i:n);
    end
    b(1)=(y(1)-temp)/x(1,1);

    