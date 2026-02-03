---
layout: default
title: MEE342 Project Guideline 2026
---

# MEE342 Course Project Guideline (v1.1)

## 1. Project Overview

In this semester-long team project, you will study, model, document, 3D print, and test a functional prototype of an existing mechanical system. Acceptable system should satisfy the following criteria:

**Functionality:** The system should consist multiple functional components/parts and its functionality is realized through *mechanical* interactions among the parts, e.g., gear train, cam-follower, linkage, differential, ratchet, clutch.

**Modeling feasibility:** The components/parts are standard so that their design principles have been documented.

**Building feasibility:** The prototype does not need to operate at full size, speed, or load. It must, however, clearly demonstrate the core mechanical function at a reduced, safe scale.

Example mechanical systems include but are not limited to:

### 1. Power transmission and drivetrain systems
- Gear transmissions and gearboxes for small vehicles, robots, or power tools
- Human-powered drivetrain systems (e.g., bicycle or cargo bike drivetrains, hand-crank mechanisms, rowing or pedal drives)
- Chain/sprocket or belt drive systems for conveyors, lifts, or compact machinery

### 2. Mechanisms coupled to electric or combustion motors (focus here is on the mechanical components, not motor electromagnetics or combustion thermodynamics):
- Gearheads and reduction drives coupled to standard electric motors (e.g., robotic actuators, winch drives)
- Mechanical cooling fans and their housings, guards, and mounts for motors
- Starter and accessory drive mechanisms around an internal combustion engine (e.g., timing gear/chain drive, valve train, or balance shaft system)

### 3. Motion conversion and indexing mechanisms
- Crank–slider or Scotch yoke mechanisms for pumps, compressors, or reciprocating devices
- Cam–follower systems (e.g., valve trains, mechanical presses, pick-and-place mechanisms)
- Geneva drives or other indexing mechanisms used for intermittent motion (e.g., film advance, rotary indexing tables)
- Ratchet-and-pawl mechanisms for winches, hoists, or hand tools

### 4. Everyday product mechanisms
- Adjustable office chair height/tilt mechanisms and locking systems
- Car door latches, trunk latches, or window regulators
- Seat track and recliner mechanisms from automotive seating
- Combination locks, padlocks, or safe locks (focusing on the internal mechanism)

### 5. Historical and classical mechanical systems
- Mechanical clock or watch gear trains and escapement mechanisms
- Steam engine linkages (e.g., Watt governor, valve gear, or crosshead/connecting rod systems)
- Early mechanical calculators, counters, or adding machines (a reduced, manageable subsystem)
- Mechanical music devices (e.g., a small segment of a music box drive or player-piano action)

### 6. Folding, deployable, and origami-inspired systems
- Origami or compliant mechanisms for deployable structures (e.g., foldable shelters, solar panel arrays, stowable furniture joints)
- Hinged or multi-linkage folding mechanisms (e.g., laptop hinges, fold-out steps, compact storage systems)

For safety and policy reasons, weapons, weapon-like mechanisms, or potentially harmful devices are strictly prohibited. This includes firearms or firearm components, explosive devices, projectile weapons, and any object that could reasonably be interpreted as a weapon or used to harm others. ASU 3D Print Lab also reserves the right to reject parts that are unsafe, harmful, or violate university policy. Choose systems that are clearly aligned with safe, educational mechanical applications.

The project emphasizes:
- Understanding conceptual design of real mechanisms through reverse engineering
- Building detailed CAD assemblies
- Understanding design decisions via failure mode and manufacturability analysis
- Practicing effective ways for communicating complex engineering decisions

You will progress through three phases, each with a deliverable deadline:
- **Phase 1 due on Feb. 02** – System understanding and conceptual design
- **Phase 2 due on Mar. 16** – Detailed CAD design and engineering analysis
- **Phase 3 due on Apr. 27** – Prototyping, testing and reflection

## 2. Learning Objectives

By the end of the project you should be able to:
- Decompose a mechanical system into functional components/parts.
- Identify potential failure modes and explain design decisions to mitigate them (static failure, fatigue, wear, misalignment, buckling, etc.).
- Develop detailed CAD models and assemblies representing realistic geometry and motion.
- Justify geometric and material design choices using mechanics of materials, machine design principles, and 3D printing constraints.
- Plan and execute an iterative 3D-print-based prototyping and testing process.
- Communicate effectively in written reports, short videos, and poster presentations.
- Work effectively in a six-person team, managing tasks, deadlines, and conflict.

## 3. Team Structure and Roles

- **Team size:** 6 students.
- **Team assignment:** Teams are self-formed in the first class based on students' interest.

## 4. Timeline and Major Milestones

- **Phase 1 due:** Monday, Feb 2
- **Phase 2 due:** Monday, Mar 25
- **Phase 3 due:** Monday, Apr 27
- **Poster session:** Wednesday, Apr 29.

The FSE 3D Print Lab processing time is typically at least 5 business days (~1 week) from receipt of a print request, and can extend to 2–20 business days in busy periods; students are strongly advised to submit prints at least 10 days before project deadlines.

## 5. Deliverable Formats

### 5.1 GitHub repository

Each team will maintain a GitHub repository as the primary home for all project materials.

Minimum structure (subject to refinement):
- **README.md** – serves as the main report, written in Markdown; it should link to section-specific markdown files if needed (e.g., phase1.md, phase2.md, phase3.md).
- **/figures/** – images used in the report (diagrams, CAD screenshots, photos, etc.).
- **/videos/** – links or text files pointing to hosted videos (e.g., YouTube links).
- **/cad/** – exported CAD files in neutral formats (STEP, STL).
- **/analysis/** – calculations, spreadsheets, scripts, or summaries of FEA/motion analyses.

Markdown on GitHub allows you to:
- Embed figures and GIFs directly in the report.
- Keep version history of changes.
- Share a single link that the instructor and peers can access easily (and potentially analyze with AI tools in the future).
- Control intellectual property of your project.

Report content is graded on technical quality and clarity. Repos should be reasonably organized and navigable.

### 5.2 Video submissions

For each phase, submit a 5-minute YouTube video that summarizes your report.

### 5.3 Poster

The final poster is 24" × 36" in size and should summarize the entire project (Phases 1–3). More details to follow.

## 6. Project Phases and Required Work

### Phase 1 – System Understanding & Conceptual Design (Due: Feb 02)

**Goal:** Demonstrate a solid understanding of how your system works, its key parts and mechanisms, and how it can fail.

#### 6.1.1 Technical tasks

**System function and decomposition**
- Describe the overall function and typical operating conditions.
- Break the system into subsystems and list key components (gears, shafts, bearings, housings, couplings, etc.).

**Kinematics**
- Determine basic kinematic relationships (gear ratios, directions of rotation, motion paths, key states/positions).
- Provide simple diagrams or hand sketches illustrating motion.

**Preliminary failure mode review**
- Identify likely failure modes: static overload, fatigue, wear, misalignment, excessive deflection, etc.
- Explain how the original design addresses these issues.
- Identify critical components where design choices are especially important for reliability.

**Critical design parameters**
- List geometric and material parameters that will drive Phase 2 design (e.g., gear tooth counts and module, shaft diameters, bearing types, clearances, fillet radii).

#### 6.1.2 Phase 1 deliverables

**Phase 1 report:**
- Executive summary
- System description and functional overview
- Component breakdown with labeled figures/sketches
- Kinematic description and basic calculations
- Preliminary failure modes and design considerations
- References for any external material (manuals, patents, data sheets, etc.)

**Phase 1 video: Understanding & Conceptual Design**
- Explain the system function and show key parts.
- Use annotated sketches or simple CAD models.
- Highlight likely failure modes and critical design parameters.

**Phase 1 peer review participation (see Section 7)**
- Your team will review assigned teams' Phase 1 report and video via the chosen peer-review platform.
- Use the provided rubric; provide numeric scores and constructive written feedback.
- Selected teams (based on peer scores) may be invited to give short in-class presentations summarizing their Phase 1 analysis.

### Phase 2 – Detailed CAD Design & Engineering Analysis (Due: Mar 25)

**Goal:** Develop a complete, realistic CAD model and perform required static and fatigue analyses to justify key design choices.

#### 6.2.1 CAD requirements

**Full 3D assembly**
- Model all significant components: gears, shafts, bearings, couplings, housings, fasteners, etc.
- Apply assembly mates/constraints that reflect actual physical interfaces and motion.

**Drawings and views**
- Provide part drawings for critical components with key dimensions and tolerances.
- Include at least one exploded view of the assembly.
- Create a basic motion study/animation showing the mechanism in operation (e.g., rotation of shafts and gears).

**Printability**
- Ensure parts are sized within the build volume of the 3D Print Lab printers.
- Design with appropriate minimum feature sizes and clearances for your chosen filament and 3D printing resolution.

#### 6.2.2 Required engineering analyses

Perform at least the following minimum set of analyses on the CAD model:

**Static stress and factor of safety**
- Choose at least one critical part.
- Compute combined bending and torsional stresses (using basic mechanics of materials).
- Calculate a factor of safety against yielding using a suitable failure criterion.

**Fatigue assessment**
- For the same or another repeatedly moving part, estimate alternating and mean stresses under expected repeated loading.
- Use a simplified fatigue criterion to estimate factor of safety against fatigue.

**Gear tooth loading (if applicable)**
- Estimate tangential tooth forces from torque and pitch radius.
- Perform a bending stress check for gear teeth.
- Discuss how contact stress and wear affect your design.

**Key / coupling / interface stresses (if applicable)**
- For at least one shaft–hub or shaft–gear connection, compute approximate bearing and/or shear stresses and assess whether they are reasonable for the material and loading.

**Bearing load check**
- Determine reaction loads at one bearing set based on shaft loading and gear forces.
- Check against basic bearing capacity data (e.g., static rating) and argue qualitatively how long the bearing would be expected to last at your reduced loads.

**Global safety overview**
- Summarize critical locations, their computed factors of safety (static and fatigue), and any design modifications you made to achieve acceptable margins.

Note: You are encouraged to supplement hand calculations with FEA and/or motion simulations using tools available (e.g., SolidWorks Simulation/Motion, MATLAB/Simulink with Simscape Multibody, Ansys Mechanical).

#### 6.2.3 Phase 2 deliverables

**Phase 2 report:**
- Overview of your final design (with key CAD images)
- Description of major design decisions and changes from Phase 1
- Detailed explanation of required analyses (shaft, gear, fatigue, bearings, interfaces, etc.) with clear assumptions and results
- Discussion of design for assembly and design for 3D printing
- Updated list of anticipated risks or weaknesses to be addressed in prototyping

**Phase 2 video: Detailed Design & CAD Walkthrough**
- Guided tour of the CAD assembly and key parts
- Short motion study demo
- Explanation of how your analysis informed changes to geometry and material choices

**Phase 2 peer review participation (see Section 7)**
- Review assigned teams' Phase 2 materials using the rubric.
- Provide both numeric scores and specific, constructive suggestions.
- Again, top-scoring projects (by peer evaluation) may be invited to give short in-class presentations.

### Phase 3 – Prototyping, Testing & Reflection (Due: Apr 27)

**Goal:** Build and test a functional 3D-printed prototype; analyze discrepancies between predicted and actual behavior; reflect on design mistakes and improvements.

#### 6.3.1 Prototyping and testing tasks

**3D print preparation**
- Export individual parts as STL files (one part per file, not assemblies) in correct units, as required by the lab.
- Determine required infill, orientation, and supports (document your choices).
- Submit prints to the FSE 3D Print Lab with enough lead time (≥ 1 week).

**Material and lab constraints**
- Be prepared for parts to require basic clean-up of supports and some manual assembly.

**Assembly and debugging**
- Document the assembly procedure (step-by-step, with photos).
- Record all issues encountered: interferences, loose fits, misalignments, unexpected stiffness, broken parts, etc.
- If reprints are needed due to design issues, describe what changed and why.

**Testing**
- Design simple tests to demonstrate key functions (e.g., smooth rotation under load, torque transmission, speed ratio, backlash, ability to lift a given weight).
- Collect and report qualitative and/or quantitative data (e.g., maximum load before skipping, measured angle vs. expected angle, qualitative smoothness).

**Reflection**
- Analyze discrepancies between expected (Phase 2) and observed behavior.
- Identify design assumptions that were incorrect or incomplete.
- Propose clear improvements for a hypothetical "Version 2".

#### 6.3.2 Phase 3 deliverables

**Phase 3 report:**
- Fabrication details (filament type, printer, settings, number of reprints)
- Assembly procedure and challenges
- Test procedures, results, and interpretation
- Comparison with Phase 2 predictions (where applicable)
- Detailed discussion of failures, mistakes, and surprises
- Concrete list of design changes you would implement in a second iteration

**Phase 3 video: Prototype Demo & Reflection**
- Show the physical prototype operating.
- Demonstrate at least one test.
- Discuss major issues encountered and key lessons learned.

**Final poster and poster session**
- Create an ASU-branded poster summarizing Phases 1–3.
- Present your work during the scheduled poster session. All team members are expected to attend and participate.

## 7. Peer Review and Presentations

### 7.1 Peer review rounds

After Phase 1 and Phase 2, your team will review a set of other teams' submissions via the designated peer-review platform.

Reviews will include:
- Numeric scores in rubric categories (technical correctness, depth of analysis, clarity, completeness, etc.).
- Short narrative comments: at least one "strength" and one "specific improvement" per category.

Peer scores will contribute to project grading and selection of teams for in-class presentations.

### 7.2 Selection for presentations

A subset of teams with highest peer-evaluated scores in each phase may be invited to give brief in-class presentations.

Criteria will be based primarily on peer scores, with the instructor reserving the right to resolve ties or address anomalies.

## 8. Grading and Evaluation

Final weights for the project (team-level):

**Phase 1: 30%**
- Technical content and analysis: 20%
- Report + GitHub organization: 5%
- Video quality and clarity: 5%

**Phase 2: 30%**
- CAD quality and required analyses: 20%
- Report + GitHub organization: 5%
- Video quality and clarity: 5%

**Phase 3: 40%**
- Prototype functionality and testing quality: 25%
- Final report + GitHub organization: 10%
- Poster and Phase 3 video: 5%

### 8.1 Individual contribution and end-of-semester peer evaluation

Although most grading is at the team level, individual grades may be adjusted based on:
- End-of-semester teammate evaluations (confidential).
- Evidence of consistent under- or over-contribution (meeting attendance, GitHub commits, assigned tasks).

Large discrepancies in participation may result in individual grade adjustments.

## 9. Policies and Expectations

- **Professionalism:** All written, video, and poster materials should be clear, organized, and appropriate for an engineering audience.
- **Software tools:** You are expected to use a professional CAD package (e.g., SolidWorks) and may use additional tools (FEA, motion analysis, MATLAB/Simulink, etc.) if able. SolidWorks and MATLAB/Simulink are available to Fulton Schools students via ASU licenses.
- **Academic integrity:** Cite all external sources (datasheets, manuals, papers, code snippets, etc.). Falsifying analysis or test data is considered academic dishonesty.
- **Safety and lab policies:** Follow all rules of the ASU FSE 3D Print and Laser Cutter Lab. Prototypes must be safe to handle and operate at reduced loads.

## 10. Summary Checklist by Phase

**Phase 1 (due Feb 2)**
- System selected and approved
- Functional and kinematic description completed
- Preliminary failure-mode review completed
- Phase 1 report section on GitHub
- Phase 1 video submitted
- Peer reviews for assigned teams completed

**Phase 2 (due Mar 25)**
- Full CAD assembly and key drawings complete
- Required static and fatigue analyses performed and documented
- Phase 2 report section on GitHub
- Phase 2 video submitted
- Peer reviews for assigned teams completed
- Initial 3D print planning started

**Phase 3 (due Apr 27)**
- 3D-printed parts obtained
- Prototype assembled and debugged
- Tests designed, run, and documented
- Phase 3 report section on GitHub
- Final demo/reflection video submitted
- Poster completed and presented at poster session
- End-of-semester teammate evaluations completed