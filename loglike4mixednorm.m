function lo=loglike4mixednorm(y,a1,u1,u2,s1,s2)
lo=sum(log(a1*normpdf(y,u1,s1)+(1-a1)*normpdf(y,u2,s2)));
end