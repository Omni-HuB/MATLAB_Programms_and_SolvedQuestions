% Nadal Analysis
%pratice question 1
clear ;
close all;
clc;
%%%%%%%%%%%%%

v1=9;
v2=-1j*9;
w=20; %% in rad/sec

%impedence of inductor (in ohms)
zl=(1j*w*70*1e-3);
%impedence of capacitor (in ohms)
zc=1/(1j*w*250*1e-3);
%resistance of resistor 1 (in ohms)
r1=3;
%resistance of resistor 2 (in ohms)
r2=5;

A=[(zc+r1) (-zc) (-r1) (-r1); (-0.005+zc) (-zc-zl) 0 (zl);r1 0 (-zc-r1) (-r1);0 -zl -zc  (r2+zl)];
B=[v1;0;v2;v2];

I=linsolve(A,B)
Iabs=abs(I)
Iangle=angle(I)*(180/pi)




