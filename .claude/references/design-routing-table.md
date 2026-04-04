# Design Routing Table

Maps each design type to the relevant chapters, replication code, blog posts, and warnings from both reference texts. Agents should consult this table when a design type is identified to find the most relevant resources.

**Abbreviations:** DD = DeclareDesign (Blair, Coppock & Humphreys 2023); G&G = Gerber & Green (2012)
**HTML chapters:** `.claude/references/declaredesignbook/` (preferred over PDF)
**Replication code:** `.claude/references/declaredesign-replication/replication-materials/code/declarations/`

---

## Experimental Designs

### Between-Subjects Experiment (Simple)

**When to use:** Single binary or multi-arm treatment, clean ATE estimation.

| Resource | Reference |
|----------|-----------|
| DD chapters | Ch. 18 (experimental causal), Ch. 5 (declaring), Ch. 10 (diagnosing) |
| DD HTML | `18 Experimental : causal...html`, `10 Diagnosing designs...html` |
| G&G chapters | Ch. 2 (causal inference), Ch. 3 (estimation), Ch. 4 (blocking/covariate adjustment) |
| Declarations | `declaration_18.1.R` (canonical two-arm), `declaration_18.2.R` (Lin covariate adjustment), `declaration_18.3.R` (DIM vs OLS vs Lin comparison) |
| Diagnoses | `diagnosis_18.1.R`, `diagnosis_18.2.R` |
| Blog posts | "Randomization does not justify t-tests", "Common estimators of uncertainty overestimate uncertainty" |

**Key warnings:**
- Use robust (HC2) SEs or randomization inference, not classical t-tests
- Lin covariate adjustment weakly dominates unadjusted — use it by default
- ANCOVA beats change scores unless treatment effect is proportional to baseline (see blog: "Use change scores or control for pre-treatment outcomes?")

---

### Between-Subjects Experiment (Factorial)

**When to use:** Multiple treatment dimensions, interaction effects, marginal ATEs.

| Resource | Reference |
|----------|-----------|
| DD chapters | Ch. 18 (experimental causal, Section 18.6) |
| DD HTML | `18 Experimental : causal...html` |
| G&G chapters | Ch. 3 (estimation), Ch. 9 (heterogeneous effects) |
| Declarations | `declaration_18.7.R` (2x2 factorial with CATEs, marginal ATEs, and interaction) |
| Diagnoses | `diagnosis_18.7.R` |
| Blog posts | "Improve power using your answer strategy, not just your data strategy" |

**Key warnings:**
- Interaction effects require ~4x the sample needed for main effects
- Declare assignment for each factor separately: `Z1 = complete_ra(N), Z2 = block_ra(Z1)`
- Block the second factor on the first to ensure balance across cells
- Pre-specify which interactions are confirmatory vs. exploratory
- Use `subset` in `declare_estimator()` for conditional ATEs, full interaction model for interaction test

---

### Conjoint Analysis

**When to use:** Many attributes, multidimensional preferences, AMCE estimation.

| Resource | Reference |
|----------|-----------|
| DD chapters | Ch. 17 (experimental descriptive, Section 17.4) |
| DD HTML | `17 Experimental : descriptive...html` |
| G&G chapters | Ch. 2 (treatment construction), Ch. 9 (heterogeneous effects) |
| Declarations | `declaration_17.5.R` (forced-choice conjoint with AMCE for gender, party, region) |
| Diagnoses | `diagnosis_17.5.R` |
| Blog posts | — |

**Key warnings:**
- AMCE is the average over the attribute distribution — interpretation depends on the randomization distribution
- Report marginal means alongside AMCEs (Leeper, Hobolt & Tilley 2020)
- Cluster SEs at respondent level (multiple tasks per respondent)
- Profile restrictions (impossible combinations) must be documented — they change the estimand
- Use `cregg::cj()` for estimation; subgroup analyses via `by` argument, not manual subsetting

---

### Factorial Vignette Experiment

**When to use:** Causal effects of scenario features on judgment, multi-dimensional scenarios.

| Resource | Reference |
|----------|-----------|
| DD chapters | Ch. 17 (experimental descriptive), Ch. 18 (experimental causal) |
| DD HTML | `17 Experimental : descriptive...html`, `18 Experimental : causal...html` |
| G&G chapters | Ch. 2 (treatment construction — ecological validity), Ch. 9 (HTE) |
| Declarations | `declaration_18.7.R` (factorial structure applies), `declaration_17.5.R` (conjoint for multi-attribute) |
| Blog posts | — |

**Key warnings:**
- Distinguish from conjoint: vignettes present a single profile for rating, not a forced choice between two
- Factor levels must be independently randomized (no aliasing)
- Number of vignettes per respondent must balance power against fatigue
- Implausible factor combinations should be restricted and documented

---

### Within-Subjects / Crossover / Pre-Post

**When to use:** Increase power with repeated measures, order effects manageable.

| Resource | Reference |
|----------|-----------|
| DD chapters | Ch. 18 (Section 18.9 — stepped-wedge), Ch. 8 (data strategy — measurement) |
| DD HTML | `18 Experimental : causal...html` |
| G&G chapters | Ch. 3 (estimation), Ch. 9 (heterogeneous effects) |
| Declarations | `declaration_18.10.R` (stepped-wedge/waitlist crossover with TWFE) |
| Blog posts | "Use change scores or control for pre-treatment outcomes?" |

**Key warnings:**
- Order effects are the primary threat — randomize the order of treatment exposure
- Carryover effects: if the first treatment contaminates responses to the second, within-subjects is invalid
- ANCOVA (control for pre-treatment outcome) is generally preferred over change scores
- For pre-post designs, the pre-post correlation determines efficiency gains

---

### List Experiment

**When to use:** Sensitive topics where direct questioning produces social desirability bias.

| Resource | Reference |
|----------|-----------|
| DD chapters | Ch. 17 (experimental descriptive, Section 17.3) |
| DD HTML | `17 Experimental : descriptive...html` |
| G&G chapters | Ch. 2 (demand effects, social desirability) |
| Declarations | `declaration_17.3.R` (list experiment with DIM), `declaration_17.4.R` (list vs. direct question comparison) |
| Diagnoses | `diagnosis_17.3.R`, `diagnosis_17.4.R` |
| Blog posts | — |

**Key warnings:**
- No design effects: adding the sensitive item must not change baseline counting behavior
- Floor/ceiling effects: respondents who would count 0 (floor) or all items (ceiling) reveal their status
- Requires ~4x the sample of a direct question for equivalent power
- Pre-register the sensitive item and control items

---

### Endorsement Experiment

**When to use:** Sensitive attitudes measured via implicit association with endorsers.

| Resource | Reference |
|----------|-----------|
| DD chapters | Ch. 17 (experimental descriptive) |
| G&G chapters | Ch. 2 (demand effects) |
| Declarations | — (no replication code for this specific design) |
| Blog posts | — |

**Key warnings:**
- Interpretation depends on the endorser being unambiguous
- Compound treatment: endorsement effect bundles endorser credibility + policy content
- Less common in current PS literature — consider whether a standard between-subjects experiment would be cleaner

---

### Blocked Randomization

**When to use:** Improve precision by balancing treatment assignment within strata of prognostic covariates.

| Resource | Reference |
|----------|-----------|
| DD chapters | Ch. 5 (declaring — assignment), Ch. 8 (data strategy), Ch. 18 (blocking section) |
| DD HTML | `5 Declaring designs...html`, `8 Crafting a data strategy...html` |
| G&G chapters | Ch. 4 (blocking and covariate adjustment — primary reference) |
| Declarations | `declaration_18.4.R` (block RA with IPW), `declaration_2.2.R` (block RA by history), `declaration_9.6.R` (IPW with blocks) |
| Blog posts | "Sometimes blocking can reduce your precision", "The trouble with 'controlling for blocks'" |

**Key warnings:**
- Block ONLY on prognostic covariates (variables that predict the outcome)
- Blocking on non-prognostic variables can REDUCE precision
- With unequal block sizes, use IPW or block-weighted estimators
- "Controlling for blocks" via fixed effects can reduce precision vs. block-weighted estimators
- Alternative: skip blocking, use Lin covariate adjustment post-hoc for similar precision gains

---

### Cluster Randomization

**When to use:** When interference within clusters makes individual-level randomization invalid.

| Resource | Reference |
|----------|-----------|
| DD chapters | Ch. 18 (Section 18.5 — cluster RCTs), Ch. 5 (declaring cluster assignment) |
| DD HTML | `18 Experimental : causal...html` |
| G&G chapters | Ch. 8 (interference and spillovers — primary reference for cluster design) |
| Declarations | `declaration_18.5.R` (cluster RCT with varying sizes and ICC), `declaration_12.1c.R` (multi-arm cluster), `declaration_18.12.R` (saturation design) |
| Blog posts | "How misleading are clustered SEs in designs with few clusters?", "Sometimes you need to cluster standard errors above the level of treatment" |

**Key warnings:**
- With < 50 clusters, cluster-robust SEs are badly biased — use wild cluster bootstrap
- With < 10 clusters, use randomization inference or effective df adjustment
- ICC governs the "design effect" — high ICC means clustering is expensive
- Power depends more on number of clusters than cluster size
- For survey experiments on Prolific/MTurk: individual-level randomization usually satisfies SUTVA (no interaction between respondents)

---

## Observational Designs

### Difference-in-Differences

| Resource | Reference |
|----------|-----------|
| DD chapters | Ch. 16 (observational causal, Section 16.3) |
| DD HTML | `16 Observational : causal...html` |
| G&G chapters | — (G&G focuses on experiments; limited DiD coverage) |
| Declarations | `declaration_16.3.R` (staggered DiD with TWFE and de Chaisemartin) |
| Blog posts | — |

**Key warnings:** Parallel trends, staggered adoption requires heterogeneity-robust estimator (Callaway-Sant'Anna, Sun-Abraham, or BJS).

### Instrumental Variables

| Resource | Reference |
|----------|-----------|
| DD chapters | Ch. 16 (Section 16.4) |
| G&G chapters | Ch. 5-6 (noncompliance — IV for experiments) |
| Declarations | `declaration_16.4.R` (IV with compliers/never-takers, 2SLS) |
| Blog posts | "An instrument does not have to be exogenous to be consistent" |

**Key warnings:** First-stage F > 10. Exclusion restriction must be argued, not just stated. LATE ≠ ATE.

### Regression Discontinuity

| Resource | Reference |
|----------|-----------|
| DD chapters | Ch. 16 (Sections 16.5-16.6) |
| G&G chapters | — |
| Declarations | `declaration_16.5.R` (sharp RD with rdrobust), `declaration_16.6.R` (local linear within bandwidth) |
| Blog posts | — |

**Key warnings:** McCrary density test, bandwidth sensitivity, bias-corrected CIs, donut-hole robustness.

### Synthetic Control

| Resource | Reference |
|----------|-----------|
| DD chapters | Ch. 16 (briefly) |
| G&G chapters | — |
| Declarations | — (no replication code for SC) |
| Blog posts | — |

**Key warnings:** Pre-treatment fit quality, permutation inference, donor pool sensitivity, no extrapolation.

---

## Cross-Cutting Concerns

### Power Analysis

| Resource | Reference |
|----------|-----------|
| DD chapters | Ch. 10-11 (diagnosing and redesigning) |
| DD HTML | `10 Diagnosing designs...html`, `11 Redesigning...html` |
| G&G chapters | Power discussions within each design chapter |
| Declarations | `declaration_18.11.R` (parameterized for power), `declaration_11.2.R` (random effect size), `declaration_11.3.R` (optimal allocation) |
| Blog posts | "How post-hoc power calculation is like a shit sandwich", "With great power comes great responsibility", "Should a pilot study change your study design decisions?" |

**Key principle:** Use DeclareDesign simulation for power analysis, not analytical formulas. Post-hoc power is meaningless. Pilot studies inform logistics, not effect sizes.

### Covariate Adjustment

| Resource | Reference |
|----------|-----------|
| DD chapters | Ch. 23 (integration — when adjustment helps/hurts) |
| DD HTML | `23 Integration...html` |
| G&G chapters | Ch. 4 (blocking and covariate adjustment), Ch. 10 (regression) |
| Declarations | `declaration_23.1a-d.R` (systematic comparison of adjustment under confounding/non-confounding), `declaration_18.2.R` (Lin estimator), `declaration_10.4.R` (precision gains) |
| Blog posts | "How controlling for pretreatment covariates can introduce bias", "The trouble with 'controlling for blocks'" |

**Key principle:** Only adjust for pre-treatment covariates. Lin estimator is the default. Post-treatment conditioning creates collider bias.

### Noncompliance

| Resource | Reference |
|----------|-----------|
| DD chapters | Ch. 18 (Sections 18.7-18.9) |
| G&G chapters | Ch. 5 (one-sided), Ch. 6 (two-sided) — **primary reference** |
| Declarations | `declaration_18.8.R` (IV/ITT/PP comparison), `declaration_18.9a-c.R` (CACE estimation approaches) |
| Blog posts | — |

### Attrition

| Resource | Reference |
|----------|-----------|
| DD chapters | Ch. 8 (measurement — briefly) |
| G&G chapters | Ch. 7 — **primary reference** |
| Declarations | — |
| Blog posts | — |

**Key principle:** G&G is the authoritative source for attrition handling. DeclareDesign can formally model attrition in `declare_measurement()`.

### Spillovers and Interference

| Resource | Reference |
|----------|-----------|
| DD chapters | Ch. 18 (Sections 18.11-18.13 — saturation and spatial designs) |
| G&G chapters | Ch. 8 — **primary reference** |
| Declarations | `declaration_18.12.R` (saturation design), `declaration_18.13.R` (spatial interference) |
| Blog posts | — |
