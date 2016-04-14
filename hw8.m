%1
close all
clear all
%Simulation
pai=[0.5 0.5 0 0;0.1 0.9 0 0;0 0 0.3 0.7;0 0 0.2 0.8]
steps=1000;
for i=1:4
    x(i,1)=i;
    for t=1:steps
        u=rand;
        if(u<pai(x(i,t),1))
            x(i,t+1)=1;
        elseif(u<sum(pai(x(i,t),1:2)))
            x(i,t+1)=2;
        elseif(u<sum(pai(x(i,t),1:3)))
            x(i,t+1)=3;
        else
            x(i,t+1)=4;
        end
    end
end
y=@(n,i)[mean(x(i,1:n)==1), mean(x(i,1:n)==2),mean(x(i,1:n)==3),mean(x(i,1:n)==4)];
for n=1:steps
    xper1(n,1:4)=y(n,1);
    xper2(n,1:4)=y(n,2);
    xper3(n,1:4)=y(n,3);
    xper4(n,1:4)=y(n,4);
end
subplot(221);plot(1:steps,xper1);title('start at 1');xlim([1,steps+1]);legend('1','2','3','4');
subplot(222);plot(1:steps,xper2);title('start at 2');xlim([1,steps+1]);legend('1','2','3','4');
subplot(223);plot(1:steps,xper3);title('start at 3');xlim([1,steps+1]);legend('1','2','3','4');
subplot(224);plot(1:steps,xper4);title('start at 4');xlim([1,steps+1]);legend('1','2','3','4');

close all
clear all
%Simulation
pai=[0 0.5 0 0.5;0.5 0 0.5 0;0 0.5 0 0.5;0.5 0 0.5 0]
steps=1000;
for i=1:4
    x(i,1)=i;
    for t=1:steps
        u=rand;
        if(u<pai(x(i,t),1))
            x(i,t+1)=1;
        elseif(u<sum(pai(x(i,t),1:2)))
            x(i,t+1)=2;
        elseif(u<sum(pai(x(i,t),1:3)))
            x(i,t+1)=3;
        else
            x(i,t+1)=4;
        end
    end
end
y=@(n,i)[mean(x(i,1:n)==1), mean(x(i,1:n)==2),mean(x(i,1:n)==3),mean(x(i,1:n)==4)];
for n=1:steps
    xper1(n,1:4)=y(n,1);
    xper2(n,1:4)=y(n,2);
    xper3(n,1:4)=y(n,3);
    xper4(n,1:4)=y(n,4);
end
subplot(221);plot(1:steps,xper1);title('start at 1');xlim([1,steps+1]);legend('1','2','3','4');
subplot(222);plot(1:steps,xper2);title('start at 2');xlim([1,steps+1]);legend('1','2','3','4');
subplot(223);plot(1:steps,xper3);title('start at 3');xlim([1,steps+1]);legend('1','2','3','4');
subplot(224);plot(1:steps,xper4);title('start at 4');xlim([1,steps+1]);legend('1','2','3','4');

%2
%get the eigen vector with 1 as eigenvalue
close all;
clear all;
pai=[0.1 0.3 0.4 0.2;0.2 0.1 0.3 0.4;0.4 0.2 0.1 0.3;0.3 0.4 0.2 0.1];
[V,D,W]=eig(pai);
P=abs(W(:,1))';
pmf=P./(sum(P));
%Simulation
steps=1000;
f=[2,1,2.5,-1];
for i=1:4
    x(i,1)=i;
    for t=1:steps
        u=rand;
        if(u<pai(x(i,t),1))
            x(i,t+1)=1;
        elseif(u<sum(pai(x(i,t),1:2)))
            x(i,t+1)=2;
        elseif(u<sum(pai(x(i,t),1:3)))
            x(i,t+1)=3;
        else
            x(i,t+1)=4;
        end
    end
end
for n=1:steps
    y(n,1)=mean(f(x(1,1:n)));
    y(n,2)=mean(f(x(2,1:n)));
    y(n,3)=mean(f(x(3,1:n)));
    y(n,4)=mean(f(x(4,1:n)));
end
plot(1:steps,y);title('Convergence of Expected value');xlim([1,steps+1]);
legend('stat from 1','start from 2','start from 3','start from 4');

%3
%get the eigen vector with 1 as eigenvalue
close all;
clear all;
pai=[0.1 0.3 0.4 0.2;0.2 0.4 0 0.4;0 0.3 0.5 0.2;0.5 0.3 0.2 0];
[V,D,W]=eig(pai);
P=abs(W(:,1))';
pmf=P./(sum(P));
%Simulation
steps=1000;
f=[2,1,2.5,-1];
for i=1:4
    x(i,1)=i;
    for t=1:steps
        u=rand;
        if(u<pai(x(i,t),1))
            x(i,t+1)=1;
        elseif(u<sum(pai(x(i,t),1:2)))
            x(i,t+1)=2;
        elseif(u<sum(pai(x(i,t),1:3)))
            x(i,t+1)=3;
        else
            x(i,t+1)=4;
        end
    end
end
for n=1:steps
    y(n,1)=mean(f(x(1,1:n)));
    y(n,2)=mean(f(x(2,1:n)));
    y(n,3)=mean(f(x(3,1:n)));
    y(n,4)=mean(f(x(4,1:n)));
end
plot(1:steps,y);title('Convergence of Expected value');xlim([1,steps+1]);
legend('stat from 1','start from 2','start from 3','start from 4');