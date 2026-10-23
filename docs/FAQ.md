# Active Suspension H Infinity Control — Engineering FAQ & Troubleshooting

> Verified solutions to real student and researcher laboratory inquiries.

### Q: How to select performance and uncertainty weighting functions (W1, W2, W3) for H-Infinity active suspension synthesis?

**Verified Technical Solution:**

In automotive active suspension $H_\infty$ synthesis (using MATLAB's `hinfsyn`), proper selection of frequency weighting filters is critical for achieving the Pareto trade-off between ride comfort and road holding:

1. **Ride Comfort Weighting Filter ($W_{\text{perf}}$):**
   Human sensitivity to vertical vibration peaks between 4 Hz and 8 Hz (ISO 2631 standard). Model $W_1(s)$ as a band-pass or high-gain low-frequency weighting on sprung mass acceleration $\ddot{z}_s$:
   $$W_1(s) = \frac{s^2 + 2 \zeta_1 \omega_1 s + \omega_1^2}{s^2 + 2 \zeta_2 \omega_2 s + \omega_2^2}$$

2. **Actuator Effort Weighting Filter ($W_{\text{act}}$):**
   To prevent hydraulic or electromagnetic actuator saturation at high frequencies, choose a high-pass filter for control force $u$:
   $$W_2(s) = \frac{s + \omega_{act}/M_u}{\epsilon s + \omega_{act}}$$
   where $M_u$ bounds high-frequency control gain.

3. **MATLAB Synthesis Workflow:**
   ```matlab
   % Augment plant with weighting filters
   systemnames = 'plant W1 W2';
   inputvar = '[ r; w; u ]';
   outputvar = '[ W1; W2; y ]';
   sys = sysic;
   [K, CL, gamma] = hinfsyn(sys, nmeas, nctrl);
   ```

Explore robust control models and automotive benchmarks at https://www.matlabsolutions.com/projects/automotive-simulation.php.

---

