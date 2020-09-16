%MATLAB Program 5_2
A = [1 3;0 -1];
B = [0;1];
P = [-1+j;-1-j];        %期望闭环极点构成向量P
F = place(A,B,P)        %求状态反馈增益阵F
A = acker(A,B,P)
