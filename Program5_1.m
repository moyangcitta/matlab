%MAYLAB Program 5_1
A = [1 3;0 -1];B = [0;1];
Qc = ctrb(A,B);                     %求能控性判别阵
rank_Qc = rank(Qc)                  %求能控性判别阵的秩
h = size(Qc,1);                     
if rank_Qc == h                     %判断是否能控
    P_A = poly(A)                   %求被控系统的特征多项式系数
    a2 = P_A(3);
    a1 = P_A(2);
    P_x = poly([-i+j;-1-j])         %求闭环系统期望特征多项式系数
    a_x2 = P_x(3);
    a_x1 = P_x(2);
    Tc = Qc * [a1 1;1 0]            %求变换矩阵
    F = [a_x2-a2 a_x1-a1]*inv(Tc)   %求状态反馈增益矩阵
else
    print('false')
end