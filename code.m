%-- 4/27/2016 9:14 AM --%
% Motivation example
tvdat=[6.95,10.013,10.62,10.15,8.583,7.62,8.233,10.35,11.016,8.516;3.383,7.8,9.416,4.66,5.36,7.63,4.95,8.013,7.8,9.58];
[h,p,ci,stats] = ttest2(tvdat(1,:),tvdat(2,:));
for i=1:10000
    mb(1,i)=mean(datasample(tvdat(1,:), 10));
    mb(2,i)=mean(datasample(tvdat(2,:), 10));
end
hist(mb,500);legend('basic', 'paid');
hist(mb',500);legend('basic', 'paid');
hist(mb',500);legend('basic', 'paid');title('bootstrap distribution')
hist(mb',500);legend('basic', 'paid');title('bootstrap distribution');
quantile(mb(1,:),0.05);
quantile(mb(1,:),0.95);
cibasic=[quantile(mb(1,:),0.05),quantile(mb(1,:),0.95)];
cipaidc=[quantile(mb(2,:),0.05),quantile(mb(2,:),0.95)];
for i=1:10000
    m(i)=mean(datasample(tvdat(1,:), 10))-mean(datasample(tvdat(2,:), 10));
end
hist(m,500);title('bootstrap distribution of mean difference');
ci=[quantile(m,0.05),quantile(m,0.95)];

% Parametric bootstrap
close all;
clear all;
dat2 = [7,44,49,59,34,46,0,32,49,52,44,36,42,5,22,18,41,48,31,42,46,63;
51,69,41,70,42,40,40,45,57,64,61,59,60,30,58,51,63,38,42,69,49,63];
model=fitgmdist(dat2',1);
for i=1:10000
    temp=mvnrnd(model.mu, model.Sigma, 22);
    cor(i) = corr(temp(:,1),temp(:,2));
end
hist(cor,100);title('Sampling Distribution of Correlations');
% Non-parametric bootstrap
for i=1:10000
    idx=datasample(1:22,22);
    temp=dat2(:,idx)';
    cor2(i) = corr(temp(:,1),temp(:,2));
end
hist(cor2,100);title('Sampling Distribution of Correlations(Non-par)');
ci=[quantile(cor,0.025),quantile(cor,0.975)];

%Compare par and non-par bootstrap
close all;
clear all;
x1=[29 41 24 45 29 39 42 45 47 38 35 40 36 48 36 36 33 37 38 38 32 34 28 25 30 35 25 38 33 32];
x2=[34 41 44 45 29 39 42 45 47 38 35 40 36 48 46 36 33 37 38 38 42 34 28 20 30 35 25 38 33 32
];
x3=[34 41 44 45 49 39 42 45 47 38 35 40 36 48 46 36 33 37 38 38 42 34 28 20 30 35 35 38 33 32
];
kurtosis(x1)-3
kurtosis(x2)-3
kurtosis(x3)-3
n=30;
for j = 1:1000
    for i = 1:500
        nov(i) = (n-1)/n*var(datasample(x3,n));
        nom(i) = mean(datasample(x3,n));
        parv(i) = (n-1)/n*var(normrnd(mean(x3),sqrt(var(x3)),[1,n]));
        parm(i) = mean(normrnd(mean(x3),sqrt(var(x3)),[1,n]));
    end
    nvv(j)=var(nov);
    nmv(j)=var(nom);
    pvv(j)=var(parv);
    pmv(j)=var(parm);
end
v
v = sum(nvv < pvv);
m = sum(nmv < pmv);
v
m


% Smoothed bootstrap

close all;
clear all;
% We are examing difference in sampling distribution of median from normal
% distribution and bootstrap distribution by comparing the variance of
% them.
% We can approximate the real median variance of size 11 and 81 sample by
% Monte Carlo method. We simulate random numbers at certain size and
% calculate the median for 100000 times and get the variance. This could be
% done theoretically but it is not a trivial thing to do.
% We pick two sample size 11 and 81
% We assume the true data distribution is normal with mean 10 and variance
% 5
m=10;
v=5;
for i=1:100000
    tempdat11=normrnd(m,v, 11,1);
    tempdat81=normrnd(m,v, 81,1);
    m11array(i)=median(tempdat11);
    m81array(i)=median(tempdat81);
end
me11=mean(m11array);
me81=mean(m81array);
mv11=var(m11array);
mv81=var(m81array);

dat11=normrnd(m, v, 11,1);
dat81=normrnd(m, v, 81,1);
%bs
for i=1:10000
    j=1;
    for h=[0,0.1,0.25,0.5,0.75]
        e=normrnd(0,1,81,1);
        temp11=datasample(dat11, 11)+(h*e(1:11));
        temp81=datasample(dat81, 81)+(h*e);
        bs11array(j,i)=median(temp11);
        bs81array(j,i)=median(temp81);
        j=j+1;
    end
end
bs11m=mean(bs11array');
bs81m=mean(bs81array');
bs11v=var(bs11array');
bs81v=var(bs81array');
diff11=[mv11, bs11v]-mv11;
m11=[mean(dat11),bs11m];
m81=[mean(dat81),bs81m];
diff81=[mv81, bs81v]-mv81;
rname=char('True Value', 'h=0', 'h=0.1', 'h=0.25', 'h=0.5', 'h=0.75');
final=table(rname,m11', [mv11; bs11v'], diff11',m81', [mv81; bs81v'], diff81', 'VariableNames',{'rownames','mean11','variance11','Diff_in_Var11', 'mean81','variance81','Diff_in_Var81'});

