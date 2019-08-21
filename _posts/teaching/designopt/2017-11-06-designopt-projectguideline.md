---
categories: designopt_project
layout: opt_default
title:  Final Project Report Guideline
published: false
----------------
## Project Report Guideline

### GENERAL FORMAT

The report must be prepared as a single PDF or Markdown file. For PDF, use 12pt fonts.
Figures, tables and equations must be numbered. Figures and tables must each have 
captions. The report must be submitted to yiren@asu.edu. 

### CONTENT FORMAT

The report must contain the items described below to be acceptable.  
The sequencing of sections may change depending 
on the individual projects.  Also, there may be a variation in the length 
and effort required in particular sections.

#### Cover Page and Abstract

This contains, in a single page, the title of the project, 
your name and date, and an abstract of approximately 200 words describing 
your problem and the results obtained.  Do not write generalities but be 
specific about your work.

#### Table of Contents

A list of all sections, subsections, appendices, etc., contained in your report. 

####  Design Problem Statement

As in the proposal/progress report, with any needed modifications.

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
This is the section provided in the proposal/interim report, with any needed 
corrections.  The last part of this section must summarize the model, give list of 
variables, number of equality and inequality constraints and number of degrees of 
freedom. Since it is likely that the final model evolved from its original 
statement, you should describe briefly how the model evolved and what made you 
change it. If the changes were a result of the optimization study itself, you 
may include these modeling decisions in the later section on optimization study. 
Relegate to appendices any lengthy explanations you feel you need to 
include, so that the overall report flow is not disrupted.

#### Model Analysis
This section describes any possible bounding agreements, monotonicity properties and 
tables, constraint activity identification, model transformations and simplifications
, scaling, case decomposition and anything else you have done to make the problem 
easier to solve numerically and/or analytically.
It is suggested that model analysis may be first described for a specific set of 
parameter values and then generalized to other parameter values to the extent possible.

#### Optimization Study
Identification of the solution and a description of how it was obtained should be 
presented.  Unsuccessful attempts should be reported and documented in an appendix.
The solution should not be given as just a set of numbers.  Other issues must be 
examined and described, e.g., constraint activity, values of multipliers, interior 
vs. boundary solution, global vs. local results, numerical stability, satisfaction 
of KKT conditions, different starting points. 
Results obtained numerically should motivate attempts for analytical verification.  
Examine and explain, for example, if monotonicity analysis results agree with numerical 
results.

#### Parametric Study
The solution should be obtained for different sets of parameter values.  
Does the optimum change?  Can the results be generalized?  Are there ranges of 
parameter values that may dictate the type of solution expected?  

####  Discussion of Results
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

#### System Integration Study (For Team Project Only)
In this section you examine the issues you raised in the above section regarding the 
linking 
of the subsystems. Can the combined subsystem optima give you the overall system 
optimum or are there conflicts to be resolved?  In the latter case you must 
attempt the following:

(a)	Select a system objective and combine all variables and constraints into a 
single optimization model. Solve this overall system problem as a single 
optimization problem. This is what we call the All-in-One (AIO) approach. 
If you can obtain a solution, compare it with the solutions you obtained from 
the subsystems. Discuss your results.

(b)	The AIO approach may give you a problem that is too complicated and you 
cannot obtain numerical results, and a decomposition method is applied. Identify 
the problem partition into subproblems, each with their own local variables. 
These may be just the subsystems you identified in your earlier individual studies. 
Further, define a master problem with an appropriate objective that has as design 
variables the linking variables among the subproblems. Apply a coordination strategy 
where the master problem is solved wrt the linking variables (local variables fixed) 
and the subproblems are solved wrt the local variables (linking variables fixed). 
Examine how the coordination strategy terminates. Other coordinations without a 
master problem may also be used. If you do get results from the AIO strategy, 
you should compare the results you get from the two approaches.

#### References
Complete reference list of any sources that you used to complete your project. 
If you use a website reference provide the name of the site/organization, the URL 
and the date you accessed the information.

#### Appendices
There may be several appendices containing anything that would distract the reader 
if used in the main text, for example, elaborate algebraic manipulations, proofs of 
monotonicities, coding of the models, and selected computer runs.

**Final Note**: Your report should be a high-quality piece of work similar to technical 
papers, something you should be proud of.  In fact, several student reports have 
resulted in scientific publications in the past.  In any case, you should remember 
that others must be able to read, understand and duplicate what you have done with 
only the information contained in your report. 
If you are interested in pursuing a technical publication of this work please contact 
me at the end of the term.





 