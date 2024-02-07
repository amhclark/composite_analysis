% Aidan Clark, ME8604, amhclark@mun.ca
% Memorial University of Newfoundland
% Faculty of Engineering & Applied Science

clear
close all
clc

% N = 10;               % Number of Layers
E1 = 133.44;            % Modulus of Elasticity
E2 = 8.78;
nu_12 = 0.26;           % Poisson's Ratio
nu21 = (E2*nu_12)/E1;
G12 = 3.254;            % Bulk Modulus

theta = deg2rad(45);
thick = 0;

% Init A,B,D
a = zeros(3,3);
b = zeros(3,3);
d = zeros(3,3);


% Compliance Matrix [S]
s11 = 1/E1; s22 = 1/E2; s66 = 1/G12;
s12 = -nu_12/E1; 
s21 = s12;

s_matrix = [s11 s12 0;
            s21 s22 0;
            0   0   s66];


% Stiffness Matrix [Q]
q_matrix = inv(s_matrix);

q11 = q_matrix(1,1);
q12 = q_matrix(1,2);
q21 = q12;
q22 = q_matrix(2,2);
q66 = q_matrix(3,3);


% Calculation of Stiffness Coefficients
c = cos(theta);
s = sin(theta);

q11_bar = q11*c^4 + q22*s^4 + (2*q12 + 4*q66)*c^2*s^2;
q12_bar = (q11 + q22 - 4*q66)*(c^2)*(s^2) + q12*(c^4+s^4);
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