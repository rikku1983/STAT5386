%1
close all
clear all
pai=[0.2 0.2 0.1 0.5;0.1 0.3 0.4 0.2;0.3 0.2 0.3 0.2;0.1 0.3 0.1 0.5]
[V,D,W]=eig(pai);
P=-W(:,1)';
%Simulation
steps=10000;
for i=1:5
    x(i,1)=mod(i,4)+1; %start status at t1;
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
%Plot 5 sample path for 100 steps
subplot(511);
plot(1:50, x(1,1:50));
subplot(512);
plot(1:50, x(2,1:50));
subplot(513);
plot(1:50, x(3,1:50));
subplot(514);
plot(1:50, x(4,1:50));
subplot(515);
plot(1:50, x(5,1:50));
ylabel('steps');ylabel('X states');

y=@(n,i)[mean(x(i,1:n)==1), mean(x(i,1:n)==2),mean(x(i,1:n)==3),mean(x(i,1:n)==4)];
for n =1:steps
    xper(n,1:4)=y(n,1);
end
area(xper);colormap('winter');legend('x=1', 'x=2', 'x=3','x=4');
xlabel('first n steps were used');ylabel('percentage of each status');

%2
close all
clear all
%Simulation
pai=[0.2 0.2 0.1 0.5;0.1 0.3 0.4 0.2;0.3 0.2 0.3 0.2;0.1 0.3 0.1 0.5]
steps=10000;
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
