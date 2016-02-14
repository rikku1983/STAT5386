%question1
ep=0.00001;
theta(1)=rand(1);
l(1)=mnpdf([6 52 28 14], [0.25*theta(1) 0.25*(2+theta(1)) 0.5*(1-2*theta(1)) 0.5*theta(1)]);
theta(2)=em4mn(theta(1));
l(2)=mnpdf([6 52 28 14], [0.25*theta(2) 0.25*(2+theta(2)) 0.5*(1-2*theta(2)) 0.5*theta(2)]);
i=1;
while(abs(theta(i+1)-theta(i))>ep)
   theta(i+2)=em4mn(theta(i+1));
   l(i+2)=mnpdf([6 52 28 14], [0.25*theta(i+2) 0.25*(2+theta(i+2)) 0.5*(1-2*theta(i+2)) 0.5*theta(i+2)]);
   i=i+1;
end
plot(1:i+1, theta);ylabel('theta hat');
plot(1:i+1, l);ylabel('likelihood');
x=0:0.001:1;
n=1;
for i=x
    y(n)=em4mn(i);
    n=n+1;
end
plot(x,y);hold on;plot(x,x);legend('theta(m)|theta(m-1)','theta(m)=theta(m-1)');


%question 2
m1=importdata('GaussianMixtureData.mat');
m2=importdata('GaussianMixtureData2.mat');
hist(m1);title('Data1');
hist(m2);title('Data2');
%guess initial values for data m1 and find MLE
a1(1)=0.5; u1(1)=-2; u2(1)=7; s1(1)=2; s2(1)=2;
l1(1)=loglike4mixednorm(m1,a1(1),u1(1),u2(1), s1(1), s2(1));
[a1(2),u1(2),u2(2),s1(2), s2(2)] = em4mixednorm(m1,a1(1),u1(1),u2(1),s1(1),s2(1));
l1(2)=loglike4mixednorm(m1,a1(2),u1(2),u2(2), s1(2), s2(2));
i=2;
while(abs(a1(i)-a1(i-1))+abs(u1(i)-u1(i-1))+abs(u2(i)-u2(i-1))+abs(s1(i)-s1(i-1))+abs(s2(i)-s2(i-1))>0.00001)
    [a1(i+1),u1(i+1),u2(i+1),s1(i+1),s2(i+1)] = em4mixednorm(m1,a1(i),u1(i),u2(i),s1(i),s2(i));
    l1(i+1)=loglike4mixednorm(m1,a1(i+1),u1(i+1),u2(i+1), s1(i+1), s2(i+1));
    i=i+1;
    
end
para1=[a1;1-a1; u1;u2;s1;s2];
%guess initial values for data m2 and find MLE
a1(1)=0.5; u1(1)=-2; u2(1)=7; s1(1)=2; s2(1)=2;
l2(1)=loglike4mixednorm(m2,a1(1),u1(1),u2(1), s1(1), s2(1));
[a1(2),u1(2),u2(2),s1(2), s2(2)] = em4mixednorm(m2,a1(1),u1(1),u2(1),s1(1),s2(1));
l2(2)=loglike4mixednorm(m2,a1(2),u1(2),u2(2), s1(2), s2(2));
i=2;
while(abs(a1(i)-a1(i-1))+abs(u1(i)-u1(i-1))+abs(u2(i)-u2(i-1))+abs(s1(i)-s1(i-1))+abs(s2(i)-s2(i-1))>0.00001)
    [a1(i+1),u1(i+1),u2(i+1),s1(i+1),s2(i+1)] = em4mixednorm(m2,a1(i),u1(i),u2(i),s1(i),s2(i));
    l2(i+1)=loglike4mixednorm(m2,a1(i+1),u1(i+1),u2(i+1), s1(i+1), s2(i+1));
    i=i+1;
end
para2=[a1; 1-a1; u1; u2; s1; s2;];
rowLabels = {'alpha1', 'alpha2','u1', 'u2', 'sigma1','sigma2'};
matrix2latex(para1, 'out.tex', 'rowLabels', rowLabels);
matrix2latex(para2(:,[1:2 322:325]), 'out.tex', 'rowLabels', rowLabels);
plot(1:5, l1);title('loglikelihood for data1');
plot(1:i, l2);title('loglikelihood for data2');
