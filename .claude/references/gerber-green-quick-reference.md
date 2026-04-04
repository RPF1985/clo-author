# Gerber & Green "Field Experiments" Quick Reference

**Source:** Gerber & Green (2012), *Field Experiments: Design, Analysis, and Interpretation*, W.W. Norton
**Full text:** `.claude/references/Field Experiments (Alan S. Gerber, Donald P. Green).pdf`

---

## 1. Chapter Map

| Chapter | Topic | One-Line Summary |
|---------|-------|-----------------|
| 1 | Introduction | Experimental ideals, causal inference via potential outcomes, SUTVA |
| 2 | Causal inference and experimentation | Treatment operationalization, ecological validity, demand effects, ethical considerations |
| 3 | Sampling, treatment assignment, estimation | Estimation of ATEs from randomized experiments, Neyman framework, confidence intervals |
| 4 | Blocking and covariate adjustment | When and how to block, prognostic covariates, precision gains from blocking and regression adjustment |
| 5 | One-sided noncompliance | ITT vs CACE, exclusion restriction, always-takers impossible, monotonicity |
| 6 | Two-sided noncompliance | Always-takers, never-takers, compliers, defiers; bounds on CACE when monotonicity fails |
| 7 | Attrition | Differential attrition by treatment arm, Lee bounds, Manski bounds, extreme value bounds |
| 8 | Interference and spillovers | SUTVA violations, cluster randomization as remedy, spatial spillover models, design-based approaches |
| 9 | Heterogeneous treatment effects | Pre-specified subgroups, CATE estimation, interaction specifications, machine learning approaches |
| 10 | Regression and design-based inference | OLS interpretation, HC SEs, design-based vs. model-based inference, when regression helps/hurts |
| 11 | Integration of research findings | Meta-analysis, replication, cumulative science |

---

## 2. Threat-Specific Checklists

### Noncompliance — One-Sided (Ch. 5)

**Situation:** Treatment is offered but some units don't take it up. No one in the control group receives treatment.

- [ ] **ITT reported:** Intent-to-treat effect (effect of assignment, not receipt) is the primary estimate
- [ ] **Compliance rate documented:** What fraction of treated-assigned actually received treatment?
- [ ] **CACE estimated:** Complier Average Causal Effect via IV/2SLS (assignment instruments receipt)
- [ ] **Exclusion restriction argued:** Assignment affects outcome ONLY through treatment receipt
- [ ] **Monotonicity stated:** No defiers (no one who takes treatment when assigned to control AND refuses when assigned to treatment)
- [ ] **Always-takers impossible:** In one-sided noncompliance, control group cannot access treatment

**Key formula:** CACE = ITT / compliance rate (Wald estimator)

### Noncompliance — Two-Sided (Ch. 6)

**Situation:** Some assigned-to-treatment don't take it; some assigned-to-control take it anyway.

- [ ] **Four types identified:** Always-takers, never-takers, compliers, defiers
- [ ] **Defiers ruled out:** Monotonicity must be argued (no one who takes treatment when assigned to control AND refuses when assigned to treatment)
- [ ] **Bounds reported if monotonicity suspect:** Without monotonicity, only bounds on CACE available
- [ ] **First stage strong:** F-statistic for assignment predicting receipt should be large (> 10 rule of thumb)
- [ ] **Per-protocol analysis flagged:** As-treated / per-protocol analysis introduces selection bias — report but don't rely on it

### Attrition (Ch. 7)

**Situation:** Some participants drop out, and dropout may differ by treatment arm.

- [ ] **Differential attrition tested:** Compare attrition rates between treatment and control
- [ ] **Attrition balance table:** Do attriters differ from completers on pre-treatment covariates?
- [ ] **Lee bounds computed:** Trim the "excess" group to bound the true effect under worst-case attrition
- [ ] **Manski bounds computed:** Extreme value bounds assuming attriters have worst/best possible outcomes
- [ ] **ITT on full sample reported:** Even with attrition, the ITT on all randomized units is informative
- [ ] **CONSORT diagram updated:** Show flow from enrollment → randomization → allocation → analysis with attrition counts

**Key principle:** Attrition = missing data. Differential attrition = potential bias. Symmetric attrition is less concerning but still problematic if attriters are different from completers.

### Spillovers and Interference (Ch. 8)

**Situation:** Treatment of one unit affects outcomes of other units (SUTVA violated).

- [ ] **SUTVA discussed:** Is the no-interference assumption plausible in this setting?
- [ ] **Spillover channels identified:** Geographic proximity, social networks, information transmission, market equilibrium effects
- [ ] **Cluster randomization considered:** If interference within clusters but not between, randomize at cluster level
- [ ] **Design-based spillover estimation:** If spillovers are of interest, design the study to estimate them (saturation designs, partial population designs)
- [ ] **ICC reported for cluster designs:** Intracluster correlation governs power loss from clustering
- [ ] **Number of clusters adequate:** Need ~50+ clusters for cluster-robust SEs; fewer requires wild cluster bootstrap

**Key principle:** Individual-level randomization on a survey platform (Prolific, MTurk) typically satisfies SUTVA because respondents don't interact. Cluster randomization is needed when units can affect each other.

### Blocking (Ch. 4)

**Situation:** You want to improve precision by ensuring treatment-control balance on important covariates.

- [ ] **Blocks defined on prognostic covariates:** Block on variables that predict the outcome, not just any pre-treatment variable
- [ ] **Block-specific effects estimated:** Estimate treatment effect within each block, then aggregate
- [ ] **Weighting for unequal block sizes:** If blocks have different sizes, use IPW or block-weighted estimators
- [ ] **Not too many blocks:** With many small blocks, some blocks may have all-treated or all-control — lose those units
- [ ] **Blocking vs. covariate adjustment:** Can achieve similar precision gains with post-hoc covariate adjustment (Lin estimator) without the risks of over-blocking

**Warning:** Blocking on non-prognostic variables can REDUCE precision. See DeclareDesign blog post "Sometimes blocking can reduce your precision."

### Heterogeneous Treatment Effects (Ch. 9)

**Situation:** Treatment effects may differ across subgroups.

- [ ] **Subgroups pre-specified:** HTE analyses should be declared in the PAP, not discovered post-hoc
- [ ] **Interaction specification correct:** Include treatment × moderator interaction, not just separate subgroup regressions
- [ ] **Power for interactions:** Detecting heterogeneity requires ~4x the sample needed for the main effect (rule of thumb)
- [ ] **Multiple comparisons adjusted:** If testing many subgroups, apply Bonferroni or Benjamini-Hochberg correction
- [ ] **Continuous moderators preferred:** Binary splits waste information; interact treatment with continuous moderator when possible

### Covariate Adjustment (Ch. 4, 10)

**Situation:** You want to improve precision by controlling for pre-treatment covariates.

- [ ] **Only pre-treatment covariates:** NEVER control for post-treatment variables (collider bias)
- [ ] **Lin estimator recommended:** Interacts covariates with treatment; agnostic about functional form; guaranteed to weakly improve precision
- [ ] **Regression adjustment valid under randomization:** OLS with pre-treatment covariates is consistent under random assignment even if the linear model is wrong (Freedman 2008, Lin 2013)
- [ ] **Don't condition on post-treatment compliance status:** Analyzing "compliers only" introduces selection bias

---

## 3. Treatment Construction Guidance (Ch. 2)

### Operationalization Checklist

- [ ] **Treatment is precisely defined:** Exact wording, dosage, duration, and delivery mechanism documented
- [ ] **Control condition is meaningful:** Placebo control (receives something equivalent minus the active ingredient) is preferable to a pure no-contact control when possible
- [ ] **Manipulation strength calibrated:** The treatment must be strong enough to produce a detectable effect at the powered MDE. A one-sentence framing manipulation cannot shift deeply held attitudes by 0.5 SD.
- [ ] **Compound treatments avoided:** If the treatment bundles multiple mechanisms (e.g., information + emotion + authority cue), effects cannot be attributed to any single mechanism. Factor out distinct mechanisms into separate treatment dimensions.
- [ ] **Demand effects minimized:** Can subjects infer the hypothesis from the treatment wording? Use subtle manipulations, cover stories, or between-subjects designs to reduce demand.
- [ ] **Ecological validity considered:** Does the experimental stimulus resemble something participants would encounter in real life? Hypothetical scenarios are weaker than realistic ones.

### Manipulation Checks

- [ ] **Included and pre-registered:** Test whether the treatment shifted the intended psychological state
- [ ] **Placed after outcome (usually):** Post-outcome manipulation checks avoid priming effects. Exception: if the check IS a pre-treatment measure (e.g., reading comprehension before proceeding)
- [ ] **Informative, not just recall:** "Did you read about X?" tests attention, not manipulation. "How threatening did you find the scenario?" tests the intended mechanism.
- [ ] **Failure handling pre-specified:** If the manipulation check fails, report ITT (don't drop failed units — that's per-protocol analysis with selection bias)

---

## 4. Design Diagnostics Decision Tree

```
Does your design have...

NONCOMPLIANCE?
├── YES → One-sided (only treated can defect)?
│   ├── YES → Report ITT as primary. Estimate CACE via Wald estimator.
│   │         Check exclusion restriction. (Ch. 5)
│   └── NO → Two-sided (both arms can cross over)?
│       └── Report ITT as primary. Estimate CACE via 2SLS.
│           Argue monotonicity. Check first-stage F. (Ch. 6)
└── NO → Proceed to next check.

ATTRITION?
├── YES → Differential by treatment arm?
│   ├── YES → Compute Lee bounds and Manski bounds.
│   │         Report ITT on full sample. Show attrition balance. (Ch. 7)
│   └── NO → Report attrition rates. Show attriters ≈ completers on covariates.
│           ITT on completers is likely valid but acknowledge limitation. (Ch. 7)
└── NO → Proceed to next check.

INTERFERENCE / SPILLOVERS?
├── YES → Units interact within groups?
│   ├── YES → Cluster randomize at the group level.
│   │         Report ICC. Need 50+ clusters for robust SEs. (Ch. 8)
│   └── NO → Units interact across space/networks?
│       └── Consider saturation design or spatial spillover model.
│           Or argue interference is negligible. (Ch. 8)
└── NO → Standard individual-level analysis. (Ch. 3)

MULTIPLE OUTCOMES?
├── YES → Primary vs. secondary distinguished?
│   ├── YES → Apply multiple comparison correction to secondary outcomes.
│   │         Report primary outcome uncorrected. (Ch. 9)
│   └── NO → Define primary outcome. Apply FDR correction. Flag as exploratory.
└── NO → Standard single-outcome analysis.
```

---

## 5. When Gerber & Green and DeclareDesign Disagree

Both texts are authoritative but emphasize different aspects of research design:

| Topic | Gerber & Green Emphasis | DeclareDesign Emphasis | Resolution |
|-------|------------------------|----------------------|-----------|
| **Power analysis** | Analytical formulas, rules of thumb | Simulation-based diagnosis, redesign | Use DeclareDesign simulation; report analytical formula as sanity check |
| **Blocking** | Practical: block on strong predictors, avoid too many blocks | Formal: diagnose precision gains from blocking via simulation | Diagnose with DeclareDesign; apply G&G practical warnings about over-blocking |
| **Clustering** | Practical: need many clusters, few-cluster problems are real | Formal: simulate ICC impact on power and coverage | Use DeclareDesign to set cluster count; use G&G guidance for implementation |
| **Noncompliance** | Detailed treatment: types, bounds, per-protocol pitfalls | CACE as an inquiry, IV as answer strategy | G&G takes precedence on compliance nuances; DeclareDesign for formal declaration |
| **Attrition** | Detailed treatment: Lee bounds, Manski bounds, extreme values | Attrition as a measurement issue in declare_measurement | G&G takes precedence on attrition handling; DeclareDesign for formal specification |
| **Covariate adjustment** | Lin estimator, regression adjustment under randomization | Lin estimator as answer strategy, covariate adjustment via redesign | Both agree on Lin; DeclareDesign blog posts add nuance (see blog index) |
| **External validity** | Sample representativeness, ecological validity of treatments | Formal: sample inquiry vs. population inquiry distinction | G&G for practical guidance; DeclareDesign for formal distinction |

**Default rule:** Gerber & Green takes precedence on **implementation realities** (compliance, attrition, partner management, ethics). DeclareDesign takes precedence on **formal design properties** (power, bias, coverage, design comparison). When both address a topic, present both perspectives.
