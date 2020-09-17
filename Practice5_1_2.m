%Practice 5_1_2
num = [10];
den = [1 6 5 04];
model = tf(num,den)
[A,B,C,D] = tf2ss(num,den)
P = [-5;-1-j;-1+j];
F = place(A,B,P)