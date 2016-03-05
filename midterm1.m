% midterm project for STAT5386
% problem number 1
x=[3 3 3 1; 2 1 2 1; 1 3 3 1; 3 2 2 3; 1 3 2 1];
y=[22;14;20;25;17];
[Q,R]=houseqr(x);
x2 = R(1:size(R,2),:)
y2 = Q'*y;
y3 = y2(1:size(R,2));
b=backsubstitution(x2,y3);
% which is equal to
inv(x'*x)*x'*y;

% problem number 2
clear;
load midterm_dat;
cox = cov(X);
[U,S,V] = svd(cox);
i=1;
for d=10:10:100
    U1=U(:,1:d);
    X1=X*U1;
    b=inv(X1'*X1)*X1'*y;
    SSE(i)= norm(y-X1*b)^2;
    i=i+1;
end
plot(10:10:100, SSE, '*-');xlabel('number of principle components used');ylabel('SSE');

