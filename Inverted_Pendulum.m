M = 2;
m = 0.1;
l = 0.5;
g = 9.81;
A = [0 1 0 0;0 0 -1*m*g/M 0;0 0 0 1;0 0 (m+M)*g/(M*l) 0]
B = [0;1/M;0;-1/(M*l)]
C = [1 0 0 0 ];
Qc = ctrb(A,B);
rank_Qc = rank(Qc);
h = size(Qc,1);
if rank_Qc == h
    Qo = obsv(A,C);
    rank_Qo = rank(Qo);
    h = size(Qo,1);
    if rank_Qo == h
        P_A = poly(A);
        a4 = P_A(5);a3 = P_A(4);a2 = P_A(3);a1 = P_A(2);
        K1 = [-88.16 -55.93 -212.68 -47.96];
        K2 = -88.16;
        AA = [A-B*K1 B*K2;-C 0];
        BB = [zeros(4,1);1];
        CC = [C 0];
        DD = 0;
        t = 0:0.01:8;
        [y,X,t] = step(AA,BB,CC,DD,1,t);
        x1 = X(:,1);
        x2 = X(:,2);
        x3 = X(:,3);
        x4 = X(:,4);
        w = X(:,5);
        subplot(3,2,1)
        plot(t,x1,'r'),grid
        xlabel('t(sec)'),ylabel('x1')
        subplot(3,2,2)
        plot(t,x2,'k'),grid
        xlabel('t(sec)'),ylabel('x2')
        subplot(3,2,3)
        plot(t,x3,'k'),grid
        xlabel('t(sec)'),ylabel('x3')
        subplot(3,2,4)
        plot(t,x4,'k'),grid
        xlabel('t(sec)'),ylabel('x4')
        subplot(3,2,5)
        plot(t,w,'k'),grid
        xlabel('t(sec)'),ylabel('w')
    end
end
        
    
