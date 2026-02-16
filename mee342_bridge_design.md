---
layout: default
title: MEE342 Bridge Design 2026
---

<img src="/_images/mechdesign/Mathematical_Bridge.jpg" alt="Drawing" style="height: 400px;"/> 


# ANSYS Bridge Design Activity 2026

You will design a lightweight pedestrian bridge and verify it using ANSYS.

---

## 1. Model setup

* Element types: Frame: **BEAM188 only**, Deck: **SHELL181 only**

* Deck geometry: **Span:** 15.0m, **Deck width:** 3.0m, **Deck thickness:** 8mm

* Deck mesh element size: 0.25m across the deck

* The deck must be a complete shell surface covering the entire 15.0m × 3.0m footprint (no gaps/holes).

---

## 2. Deck support and beam–deck connection

You must provide beams that actually support the deck. Most real bridges use interior support lines. You are encouraged to include beams that support the deck area. When connecting beams and the deck, **use shared nodes, do not use contacts.**

### How to do it
1. Create the deck shell surface.
2. **Mesh the deck first** (0.25m size).
3. Create your beam lines directly on the deck surface (beam centerlines lie in the same plane as the deck midsurface).
4. Mesh the beams so **beam nodes coincide with deck shell nodes** along the support lines.

---

## 3. Beam-to-beam joints

If two beams meet or cross, they must be **connected**:
- Ensure beam lines intersect and the mesh creates a **shared node** at the intersection.
- Model joints as **fully connected (rigid/continuous) joints** by default.  
  No special bolt/weld/pin flexibility modeling is required.

---

## 4. Design objective

**Minimize total mass** of the entire bridge (beams + deck).

---

## 5. Loads (apply to the deck shell top face)

Use global axes with **+Z upward**.

- Gravity (self-weight): ON
- Uniform pedestrian pressure:
  $
  q = 5.0\ \text{kN/m}^2 \quad \text{downward (−Z)}
  $

---

## 6. Boundary conditions (supports)

Use **simply supported** conditions:

- **Left support (pin):** constrain $U_x = U_y = U_z = 0$ at the left abutment end region.
- **Right support (roller):** constrain $U_y = U_z = 0$.

> Apply constraints to a small set of end nodes/area—not a single node.

---

## 7. Material + performance limits (steel-only)

Use the default **structural steel** in ANSYS.

Your design must satisfy all of the following:

1. **Strength (static):** The maximum Von Mises stress must be no larger than 160MPa: $\sigma_{vM,\max} \le 160\ \text{MPa}$
2. **Deflection (static):** The maximum deflection of the deck must be no larger than 37.5mm along Z-direction: $\delta_{\max} \le \frac{L}{400} = 37.5\ \text{mm}$
3. **Vibration (modal):** The 1st natural frequency must be greater than 3Hz: $f_{1,\text{vertical}} \ge 3.0\ \text{Hz}$

---

## 8. What to submit

- A screenshot showing **full deck shell coverage** and **0.25 m mesh**.
- Results table: **mass**, $\sigma_{vM,\max}$, $\delta_{\max}$, $f_{1,\text{vertical}}$.
- One plot of **deformed shape** and one plot of **von Mises stress**.
<!-- - The standard model file (.stp) exported from ANSYS EnSight.  -->


<script>
  window.MathJax = {
    tex: { inlineMath: [['$', '$'], ['\\(', '\\)']] }
  };
</script>
<script defer src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-chtml.js"></script>