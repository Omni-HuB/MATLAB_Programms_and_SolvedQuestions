% Shobha Sundar Ram
% CTD 
% Lecture 1 - 27 September 2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

close all;
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 1 - Mesh analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Angular velocity (rad/s)
w = 20;

% Independent voltage sources (V)
V1 = 9;
V2 =-1j*9;

% Circuit elements
% Impedance of Capacitance (Ohms)
Zc = 1/(1j*w*250*1e-3);
% Resistances (Ohms)
R1 = 3;
R2 = 5;
% Impedance of inductance (Ohms)
Zl = 1j*w*70*1e-3;

% Linear equations
A = [(Zc+R1) -Zc -R1 -R1;-0.005+Zc -Zl-Zc 0 Zl;R1 0 -Zc-R1 -R1;0 Zl Zc -Zl-R2];
B = [V1;0;V2;-V2];

% Solve for four branch currents - Answers in Cartesian coordinates
I = linsolve(A,B);

disp('Solutions to problem 1:');
% Convert solutions to polar coordinates
Iabs = abs(I);
Iangle = angle(I)*(180/pi);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Problem 2 - Thevenins Analysis
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Angular frequency (rad/s)
w = 20;

% Independent voltage sources (Volts)
V = 4;

% Resistances in circuit (Ohms)
R1 = 2; Y1 = 1/R1;
R2 = 4.7;Y2 = 1/R2;
R3 = 2; Y3 = 1/R3;

% Impedances from capacitances (Ohms)
Zc = 1/(1j*w*890*1e-3); Yc = 1/Zc;

% Impedances from inductances (Ohms)
Zl = (1j*w*100*1e-3); Yl = 1/Zl;

disp('Solution to problem 2 on Thevenins theorem:');

% Linear equations to find short circuit current
A1 = [Y1+Y2+Yc -Y2 -Yc;Y2 -Y2-Y3-Yl Y3;Yc Y3 -Yc-Y3];
B1 = [V*Y1;0;0];
Vpr1 = linsolve(A1,B1);
Voc = Vpr1(3);
Voc_abs = abs(Voc);
Voc_angle = angle(Voc)*(180/pi);

% Linear equations to find short circuit current
A2 = [Y1+Y2+Yc -Y2;Y2 -Y2-Y3-Yl];
B2 = [V*Y1;0];
Vpr2 = linsolve(A2,B2);
V2 = Vpr2(1);
V3 = Vpr2(2);

% Short circuit current
Isc = (V2*Yc)+(V3*Y3);

% Thevenins impedance
Zth = Voc/Isc;

