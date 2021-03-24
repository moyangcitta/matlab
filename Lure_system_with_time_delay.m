c = 1;
v = 1;
d = 2;
%lambda共有5个值，需要一个一个验证，先验证lambda = 0
lambda = 0; %
C = [0.6 0.8];
A = [-2 0;-1 -2];
Ad = [-0.2 -0.5;0.5 -0.2];
B = [-0.2;-0.3];
%A1为N的表达式中的A+c*lambda*Gamma那部分
Gamma = eye(size(A));
A1 = A + c*lambda*Gamma;

setlmis([]);
%定义矩阵变量PQXYZ
P = lmivar(1,[2,1]);
Q = lmivar(1,[2,1]);
X = lmivar(1,[2,1]);
Y = lmivar(1,[2,1]);
Z = lmivar(1,[2,1]);
%添加(式1)LMI的项
lmiterm([1 1 1 P],1,A1,'s');
lmiterm([1 1 1 Y],1,1,'s');
lmiterm([1 1 1 X],d,1);
lmiterm([1 1 1 Q],1,1);
lmiterm([1 1 2 P],1,Ad);
lmiterm([1 1 2 Y],-1,1);
lmiterm([1 1 3 P],-1,B);
lmiterm([1 1 3 0],-v*C');
lmiterm([1 1 4 Z],d*A1',1);
lmiterm([1 2 2 Q],-1,1);
lmiterm([1 2 4 Z],d*Ad',1);
lmiterm([1 3 3 0],-2);
lmiterm([1 3 4 Z],-d*B',1);
lmiterm([1 4 4 Z],-d,1);
%添加（式2）LMI的项，主义不等式右边为负，又由于是第二个LMI，故-2
lmiterm([-2 1 1 P],1,1);
lmiterm([-3 1 2 Y],1,1);
lmiterm([-3 2 2 Z],1,1);

lmisys = getlmis;
[tmin,xfeas] = feasp(lmisys);

pp = dec2mat(lmisys,xfeas,P);
qq = dec2mat(lmisys,xfeas,Q);
xx = dec2mat(lmisys,xfeas,X);
yy = dec2mat(lmisys,xfeas,Y);
zz = dec2mat(lmisys,xfeas,Z);