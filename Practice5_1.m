%Practice5_1
A = [1 -1 1;0 1 1;1 0 1];
B = [0;0;1];
Qc = ctrb(A,B);
rank_Qc = rank(Qc);
h = size(Qc,1);
if rank_Qc == h
    P_A = poly(A)
    a3 = P_A(4);
    a2 = P_A(3);
    a1 = P_A(2);
    P_x = poly([-5;-1+j;-1-j])
    a_x3 = P_x(4);
    a_x2 = P_x(3);
    a_x1 = P_x(2);
    Tc = Qc*[a2 a1 1;a1 1 0;1 0 0 ]
    F = [a_x3-a3 a_x2-a2 a_x1-a1]*inv(Tc)
else
    fprintf('false')
end