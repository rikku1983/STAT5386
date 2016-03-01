% generate wellbull RNs
u = rand(1000,1);
b = 0.5;
a = 1;
x = nthroot((log(1./(1-u)))/a,b);
histogram(x, 'BinWidth',1);

% 2
u1=rand;
u2=rand;
y=-log(u1);
x=u2^(1/y);

% 3
x = exprnd(1, 500, 1);
z=1;
for i = 2:length(x)
    if x(i) >= max(x(1:(i-1)))
        z(i)= 1;
    else
        z(i)=0;
    end
end
idx=find(z==1);
int=idx(2:length(idx))-idx(1:(length(idx)-1));
k=1,
yk=length(find(int==k));

k=1;
for j=1:5000
    x = exprnd(1, 500, 1);
    z=1;
    for i = 2:length(x)
        if x(i) >= max(x(1:(i-1)))
            z(i)= 1;
        else
            z(i)=0;
        end
    end
    idx=find(z==1);
    int=idx(2:length(idx))-idx(1:(length(idx)-1));
    yk(j)=length(find(int==k));
    
end
histfit(yk, 6, 'poisson');



