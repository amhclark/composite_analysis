% Aidan Clark, ME8604, amhclark@mun.ca
% Memorial University of Newfoundland
% Faculty of Engineering & Applied Science

clear
close all
clc

N = 10;                 % Number of Layers
E1 = 100;               % Modulus of Elasticity
E2 = 100;
nu_12 = 0.25;           % Poisson's Ratio
nu21 = (E2*nu_12)/E1;
G12 = 100;              % Bulk Modulus

theta = [theta1, theta2, theta3, theta4];
thick = [t1, t2, t3, t4];

a = zeros(3,3);         % Init A Matrix
b = zeros(3,3);         % Init B Matrix
d = zeros(3,3);         % Init D Matrix


s11 = 1/E1; s22 = 1/E2; s66 = 1/G12;
s12 = -nu_12/E1; 
s21 = s12;

q11 = inv(s11); q22 = inv(s22); q66 = inv(s66);
q12 = inv(s12); q21 = q12;


c = cos(theta);
s = sin(theta);

q11_bar = q11*c^4 + q22*s^4 + (2*q12 + 4*q66)*c^2*s^2;
q12_bar = (q11 + q22 - 4*q66)*c^2*s^2 + q12*(c^4+s^4);
q22_bar = q11*s^4 + q22*c^4 + (2*q12 + 4*q66)*c^2*s^2;
q66_bar = (q11 + q22 - 2*q12 - 2*q66)*c^2*s^2 + q66*(c^4 + s^4);
q16_bar = (q11 - 2*q66 - q12)*c^3*s - (q22 - q12 - 2*q66)*c*s^3;
q26_bar = (q11 - 2*q66 - q12)*c*s^3 - (q22 - q12 - 2*q66)*c^3*s;

% A Matrix Calculation
% for i = 1:N
%     a = 
% end

% B Matrix Calculation


% D Matrix Calculation