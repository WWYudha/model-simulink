% total spacecraft mass
m_sc = 680; % kg

% Hub mass
m_hub = 644; % kg

% wheel mass
m_rw = [12 12 12]; % kg
m_rw_1 = m_rw(1);
m_rw_2 = m_rw(2);
m_rw_3 = m_rw(3);

% force
F = [0;0;0]; % N

% wheel CoM offset
d = 0.4E-6; % m
d_1 = d;
d_2 = d;
d_3 = d;


% wheel location vector
r_W1_B = [0.6309; -0.1691; 0.4619]; % m
r_W2_B = [-0.1691; 0.6309; 0.4619]; % m
r_W3_B = [-0.4619; -0.4619; 0.4619]; % m

% hub CoM location w.r.t. B
r_Bc_B = [1e-2; -2e-2; 10e-2]; % m

% wheel torque
u_s = [0 0 0]; % N.m
u_s_1 = u_s(1);
u_s_2 = u_s(2);
u_s_3 = u_s(3);

% hub inertia tensor about hub CoM
I_hub_Bc = [550 0.1045 -0.0840; 0.1045 650 0.0001; -0.0840 0.0001 650]; % kg.m^2

% wheel inertia tensor about wheel CoM
U_d = 1.54E-10;
I_rw_Wc = [1.5915E-4 0 U_d; 0 0.8594E-4 0; U_d 0 0.8594E-4]; % kg.m^2
I_rw1_Wc1 = [1.5915E-4 0 U_d; 0 0.8594E-4 0; U_d 0 0.8594E-4]; % kg.m^2
J_11_1 = I_rw1_Wc1(1,1);
J_12_1 = I_rw1_Wc1(1,2);
J_13_1 = I_rw1_Wc1(1,3);
J_22_1 = I_rw1_Wc1(2,2);
J_23_1 = I_rw1_Wc1(2,3);
J_33_1 = I_rw1_Wc1(3,3);

I_rw2_Wc2 = [1.5915E-4 0 U_d; 0 0.8594E-4 0; U_d 0 0.8594E-4]; % kg.m^2
J_11_2 = I_rw2_Wc2(1,1);
J_12_2 = I_rw2_Wc2(1,2);
J_13_2 = I_rw2_Wc2(1,3);
J_22_2 = I_rw2_Wc2(2,2);
J_23_2 = I_rw2_Wc2(2,3);
J_33_2 = I_rw2_Wc2(3,3);

I_rw3_Wc3 = [1.5915E-4 0 U_d; 0 0.8594E-4 0; U_d 0 0.8594E-4]; % kg.m^2
J_11_3 = I_rw3_Wc3(1,1);
J_12_3 = I_rw3_Wc3(1,2);
J_13_3 = I_rw3_Wc3(1,3);
J_22_3 = I_rw3_Wc3(2,2);
J_23_3 = I_rw3_Wc3(2,3);
J_33_3 = I_rw3_Wc3(3,3);

I_rw1_Wc1_ = [0 -J_13_1 J_12_1; -J_13_1 (-2*J_23_1) (J_22_1-J_33_1); J_12_1 (J_22_1-J_33_1) (-2*J_23_1)]; % kg.m^2
I_rw2_Wc2_ = [0 -J_13_2 J_12_2; -J_13_2 (-2*J_23_2) (J_22_2-J_33_2); J_12_2 (J_22_2-J_33_2) (-2*J_23_2)]; % kg.m^2
I_rw3_Wc3_ = [0 -J_13_3 J_12_3; -J_13_3 (-2*J_23_3) (J_22_3-J_33_3); J_12_3 (J_22_3-J_33_3) (-2*J_23_3)]; % kg.m^2

% Initial condition
% initial position
r_BN = [0;0;0]; % m

% initial velocity
r_dot_BN = [0;0;0]; % m/s

% initial angular velocity
omega = 0; % rad/s
omega_BN = [omega ; omega; omega];

% modified rodrigues parameter
sigma = 0; % rad
sigma_BN = [sigma; sigma; sigma];

% initial wheel speed
% OMEGA = [-558 -73 242]; RPM
OMEGA = [-58.43362 -7.64456 25.34224]; % rad/s
OMEGA_1 = OMEGA(1);
OMEGA_2 = OMEGA(2);
OMEGA_3 = OMEGA(3);


% wheel orientation matriks
g_s = [0.7887 -0.2113 -0.5774; -0.2113 0.7887 -0.5774; 0.5774 0.5774 0.5774];

% RW 1
C_1 = [0.7887 -0.2113 -0.5774; -0.2113 0.7887 -0.5774; 0.5774 0.5774 0.5774];
g_s_1 = C_1(1:3,1);
w_2_1 = C_1(1:3,2);
w_3_1 = C_1(1:3,3);

% RW 2
C_2 = [-0.2113 -0.5774 0.7887; 0.7887 -0.5774 -0.2113; 0.5774 0.5774 0.5774];
g_s_2 = C_2(1:3,1);
w_2_2 = C_2(1:3,2);
w_3_2 = C_2(1:3,3);

% RW 3
C_3 = [-0.5774 0.7887 -0.2113; -0.5774 -0.2113 0.7887; 0.5774 0.5774 0.5774];
g_s_3 = C_3(1:3,1);
w_2_3 = C_3(1:3,2);
w_3_3 = C_3(1:3,3);

% matriks identitas
I = [1 0 0;0 1 0;0 0 1];