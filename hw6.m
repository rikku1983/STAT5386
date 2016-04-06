%hw6
%1
clear all;
close all;

for a=1:5
    i=0;
    for n=5:5:2000
        i=i+1;
        y = normrnd(a,1,[1,n]);
        theta(a,i)=mean((y>a).*exp(a^2/2-a*y));
    end
end

subplot(1,2,1);plot(5:5:2000, log(theta));legend('a=1','a=2','a=3','a=4','a=5');
axis([0 2000 -18 0]);
ylabel('Log of MC estimator');xlabel('number of n simulated');
subplot(1,2,2);fplot(@(x)[log(1-normcdf(1)),log(1-normcdf(2)),log(1-normcdf(3)),log(1-normcdf(4)),log(1-normcdf(5))], [0,2000]);
axis([0 2000 -18 0]);
legend('a=1','a=2','a=3','a=4','a=5');ylabel('Log of theoretical tail probability');

%2
%Estimate Z first
clear all;
close all;
i=0;
for n=5:5:10000
    i=i+1;
    u = rand(1,n);
    x = -log(u);
    z(i) = 2*mean(exp(x-x.^(3/4)));
end
plot(5:5:10000,z);ylabel('Estimate of Z');xlabel('number of n simulated');
Z=mean(z(1800:2000));

clear all;
close all;
i=0;
for n=5:5:10000
    i=i+1;
    u = rand(1,n);
    x = -log(u);
    z(i) = 2*median(exp(x-x.^(3/4)));
end
plot(5:5:10000,z);ylabel('Estimate of Z with Median');xlabel('number of n simulated');
Z=mean(z(1800:2000));
%use standard normal as h(x)
% clear all;
% close all;
% i=0;
% for n=5:5:10000
%     i=i+1;
%     x = normrnd(0,1,[1,n]);
%     z(i) = 2*sqrt(2*pi)*mean((x>0).*exp(x.^2*0.5-x.^(3/4)));
% end
% plot(5:5:10000,z);ylabel('Estimate of Z with Median');xlabel('number of n simulated');
% Z=mean(z(1800:2000));

%To estimate mean
clear all;
close all;
i=0;
for n=5:5:10000
    i=i+1;
    x = normrnd(0,1,[1,n]);
    mu(i) = sqrt(2*pi)/2.378*mean(x.*exp(1/2*(x.^2)-abs(x).^(3/4)));
end
plot(5:5:10000,mu);ylabel('Estimate of Mean');xlabel('number of n simulated');
M=mean(mu(1900:2000))
%What if we use median
clear all;
close all;
i=0;
for n=5:5:10000
    i=i+1;
    x = normrnd(0,1,[1,n]);
    mu(i) = sqrt(2*pi)/2.378*median(x.*exp(1/2*(x.^2)-abs(x).^(3/4)));
end
plot(5:5:10000,mu);ylabel('Estimate of Mean');xlabel('number of n simulated');


%To estimate variance
clear all;
close all;
i=0;
for n=5:5:10000
    i=i+1;
    u = rand(1,n);
    x = -log(u);
    va(i)=2/2.378*mean(x.^2.*exp(x-(x.^(3/4))));
end
plot(5:5:10000,va);ylabel('Estimate of Variance');xlabel('number of n simulated');
V=mean(va(1500:2000));

%To estimate Kurtosis
clear all;
close all;
i=0;
for n=5:5:10000
    i=i+1;
    u = rand(1,n);
    x = -log(u);
    ku(i)=2/2.378/6.7/6.7*mean(x.^4.*exp(x-(x.^(3/4))));
end
plot(5:5:10000,ku);ylabel('Estimate of Kurtosis');xlabel('number of n simulated');
K=mean(ku(1500:2000));

n=2000;
for i=1:1000
    u = rand(1,n);
    x = -log(u);
    ku(i)=2/2.378/6.7/6.7*mean(x.^4.*exp(x-(x.^(3/4))));
end
hist(ku,500);
m=mean(ku);
