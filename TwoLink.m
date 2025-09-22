syms c1 s1 c2 s2 c12 s12 L1 L2 m1 m2 q1 q2 qd1 qd2 qdd1 qdd2 g
c1= cos(q1); s1=sin(q1); c2=cos(q2); s2=sin(q2); c12=cos(q1+q2); s12=sin(q1+q2);
A01=[c1 -s1 0 L1*c1; s1 c1 0 L1*s1; 0 0 1 0; 0 0 0 1];
A12=[c2 -s2 0 L2*c2; s2 c2 0 L2*s2; 0 0 1 0; 0 0 0 1];
A02=simplify(A01*A12);
Q1=[0 -1 0 0; 1 0 0 0; 0 0 0 0; 0 0 0 0];
Q2=Q1;
U11=Q1*A01;
U21=simplify(Q1*A02);
U22=simplify(A01*Q2*A12);
I1=[1/3*m1*L1^2 0 0 -1/2*m1*L1; 0 0 0 0; 0 0 0 0; -1/2*m1*L1 0 0 m1];
I2=[1/3*m2*L2^2 0 0 -m2*L2/2; 0 0 0 0; 0 0 0 0; -m2*L2/2 0 0 m2];
UT11=[-s1 c1 0 0; -c1 -s1 0 0; 0 0 0 0; -L1*s1 L1*c1 0 0];
UT21=[-s12 c12 0 0; -c12 -s12 0 0; 0 0 0 0; -(L1*s1+L2*s12) L1*c1+L2*c12 0 0];
UT22=[-s12 c12 0 0; -c12 -s12 0 0; 0 0 0 0; -L2*s12 L2*c12 0 0];
D11=simplify(trace(U11*I1*UT11)+trace(U21*I2*UT21))
D12=simplify(trace(U22*I2*UT21))
D22=simplify(trace(U22*I2*UT22))
U111=Q1*Q2*A01;
U211= Q1*Q1*A02;
U212=simplify(Q1*A01*Q2*A12);
U221=simplify(Q1*A01*Q2*A12);
U222=simplify(A01*Q2*Q2*A12);
h111=simplify(trace(U111*I1*UT11)+trace(U211*I2*UT21));
h121=simplify(trace(U221*I2*UT21));
h112=h121;
h122=simplify(trace(U222*I2*UT21));
h1=h111*qd1^2+(h112+h121)*qd1*qd2+h122*qd2^2
h211=simplify(trace(U211*I2*UT22));
h212=trace(U212*I2*UT22);
h221=simplify(trace(U221*I2*UT22));
h222=simplify(trace(U222*I2*UT22));
h2= h211*qd1^2+(h212+h221)*qd1*qd2+h222*qd2^2
r11=[-L1/2; 0; 0; 1];r22=[-L2/2; 0; 0; 1];
gt=[0 -g 0 0];
G1=simplify(-(m1*gt*U11*r11+m2*gt*U21*r22))
G2=simplify(-m2*gt*U22*r22)
