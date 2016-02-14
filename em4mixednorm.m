function [a1,u1,u2,s1,s2]=em4mixednorm(y,a1m,u1m,u2m,s1m,s2m)
n=length(y);
p1=a1m*normpdf(y,u1m,s1m)./(a1m*normpdf(y,u1m,s1m)+(1-a1m)*normpdf(y,u2m,s2m));
p2=(1-a1m)*normpdf(y,u2m,s2m)./(a1m*normpdf(y,u1m,s1m)+(1-a1m)*normpdf(y,u2m,s2m));
a1=1/n*sum(p1);
u1=sum(y.*p1)/sum(p1);
s1=sqrt(sum((y-u1).^2.*p1)/sum(p1));
u2=sum(y.*p2)/sum(p2);
s2=sqrt(sum((y-u2).^2.*p2)/sum(p2));
end

