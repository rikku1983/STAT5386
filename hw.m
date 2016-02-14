%homework 2 #1
ep=0.00001;
%simple iteration
x(1)= pi/4;
gx=sin(x(1));
i=1;
while(abs(x(i)-gx)>ep)
    gx=x(i);
    x(i+1) = function1(x(i));
    i=i+1;
end

%Newton-Raphson
y(1)=pi/4;
gy=function2(y(j));
j=1;
while(abs(y(j)-gy)>ep)
    gy=y(j);
    y(j+1)=function2(y(j));
    j=j+1;
end
semilogx(1:i, x);hold on;
semilogx(1:j, y);
xlabel('log(number of iterations)');
ylabel('root value');
legend('simple-iteration','Newton-Raphson');

%question2
clear all
close all
clc
x(1)=-1;
gx=function3(x(1));
i=1;
while(abs(x(i)-gx)>0.00001)
    gx=x(i);
    x(i+1)=function3(x(i));
    E(i)=abs(x(i+1)-gx);
    i=i+1;
end

for j = 1:(length(E)-1)
    K(j)=E(j+1)/E(j);
end
m=1/(1-K(length(K)));
plot(1:i, x);hold on;plot(2:i, E, '--');hold on;plot(3:i,K, ':');
xlabel('number of iterations');
ylabel('Values');
legend('root x','E', 'K');