# MEE 342 Gear Design Assignment: Tesla Model 3 Inspired Gear Reduction System

## Objective
Design a **spreadsheet-based spur gear design tool** and use it for two related tasks:

1. **Single-stage design:** size one spur gear–pinion pair from motor power and speed requirements using **Shigley's standard spur gear design workflow**.
2. **Two-speed gearbox design:** replace the single-stage reduction with a **shiftable two-speed gearbox**, choose **first gear and second gear ratios** that minimize **0–60 mph time**, choose the best **shift speed**, and then run the gear design from Step 1 for each selectable ratio.

The final deliverable is an **interactive spreadsheet** where a user can enter power, speed, safety factors, life, and packaging limits and receive a feasible gear design (or a clear warning that the design is infeasible).

---

## Recommended benchmark vehicle and assumptions
Use a **Tesla Model 3 rear-wheel-drive benchmark** because it is a simple single-motor EV and its public specifications are sufficiently clear for an educational design exercise.

### Baseline vehicle assumptions
Use these values as defaults in the spreadsheet, but allow the user to change them:

- Vehicle type: Tesla Model 3 RWD benchmark
- Peak motor power: **194 kW**
- Peak motor torque: **440 N·m**
- Vehicle mass: **1760 kg**
- Existing single-speed final drive ratio benchmark: **9.04:1**
- Tire size benchmark: **235/45R18**
- Approximate tire outside diameter: **0.669 m**
- Approximate rolling radius: **0.334 m**
- Drag coefficient: **0.219**
- Frontal area: **2.22 m²** (reasonable approximation from vehicle dimensions)
- Air density: **1.225 kg/m³**
- Rolling resistance coefficient: **0.010**
- Driveline efficiency per gear stage: **0.97** as a starting default
- Combined driveline efficiency for a single stage: **0.97**
- Combined driveline efficiency for two stages: **0.97² ≈ 0.941**
- Tire-road friction coefficient for hard launch estimate: **1.0**

> These are design-study values, not production-certified Tesla internal values. The spreadsheet should expose them as editable assumptions.

---

# Step 1 — Single-stage spur gear and pinion design

## Goal
Design one **spur gear–pinion pair** that meets a required speed reduction and transmits the required power and torque safely.

## What the spreadsheet must accept as user inputs
At minimum, include these inputs on a sheet called **Inputs**:

### Powertrain and duty inputs
- Input power, horsepower or kW
- Input speed, rpm
- Output speed, rpm
- Or gear ratio as an alternative input
- Design life, hours or cycles
- Daily duty cycle or equivalent service description
- Desired reliability
- Application/service factor

### Gear-design inputs
- Pressure angle, default **20°**
- Gear type: standard full-depth involute spur gears
- Minimum acceptable bending factor of safety
- Minimum acceptable contact factor of safety
- Allowable center distance or maximum package envelope
- Preferred gear material options and heat treatment options
- Gear quality number, if used in the dynamic factor model
- Target face-width multiplier range, for example **8/Pd to 16/Pd** for inch design or **8m to 16m** for metric design

### Optional but useful inputs
- User-selected minimum pinion tooth count
- User-selected diametral pitch list or module list to search
- User-selected material library entry
- User-selected efficiency assumption

---

## Required outputs for the single-stage tool
Create a sheet called **SingleStage_Results** that reports:

- Selected pinion teeth, `N_p`
- Selected gear teeth, `N_g`
- Actual ratio, `i = N_g / N_p`
- Diametral pitch `P_d` or module `m`
- Pitch diameters
- Base diameter, addendum, dedendum, whole depth
- Center distance
- Face width
- Pitch-line velocity
- Transmitted tangential force `W_t`
- Radial force `W_r`
- Bending stress for pinion and gear
- Contact stress
- Bending safety factor for pinion and gear
- Contact safety factor
- Predicted efficiency
- Pass/fail flag for packaging, stress, and safety-factor constraints

---

## Detailed Shigley-based design workflow
The spreadsheet should follow this sequence.

### 1. Determine the target ratio
If the user provides input and output speed,

```text
i_target = n_in / n_out
```

If the user provides one speed and the ratio, compute the missing speed.

### 2. Compute the transmitted torque
For shaft torque,

```text
T_in = 9550 * P_kW / n_in      (N·m)
```

or in U.S. customary form,

```text
T_in = 63025 * HP / rpm        (lb·in)
```

Then compute the tangential tooth load once a tentative pitch diameter is selected:

```text
W_t = 2 * T_in / d_p
```

### 3. Choose an initial pinion tooth count
Use a practical starting range such as:

- `N_p = 18 to 28` for 20° full-depth involute gears

Then compute:

```text
N_g = round(i_target * N_p)
i_actual = N_g / N_p
```

Keep the actual ratio close to the target ratio.

### 4. Search feasible diametral pitch or module values
For each candidate `P_d` or `m`, compute:

```text
d_p = N_p / P_d
d_g = N_g / P_d
C = (d_p + d_g)/2
```

or metric equivalent:

```text
d_p = m * N_p
d_g = m * N_g
C = (d_p + d_g)/2
```

Reject any design exceeding package or center-distance limits.

### 5. Estimate pitch-line velocity
```text
V = pi * d_p * n_p / 12        (ft/min, if d_p in inches)
```

or metric equivalent.

### 6. Compute AGMA/Shigley stress quantities
Use Shigley's spur gear framework and calculate the standard modifiers.

#### Bending stress
```text
sigma_b = W_t * K_o * K_v * K_s * P_d * K_m * K_B / (F * J)
```

#### Contact stress
```text
sigma_c = C_p * sqrt((W_t * K_o * K_v * K_s * K_m) / (F * I * d_p))
```

The spreadsheet should include the following factors explicitly:

- `K_o` overload factor
- `K_v` dynamic factor
- `K_s` size factor
- `K_m` load-distribution factor
- `K_B` rim-thickness factor
- `J` bending geometry factor
- `I` pitting resistance geometry factor
- `C_p` elastic coefficient

For a course spreadsheet, it is acceptable to implement `J` and `I` using:

- table lookup,
- interpolation from instructor-provided values,
- or user-entered values if exact AGMA geometry tables are unavailable.

The spreadsheet must clearly label any factor that is approximate or user-supplied.

### 7. Compute allowable stresses and safety factors
From material and hardness selection, determine:

- allowable bending stress number
- allowable contact stress number
- life factor
- temperature factor
- reliability factor

Then compute design safety factors:

```text
n_b = sigma_allow_b / sigma_b
n_c = sigma_allow_c / sigma_c
```

### 8. Iterate until a feasible design is found
Iterate over:

- pinion tooth count
- diametral pitch or module
- face width
- material / heat treatment

until all of the following are satisfied:

- ratio error is acceptable
- center distance is acceptable
- bending safety factors exceed targets
- contact safety factor exceeds target
- face width is practical
- pinion tooth count avoids undercut and poor manufacturability

### 9. Rank feasible designs
The spreadsheet should rank feasible solutions by a score such as:

```text
Score = w1*(mass) + w2*(center distance) + w3*(stress margin penalty) + w4*(manufacturing penalty)
```

A simpler alternative is to sort by:

1. smallest center distance,
2. then lowest mass,
3. then largest minimum safety factor margin.

---

## Recommended spreadsheet structure for Step 1
Use these tabs:

### `Inputs`
All user-entered quantities, units, dropdowns, and design targets.

### `Materials`
Material library containing:

- material name
- heat treatment
- Brinell hardness or surface hardness
- allowable bending stress number
- allowable contact stress number
- elastic modulus / Poisson ratio if needed
- density
- cost multiplier, optional

### `AGMA_Factors`
Lookup tables or user-entry areas for:

- `K_o`
- `K_v`
- `K_s`
- `K_m`
- `K_B`
- `J`
- `I`
- life factors
- reliability factors
- temperature factors

### `SingleStage_Search`
Candidate-design search table with one row per design candidate.

### `SingleStage_Results`
Clean presentation of the chosen design.

---

# Step 2 — Shiftable two-speed gearbox optimized for fastest 0–60 mph

## Goal
Replace the single-stage reduction with a **shiftable two-speed gearbox**. Instead of splitting one overall ratio into two permanently engaged stages, the spreadsheet must choose:

- a **low gear ratio** `G_low` for launch,
- a **high gear ratio** `G_high` for acceleration after the shift,
- and the **shift speed** (or shift motor speed)

so that the vehicle reaches **60 mph in the shortest possible time**.

After the optimal ratios are chosen, design the actual gear pairs for:

- **First gear**
- **Second gear**

using the same Shigley-based spur gear workflow from Step 1.

---

## Important interpretation
This assignment should now treat Step 2 as a **shiftable gearbox**, not a two-stage fixed reduction. That means:

- the gearbox has **two selectable ratios**, not one overall ratio split across two constant meshes,
- the vehicle launches in **first gear**,
- at some optimal shift point it shifts to **second gear**,
- and the 0–60 time includes both acceleration segments and an assumed shift delay.

A practical architecture for the spreadsheet is a **two-speed layshaft gearbox** or equivalent conceptual two-speed spur-gear transmission. The spreadsheet does **not** need to fully design synchronizers, dog clutches, bearings, or shift forks unless the user later asks for that. The main requirement is ratio selection, performance modeling, and spur gear sizing for the two selectable gear pairs.

---

## Vehicle longitudinal model to use
Create or update the sheet called **Acceleration_Model** and compute acceleration from:

```text
F_net = F_drive - F_drag - F_roll
```

where

```text
F_drag = 0.5 * rho * C_d * A * v^2
F_roll = C_rr * m_vehicle * g
```

and the drive force is limited by both **motor capability** and **traction**:

```text
F_drive = min(F_motor_wheels, F_traction_limit)
```

### Traction limit
```text
F_traction_limit = mu * m_vehicle * g
```

### Wheel and motor speed relationship
For the currently engaged gear ratio `G`,

```text
omega_wheel = v / r_w
omega_motor = G * omega_wheel
```

### Simple motor model
Use a Tesla-inspired piecewise motor model:

- constant torque up to base speed
- constant power above base speed

```text
omega_base = P_peak / T_peak
```

Then:

```text
T_motor = T_peak                      if omega_motor <= omega_base
T_motor = P_peak / omega_motor        if omega_motor > omega_base
```

Wheel force in the currently engaged gear:

```text
F_motor_wheels = eta_G * G * T_motor / r_w
```

Acceleration:

```text
a = F_net / m_vehicle
```

Integrate forward in time until `v = 60 mph`.

---

## Shifted 0–60 simulation
The spreadsheet must evaluate a **two-segment acceleration problem**.

### Segment 1 — First gear
Accelerate from rest using `G_low` until the chosen shift point is reached.

### Shift event
At the shift point:

- vehicle speed is unchanged during the shift,
- motor speed drops according to the ratio change,
- add a small fixed **shift delay** to elapsed time.

Use a default educational assumption such as:

```text
t_shift = 0.20 s
```

but expose it as an editable input.

### Segment 2 — Second gear
Continue acceleration with `G_high` until 60 mph is reached.

Total time is:

```text
t_0_60 = t_first_gear + t_shift + t_second_gear
```

---

## Optimization variables for Step 2
The spreadsheet should vary:

- `G_low` = first gear ratio
- `G_high` = second gear ratio
- `v_shift` or `omega_shift` = shift point

with the constraints:

```text
G_low > G_high
```

and both must be practical for a two-speed EV gearbox.

### Suggested search ranges
Use reasonable defaults such as:

- `8.0 <= G_low <= 16.0`
- `4.0 <= G_high <= 10.0`
- `0 < v_shift < 60 mph`
- or equivalently search over motor shift speed

### Practical design preferences
- First gear should maximize launch force without causing excessive traction saturation far beyond what the tires can use.
- Second gear should keep the motor in a favorable region after the shift and still allow reaching 60 mph without another shift.
- The shift should occur near the speed where staying in first gear becomes less beneficial than shifting to second gear.

A very useful rule in the spreadsheet is to compare wheel force in each gear at the same vehicle speed. The force-optimal shift is near the speed where:

```text
F_wheel,1(v) ≈ F_wheel,2(v)
```

subject to the shift delay penalty. Because a real shift costs time, the true optimal shift may occur slightly after the pure equal-wheel-force crossing.

---

## Recommended computational method
Create a sheet called **TwoSpeed_Search**. Each row should contain one candidate design with:

- `G_low`
- `G_high`
- `v_shift`
- predicted `t_0_60`
- peak motor speed in first gear by 60 mph
- post-shift motor speed
- traction-limited flag
- feasibility flag

A simple search strategy is:

1. Loop `G_low` over a practical range.
2. Loop `G_high` over a practical range with `G_high < G_low`.
3. For each ratio pair, loop over shift speed or shift motor speed.
4. Run the two-segment acceleration simulation.
5. Save the shortest 0–60 time among feasible cases.

---

## Reasonable educational result for the Tesla benchmark
Using the benchmark assumptions in this assignment, a reasonable expectation is that:

- **First gear** should be noticeably shorter than Tesla's existing single-speed reduction to improve launch.
- **Second gear** should be closer to the current single-speed value so that the motor does not overspeed before 60 mph and remains effective after the shift.

A good educational starting point is:

```text
G_low  ≈ 13 to 15
G_high ≈ 7 to 9
```

with the optimal shift often occurring somewhere in the neighborhood of **25 to 40 mph**, depending on the exact assumptions for:

- motor torque and power curve
- traction coefficient
- shift delay
- tire radius
- drag and rolling resistance

These are not claimed to be Tesla production values. They are plausible starting points for a simplified launch-performance optimization.

### Suggested default ratios for the spreadsheet
Use these as **default initial guesses**, then let the spreadsheet optimize around them:

- `G_low = 14.0`
- `G_high = 8.0`
- `t_shift = 0.20 s`

The actual best values should be determined by the spreadsheet search, not hard-coded.

---

## How to choose actual tooth counts for the two-speed gearbox
Once the optimizer identifies `G_low` and `G_high`, choose integer tooth counts for each selectable gear pair.

### First gear
```text
G_low = N_g1 / N_p1
```

### Second gear
```text
G_high = N_g2 / N_p2
```

Use practical pinion tooth counts and round gear tooth counts to match the target ratios while still respecting:

- undercut avoidance
- center-distance limits
- bending and contact stress limits
- manufacturability

### Example near-target combinations
If the optimizer lands near:

```text
G_low  ≈ 14.0
G_high ≈ 8.0
```

then possible starter tooth-count choices could be:

- First gear: `N_p1 = 18`, `N_g1 = 252`  → `G_low = 14.00`
- Second gear: `N_p2 = 20`, `N_g2 = 160` → `G_high = 8.00`

Those exact values may be too large for packaging in a direct single-pair implementation. Therefore, the spreadsheet should treat them only as ratio examples, not final geometry. In practice, if package size becomes excessive, you should either:

- allow the user to choose a larger pinion and smaller ratio compromise,
- add a separate fixed final drive outside the shiftable gearbox,
- or explicitly note that a one-pair-per-gear architecture may not fit the package and that a compound transmission architecture would be more realistic.

For this assignment, the important point is that the spreadsheet converts optimized ratios into actual integer tooth counts and then checks feasibility.

---

## How to run the gear design after optimization
After the acceleration model chooses the optimal two-speed gearbox parameters, do the following:

1. Select the best `G_low`, `G_high`, and `v_shift`.
2. Design **first gear** as a spur gear pair using the Step 1 method.
3. Design **second gear** as a second spur gear pair using the Step 1 method.
4. Evaluate each gear pair at the torque and speed it sees in service.
5. Report both gear designs and the overall gearbox performance.

### Gear-specific loading cases
#### First gear loading case
First gear should be checked at the most severe launch condition, typically near peak motor torque and low vehicle speed:

```text
n_1,in = n_motor during launch
T_1,in = T_motor during launch
```

Because first gear multiplies torque the most, it is often the **critical strength case**.

#### Second gear loading case
Second gear should be checked at the worst torque-speed combination it experiences after the shift:

```text
n_2,in = motor speed immediately after shift and through the rest of the run
T_2,in = corresponding motor torque
```

Second gear usually carries lower multiplication than first gear, but it may still be critical if it operates at higher pitch-line velocity or if packaging drives smaller teeth.

### Efficiency handling
Use per-gear efficiency assumptions such as:

```text
eta_1 = 0.97
eta_2 = 0.97
```

Then the active wheel force uses the efficiency of the currently engaged gear only. Do **not** multiply them together during the 0–60 simulation because only one selectable ratio is engaged at a time.

---

## Required outputs for the two-speed tool
Create a sheet called **TwoStage_Results** or rename it to **TwoSpeed_Results**. It should report:

- optimized first gear ratio for minimum 0–60 time
- optimized second gear ratio for minimum 0–60 time
- optimal shift speed or motor shift speed
- assumed shift delay
- estimated 0–60 time for the original single-speed baseline
- estimated 0–60 time for the optimized two-speed gearbox
- first-gear tooth counts, pitch diameters, center distance, face width, stresses, safety factors
- second-gear tooth counts, pitch diameters, center distance, face width, stresses, safety factors
- post-shift motor speed
- peak motor speed reached by 60 mph
- warning if either gear pair fails stress or package limits

---

## Recommended spreadsheet structure for Step 2
The following tabs are recommended:

### `Acceleration_Model`
Contains the vehicle model, drag, rolling resistance, traction limit, motor model, and time integration.

### `TwoSpeed_Search`
Contains candidate combinations of `G_low`, `G_high`, and `v_shift` with predicted 0–60 times.

### `TwoSpeed_Results`
Clean presentation of the selected ratio pair, shift point, performance comparison, and actual gear design summary.

If you want to keep the old tab name `TwoStage_Results` for consistency, clearly label it as a **two-speed shiftable gearbox** result sheet, not a fixed two-stage reduction sheet.


# Deliverable requirements
The final spreadsheet should contain at least these sheets:

1. `Inputs`
2. `Materials`
3. `AGMA_Factors`
4. `SingleStage_Search`
5. `SingleStage_Results`
6. `Acceleration_Model`
7. `TwoSpeed_Search`
8. `TwoSpeed_Results`

Optional but recommended:

9. `Charts`
10. `Units_and_Assumptions`

---

## Minimum charts to include
Include plots for:

- motor torque vs motor speed
- motor power vs motor speed
- tractive force vs vehicle speed for several candidate total ratios
- net acceleration vs vehicle speed
- cumulative 0–60 time vs candidate total ratio
- bending and contact safety factors for the selected design

---

## Recommended design notes to include in the spreadsheet
Add a notes block that explains:

- this is a **Shigley/AGMA preliminary design tool**, not a final production gearbox design
- gear geometry factors may be approximate if exact AGMA tables are unavailable
- bearings, shafts, lubrication, thermal limits, NVH, and housing stiffness are not fully covered in this version
- the 0–60 optimization is simplified and focuses on acceleration, not full drive-cycle efficiency or top-speed certification

---

## Suggested grading emphasis
A strong submission should:

- use a clean and traceable Shigley workflow
- make all assumptions visible
- keep units consistent
- separate user inputs from formulas
- clearly identify approximate lookup factors
- compare the original Tesla-like single-stage ratio to the optimized two-stage fixed reduction
- demonstrate that each stage is re-designed with the gear tool rather than only splitting the ratio numerically

---

## References and source basis
Use the following as the basis for the benchmark values and methodology:

1. Tesla Model 3 specifications page and owner documentation for current dimensions and vehicle information.
2. Argonne National Laboratory public vehicle database for a representative Model 3 final drive ratio benchmark.
3. Public specification aggregators for approximate current Model 3 RWD peak power, peak torque, mass, tire size, and top-speed values.
4. Shigley's Mechanical Engineering Design for the spur gear design method and AGMA-style stress framework.

Recommended default citations in a written report:

- Tesla Model 3 official website and owner manual
- Argonne National Laboratory D3 vehicle summary for Tesla Model 3
- Shigley, *Mechanical Engineering Design*

