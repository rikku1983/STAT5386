%hw5 1 a
i=0;
for n=5:5:2000
    i=i+1;
    sn = normrnd(0,1,[1,n]);
    mu(i)=sum(sn)/n;
    for j=1:200
        sn = normrnd(0,1,[1,n]);
        k(j)=sum(sn)/n;
    end
    v(i)=var(k);
end
subplot(2,1,1);
plot(5:5:2000, mu);ylabel('MC estimator of Mean');xlabel('Number of random number generated');
% vaa = @(n) 1./n;
subplot(2,1,2);
plot(5:5:2000, v);ylabel('Variance of estimator');xlabel('Number of random number generated');

%b
close all;
clear all;
i=0;
for n=5:5:2000
    i=i+1;
    sn = normrnd(0,1,[1,n]);
    va(i)=var(sn);
    for j=1:200
        sn = normrnd(0,1,[1,n]);
        k(j)=var(sn);
    end
    v(i)=var(k);
end
subplot(2,1,1);
plot(5:5:2000, va);ylabel('MC estimator of Var');xlabel('Number of random number generated');
vaa = @(n) 2./n;
subplot(2,1,2);
plot(5:5:2000, v);ylabel('Variance of estimator');xlabel('Number of random number generated');

%c
close all;
clear all;
i=0;
for n=5:5:2000
    i=i+1;
    %evaluate the variance
    for j=1:200
        sn = normrnd(0,1,[1,n]);
        k(j)=sum((sn-mean(sn)).^4)/((var(sn)^2)*n);
    end
    kur(i)=sum((sn-mean(sn)).^4)/((var(sn)^2)*n);
    v(i)=var(k);
end
subplot(2,1,1);
plot(5:5:2000, kur);ylabel('MC estimater of Kurtosis');xlabel('Number of random number generated');   
subplot(2,1,2);
plot(5:5:2000, v);ylabel('Variance of estimator');xlabel('Number of random number generated');


%2a
clear all;
close all;
i=0;
for n=5:5:10000
    i=i+1;
    su=rand([1,n]);
    est(i)=sum(exp(-su))/n;
end
plot(5:5:10000, est);ylabel('MC estimator of Theta');xlabel('Number of random number generated');

%2b
clear all;
close all;
i=0;
for n=5:5:10000
    i=i+1;
    u=rand([1,n]);
    se= -log(1-u);
    est(i)=sum(se<=1)/n;
end
plot(5:5:10000, est);ylabel('MC estimator of Theta -2');xlabel('Number of random number generated');

%3 without conditioning
clear all;
close all;
i=0;
for n=5:5:20000
    i=i+1;
    u1=rand([1,n]);
    u2=rand([1,n]);
    x= -log(1-u1);
    y=-x.*log(1-u2);
    est1(i)=sum(x.*y<=3)/n;
end
i=0;
for n=5:5:20000
    i=i+1;
    u=rand([1,n]);
    x= -log(1-u);
    z=1-exp((-3)./(x.^2));
    est2(i)=sum(z)/n;
end
plot(5:5:20000, est1, 'k');hold on;
plot(5:5:20000, est2, 'y');legend('Without conditioning','With conditioning')
ylabel('MC estimator');xlabel('Number of random number generated');

%4
clear all;
close all;
i=0;
for n=5:5:20000
    i=i+1;
    u=rand([1,n]);
    x= -1./3.*log(1-u);
    estz(i)=sum(1/3.*exp(-0.5.*(x-0.5).^2))./n;
end
plot(5:5:20000, estz);ylabel('MC estimator of Z');xlabel('Number of random number generated');
z=mean(estz(3900:4000));
i=0;
for n=5:5:20000
    i=i+1;
    u=rand([1,n]);
    x= -1./3.*log(1-u);
    est(i)=sum(1/3/0.3127.*x.*exp(-0.5.*(x-0.5).^2))./n;
end
plot(5:5:20000, est);ylabel('MC estimator of theta');xlabel('Number of random number generated');