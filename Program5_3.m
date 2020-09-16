%MATLAB Program 5_3
A = [1 3;0 -1];
C = [1 1];
P = [-3;-3];            %由观测阵期望极点构成向量P
Gt = acker(A',C',P);    %求对偶系统的状态反馈增益矩阵Gt
G = Gt'                 %求系统的观测器偏差反馈增益矩阵G
eig(A-G*C)