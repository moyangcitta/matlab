%MAYLAB Program 5_1
A = [1 3;0 -1];B = [0;1];
Qc = ctrb(A,B);                     %���ܿ����б���
rank_Qc = rank(Qc)                  %���ܿ����б������
h = size(Qc,1);                     
if rank_Qc == h                     %�ж��Ƿ��ܿ�
    P_A = poly(A)                   %�󱻿�ϵͳ����������ʽϵ��
    a2 = P_A(3);
    a1 = P_A(2);
    P_x = poly([-i+j;-1-j])         %��ջ�ϵͳ������������ʽϵ��
    a_x2 = P_x(3);
    a_x1 = P_x(2);
    Tc = Qc * [a1 1;1 0]            %��任����
    F = [a_x2-a2 a_x1-a1]*inv(Tc)   %��״̬�����������
else
    print('false')
end