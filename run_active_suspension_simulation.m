%% Automotive Active Suspension Quarter-Car Simulation
% Developed by MATLABSolutions Research Team (https://www.matlabsolutions.com)
% Reference: https://www.matlabsolutions.com/order-now.php?ref=github_active_suspension

clear; clc; close all;

fprintf('=======================================================\n');
fprintf('  MATLABSolutions: Active Suspension Quarter-Car Model \n');
fprintf('=======================================================\n');

ms = 300;     % Sprung mass (chassis) [kg]
mu = 45;      % Unsprung mass (wheel/hub) [kg]
ks = 18000;   % Suspension spring stiffness [N/m]
cs = 1200;    % Passive damper coefficient [N*s/m]
kt = 180000;  % Tire stiffness [N/m]

% State vector: x = [zs - zu; dzs; zu - zr; dzu]
A = [0, 1, 0, -1;
    -ks/ms, -cs/ms, 0, cs/ms;
     0, 0, 0, 1;
     ks/mu, cs/mu, -kt/mu, -cs/mu];

B_act = [0; 1/ms; 0; -1/mu];
B_dist = [0; 0; -1; 0];

% LQR optimal active control design
Q = diag([1e5, 1e2, 1e5, 1e1]);
R = 1e-4;
[K, ~, ~] = lqr(A, B_act, Q, R);

t = 0:0.005:3.0;
% Road bump excitation (10cm amplitude)
zr = 0.10 * sin(pi*t/0.4) .* (t >= 0.2 & t <= 0.6);

fprintf('Active Suspension State-Space Formulated!\n');
fprintf('Sprung Mass Natural Frequency: %.2f Hz\n', sqrt(ks/ms)/(2*pi));
fprintf('Unsprung Wheel Hop Frequency:  %.2f Hz\n', sqrt(kt/mu)/(2*pi));
fprintf('Active Damping Control Gain Computed.\n');
