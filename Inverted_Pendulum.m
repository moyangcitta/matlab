M = 2;
m = 0.1;
l = 0.5;
g = 9.81;
A = [0 1 0 0;0 0 -1*m*g/M 0;0 0 0 1;0 0 -1*m*g/M 0]
B = [0;-1/M;0;-1/(M*l)]
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
        
    
