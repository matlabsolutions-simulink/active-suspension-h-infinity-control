# Automotive Active Suspension 2-DOF Quarter-Car with H-Infinity Robust Control

[![MATLAB](https://img.shields.io/badge/MATLAB-R2023b%20%7C%20R2024b-0076A8?logo=mathworks&logoColor=white)](https://www.mathworks.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Domain](https://img.shields.io/badge/Domain-Automotive%20Engineering%20&%20Robust%20Control-lightgrey.svg)](#)

A standalone MATLAB implementation of Automotive Active Suspension 2-DOF Quarter-Car with H-Infinity Robust Control. Includes the governing dynamics, analytical formulations, and an executable script you can run directly without proprietary third-party dependencies.

## Overview

This repository simulates a 2-DOF quarter-car automotive suspension system. It compares a passive damper against an active hydraulic actuator under road disturbance inputs to evaluate ride comfort and road holding.

## Governing Equations & Mathematical Formulation

### Equations of Motion (Quarter-Car 2-DOF)

$$
m_s \ddot{z}_s + c_s (\dot{z}_s - \dot{z}_u) + k_s (z_s - z_u) = u_{\text{act}}
$$

$$
m_u \ddot{z}_u + c_s (\dot{z}_u - \dot{z}_s) + k_s (z_u - z_s) + k_t (z_u - z_r) = -u_{\text{act}}
$$

where $m_s$ is the sprung mass, $m_u$ is the unsprung mass, $k_s$ is spring stiffness, $c_s$ is the damping coefficient, $k_t$ is tire stiffness, and $z_r$ is road bump displacement.

## Getting Started

### Prerequisites
- MATLAB (tested on R2022b through R2024b)
- Standard base MATLAB installation (no paid external toolboxes required for this starter script)

### Running the Code
1. Clone the repository:
   ```bash
   git clone https://github.com/matlabsolutions-simulink/active-suspension-h-infinity-control.git
   cd active-suspension-h-infinity-control
   ```
2. Open MATLAB, navigate to the cloned folder, and run:
   ```matlab
   run_active_suspension_simulation
   ```

## Need the Complete Simulink or Simscape Model?

If you are working on a university capstone, thesis, or lab assignment and need the complete `.slx` model with Simscape physical networks, custom parameter lookup tables, or automated test harnesses, our team at [MATLABSolutions.com](https://www.matlabsolutions.com/order-now.php?ref=github_active_suspension_h_infinity_control) provides custom academic simulation and consulting support.

## Technical Inquiries & Contact
- Website: [matlabsolutions.com](https://www.matlabsolutions.com)
- Custom Consulting Portal: [matlabsolutions.com/order-now.php](https://www.matlabsolutions.com/order-now.php)
- Email: info@matlabsolutions.com

## License
This project is open-source under the [MIT License](LICENSE).
