%1
close all
clear all
%First estimate the denominator (because we need to plot f(x))
n=10000;
u1=rand(1,n);
x=-log(u1);
f=@(x) x.^2.*abs(sin(pi*x)).*exp(-x.^2);
dno = mean(f(x));
f2=@(x) f(x)/0.1041;
fplot(f2, [0,5]);
%Use independent MH to estimate
close all
clear all
f=@(x) x.^2.*abs(sin(pi*x)).*exp(-x.^2)/0.1041;
q=@(y) exp(-y);
rho=@(x,y) min(f(y)*q(x)/f(x)/q(y),1);
x(1)=0.5;
step=10000;
for i=1:step
    u=rand;
    xcan=-log(u);
    u2=rand;
    if(u2<=rho(x(i),xcan))
        x(i+1)=xcan;
    else
        x(i+1)=x(i);
    end
end
subplot(211);
hist(x(5000:10000), 500);
subplot(212);
fplot(f, [0,3]);
ex=mean(x(5000:10000));
vx=var(x(5000:10000));

%Use random walk MH to estimate
close all
clear all
f=@(x) x.^2.*abs(sin(pi*x)).*exp(-x.^2)/0.1041;
q=@(y) normrnd();
rho=@(x,y) min(f(y)*q(x)/f(x)/q(y),1);
x(1)=0.5;
step=10000;
for i=1:step
    u=rand;
    xcan=-log(u);
    u2=rand;
    if(u2<=rho(x(i),xcan))
        x(i+1)=xcan;
    else
        x(i+1)=x(i);
    end
end
subplot(211);
hist(x(5000:10000), 500);
subplot(212);
fplot(f, [0,3]);
ex=mean(x(5000:10000));
vx=var(x(5000:10000));

%2
close all;
clear all;
lam=1;
rho=@(x,z) min(exp(lam*((abs(6-x))^0.5-(abs(6-z))^0.5)), 1);
step=10000;
x(1,1)=-2;
x(2,1)=0;
x(3,1)=1.5;
x(4,1)=10;
for j=1:4
    for i=1:step
        z=normrnd(5,4);
        u2=rand;
        if(u2<=rho(x(j,i),z))
            x(j,i+1)=z;
        else
            x(j,i+1)=x(j,i);
        end
        m(j,i)=mean(x(j,max(1, i-1000):i));
        v(j,i)=var(x(j,max(1,i-1000):i));
    end
end
subplot(221);plot(1:10001, x(1,:));xlim([0,10001]);
subplot(222);plot(1:10001, x(2,:));xlim([0,10001]);
subplot(223);plot(1:10001, x(3,:));xlim([0,10001]);
subplot(224);plot(1:10001, x(4,:));xlim([0,10001]);
close all;
subplot(221);hist(x(1,:),500);
subplot(222);hist(x(2,:),500);
subplot(223);hist(x(3,:),500);
subplot(224);hist(x(4,:),500);
close all;
plot(1:1000, m(:,1:1000));ylabel('Mean');
plot(1:1000, v(:,1:1000));ylabel('variance');

