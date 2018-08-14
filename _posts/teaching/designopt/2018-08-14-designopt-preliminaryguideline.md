---
categories: designopt_tutorial
layout: opt_default
title:  Preliminary Report Guideline
published: true
---------------
## Preliminary Report Guideline

### GENERAL FORMAT

The report must be prepared as a single **PDF** or **Markdown** file.
For PDF, use 12pt fonts.
Figures, tables and equations must be numbered. Figures and tables must
each have captions. The report must be submitted to yiren@asu.edu.

### CONTENT FORMAT

The report must contain the items described below to be acceptable.
The sequencing of sections may change depending
on the projects.  Also, there may be a variation in the length
and effort required in particular sections.

#### Cover Page and Abstract

This contains, in a single page, the title of the project,
your name and date, and an abstract of approximately 200 words describing
your problem and the results obtained. Do not write generalities but be
specific about your work.

The cover page should also include a link to a **Github Repository**
that contains all codes, data, and other files that are consistent with
the models, algorithms, and results from the report.

#### Table of Contents

A list of all sections, subsections, appendices, etc., contained in your report.

####  Design Problem Statement

If you are designing a system composed of several subsystems, state the
overall system problem and identify the individual subsystems you will first optimize
separately, and the rationale for selecting these subsystems. Please note
the individual that worked on each subsystem.

####  Nomenclature
Define all symbols that you use, particularly for the mathematical model development
, as should have been provided in your proposal/interim report. If you have
several subsystems, you should make sure you use a consistent nomenclature and
set of symbols. It may also be convenient to divide the symbols list to subsystems.

####  Mathematical Model
Define the optimization problem in terms of variables, constraints,
objectives, and assumptions. Describe all models needed for constructing
the constraints and objectives, and a plan for acquiring these models
(e.g., through theories, simulations, data, etc.)
The last part of this section must summarize the model, give list of
variables, number of equality and inequality constraints and number of degrees of
freedom.

Be specific about the assumptions, and list risks that may involved in
making these assumptions.

#### Model Analysis
This section describes any possible bounding agreements, monotonicity properties,
constraint activity identification, model transformations and simplifications
, scaling, case decomposition and anything else you have done to make the problem
easier to solve numerically and/or analytically.

#### Optimization Study (Optional)
Identification of the solution and a description of how it was obtained should be
presented.  Unsuccessful attempts should be reported and documented in an appendix.

Results obtained numerically should motivate attempts for analytical verification.
Examine and explain, for example, if monotonicity analysis results agree with numerical
results.

####  Discussion of Results (Optional)
Here, the results of the optimization study are given with an engineering
interpretation.  What are the design implications?  Can you identify a
"design rule" for an optimum solution?  Do the results make sense?  How does the
model limit the solution?  Are there "practical" constraints active and what
would this imply?  What would you do next to improve the answers or make the
problem more interesting?

In a system design study, you must identify any conflicting requirements stemming
from optimizing the subsystems separately. Do the subsystems have common variables,
parameters, objectives or constraints? Are some variables in one subsystem parameters
in the other? Is there an expected sequence of solving one subsystem before you
solve another?

#### References
Complete reference list of any sources that you used to complete your project.
If you use a website reference provide the name of the site/organization, the URL
and the date you accessed the information.

#### Appendices
There may be several appendices containing anything that would distract the reader
if used in the main text, for example, elaborate algebraic manipulations, proofs of
monotonicities, coding of the models, and selected computer runs.

**Final Note**: Your report should be a high-quality piece of work similar to technical
papers, something you should be proud of. In any case, you should remember
that others must be able to read, understand and duplicate what you have done with
only the information contained in your report.
If you are interested in pursuing a technical publication of this work please contact
me at the end of the term.





