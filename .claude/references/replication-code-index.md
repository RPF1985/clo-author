# DeclareDesign Replication Code Index

**Source:** Blair, Coppock & Humphreys (2023), *Research Design in the Social Sciences*
**Location:** `.claude/references/declaredesign-replication/replication-materials/code/declarations/`
**Note:** This directory is gitignored. To obtain the replication code, download `replication-materials.zip` from the [DeclareDesign book's Harvard Dataverse deposit](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/NMJ5GV) and extract to `.claude/references/declaredesign-replication/`.

---

## Declaration Files by Chapter

### Ch. 2: What Is a Research Design

| File | Design Type | Description |
|------|-------------|-------------|
| `declaration_2.1.R` | Two-arm experiment with sampling | Complete random sampling and assignment with difference-in-means estimator for ATE |
| `declaration_2.2.R` | Blocked experiment with sampling | Block random assignment by history covariate with blocked difference-in-means |

### Ch. 4: Getting Started

| File | Design Type | Description |
|------|-------------|-------------|
| `declaration_4.1.R` | Simple two-arm experiment | Basic complete random assignment (N=100, n=50 sampled) estimating PATE via difference-in-means |

### Ch. 5: Declaring Designs

| File | Design Type | Description |
|------|-------------|-------------|
| `declaration_5.1.R` | Observational descriptive | Estimates conditional mean of Y among X=1 subgroup using simple random sampling |

### Ch. 7: Defining the Inquiry

| File | Design Type | Description |
|------|-------------|-------------|
| `declaration_7.1.R` | Multiple inquiries | Distinguishes superpopulation mean, population mean, and sample mean inquiries |

### Ch. 9: Choosing an Answer Strategy

| File | Design Type | Description |
|------|-------------|-------------|
| `declaration_9.1.R` | Small-sample estimation | Estimates population mean age from a sample of 3 using OLS |
| `declaration_9.2.R` | Hypothesis testing | Adds a linear hypothesis test (mean age = 20) to the small-sample design |
| `declaration_9.3.R` | Bayesian estimation | Uses Stan (rstanarm) with informative prior to estimate mean age from small sample |
| `declaration_9.4.R` | Redesign over parameter grid | Redesigns small-sample estimator across a range of true mean values |
| `declaration_9.5.R` | Resampling from real data | Bootstraps from Clingingsmith et al. data to estimate treatment effect on views |
| `declaration_9.6.R` | IPW with blocked assignment | Compares unweighted vs. IPW estimators under complete and unequal block assignment |
| `declaration_9.7.R` | Block-and-cluster randomization | Sharp null test with block-and-cluster assignment and IPW using Foos et al. field data |

### Ch. 10: Diagnosing Designs

| File | Design Type | Description |
|------|-------------|-------------|
| `declaration_10a.R` | Heteroskedasticity diagnosis | Compares classical vs. HC2 standard errors across heteroskedasticity and treatment probability levels |
| `declaration_10.1.R` | Simple two-arm experiment | Basic ATE design (effect=0.2, N=100) for diagnosing estimator properties |
| `declaration_10.2.R` | Random effect size | ATE with random treatment effect drawn uniformly from [0, 0.5] |
| `declaration_10.3.R` | Multiple outcomes | Two models with two outcomes each to diagnose which outcome captures the effect |
| `declaration_10.4.R` | Covariate adjustment comparison | Compares unadjusted vs. covariate-adjusted estimators for precision gains |

### Ch. 11: Redesigning

| File | Design Type | Description |
|------|-------------|-------------|
| `declaration_11.1.R` | Proportion test | Tests whether a binary outcome proportion differs from 0.5 using prop.test |
| `declaration_11.2.R` | Random ATE redesign | ATE experiment with random effect size for power analysis under uncertainty |
| `declaration_11.3.R` | Treatment probability redesign | Parameterizes treatment probability for optimal allocation redesign |
| `declaration_11.4.R` | Polynomial regression | Compares polynomial regression degrees 1-6 for fitting a nonlinear function |
| `declaration_11.5.R` | OLS vs. logit vs. probit | Compares OLS, logit, and probit estimators for binary outcome ATE using marginal effects |

### Ch. 12: Design Example (Voter Mobilization)

| File | Design Type | Description |
|------|-------------|-------------|
| `declaration_12.1a.R` | Multilevel model | Hierarchical model of villages and citizens with three treatment conditions |
| `declaration_12.1b.R` | Inquiry definition | Defines ATEs for personal and social mobilization treatments vs. neutral control |
| `declaration_12.1c.R` | Cluster sampling and assignment | Cluster random sampling of villages, stratified citizen sampling, and cluster random assignment to three arms |
| `declaration_12.1d.R` | Clustered OLS estimation | Estimates personal and social treatment effects with cluster-robust standard errors |

### Ch. 13: Designing in Code

| File | Design Type | Description |
|------|-------------|-------------|
| `declaration_13.1.R` | Basic OLS design | Simple ATE experiment estimated with OLS and tidy summary |
| `declaration_13.2.R` | Modular design construction | Demonstrates building a design from separate components, comparing DIM and OLS |

### Ch. 15: Observational Descriptive (Survey Sampling)

| File | Design Type | Description |
|------|-------------|-------------|
| `declaration_15.1.R` | Simple survey | Estimates population mean from a complete random sample of 100 from 2100 units |
| `declaration_15.2.R` | Survey with nonresponse | Introduces response probability dependent on latent trait to study nonresponse bias |
| `declaration_15.3a.R` | Clustered population (setup) | Fabricates hierarchical population of two Nigerian states with ICC-governed clustering |
| `declaration_15.3b.R` | Budget-constrained sampling (helper) | Budget function trading off cluster vs. individual sampling costs |
| `declaration_15.3c.R` | Stratified cluster sampling | Two-stage stratified cluster sampling with budget constraint and cluster-robust SEs |
| `declaration_15.4.R` | MRP | State-level opinion estimation using partial pooling (glmer) with poststratification weights |
| `declaration_15.5.R` | Pooling comparison for MRP | Adds no-pooling and full-pooling estimators to compare with partial pooling MRP |
| `declaration_15.6.R` | Index construction | Compares measurement index strategies: averaging, adjusted averaging, rescaling, and PCA |

### Ch. 16: Observational Causal

| File | Design Type | Description |
|------|-------------|-------------|
| `declaration_16.1a.R` | Causal model setup (process tracing) | Defines a DAG-based causal model (X→M→Y←W→M) with monotonicity restrictions using CausalQueries |
| `declaration_16.1b.R` | Process tracing estimation | Estimates individual cause of effect using Bayesian process tracing across four data strategies |
| `declaration_16.2.R` | Matching design | Compares exact-matched vs. raw difference-in-means for ATE with confounded treatment |
| `declaration_16.3.R` | Difference-in-differences | Staggered DiD with TWFE and de Chaisemartin estimator for panel data with heterogeneous timing |
| `declaration_16.4.R` | Instrumental variables | IV design with compliers/never-takers estimating LATE via two-stage least squares |
| `declaration_16.5.R` | Regression discontinuity | Sharp RD design with polynomial CEFs and rdrobust bias-corrected estimation |
| `declaration_16.6.R` | RD with local linear | Extends RD design with parametric local linear regression within a bandwidth |

### Ch. 17: Experimental Descriptive

| File | Design Type | Description |
|------|-------------|-------------|
| `declaration_17.1.R` | Audit experiment | Estimates anti-Latino discrimination rate from behavioral types using audit correspondence design |
| `declaration_17.2.R` | Two-level audit experiment | Nested experiment: treatment changes discrimination types, then audit measures rates |
| `declaration_17.3.R` | List experiment | Estimates sensitive-item prevalence using difference-in-means on item counts |
| `declaration_17.4.R` | List vs. direct question | Compares list experiment to direct question with social desirability hiding |
| `declaration_17.5.R` | Conjoint experiment | Forced-choice conjoint measuring AMCEs for gender, party, and region attributes |
| `declaration_17.6_a.R` | Trust game (helper functions) | Defines investment and return decision functions for a trust game |
| `declaration_17.6_b.R` | Trust game experiment | Paired trust game measuring trusting and trustworthiness with possible deception |

### Ch. 18: Experimental Causal

| File | Design Type | Description |
|------|-------------|-------------|
| `declaration_18.1.R` | **Two-arm experiment** | Canonical two-arm RCT with complete random assignment estimating ATE |
| `declaration_18.2.R` | **Lin covariate adjustment** | ATE experiment using Lin's covariate-adjusted estimator (lm_lin) with varying R-squared |
| `declaration_18.3.R` | DIM vs. OLS vs. Lin | Compares difference-in-means, OLS, and Lin estimators under heterogeneous treatment effects |
| `declaration_18.4.R` | **Block randomization with IPW** | Blocked assignment with unequal block probabilities and inverse probability weighting via lm_lin |
| `declaration_18.5.R` | **Cluster randomized trial** | Cluster RCT with varying cluster sizes, high ICC, and block-and-cluster assignment |
| `declaration_18.6.R` | **Heterogeneous effects (CATE)** | Stratified sampling and blocked assignment to estimate conditional ATEs and their difference |
| `declaration_18.7.R` | **2x2 factorial experiment** | Full factorial with two treatments estimating CATEs, marginal ATEs, and interaction effects |
| `declaration_18.8.R` | Noncompliance (IV/ITT/PP) | Encouragement design comparing 2SLS, as-treated, and per-protocol estimators |
| `declaration_18.9a.R` | Noncompliance model (setup) | Defines complier/never-taker model with low compliance rate for CACE estimation |
| `declaration_18.9b.R` | Encouragement design | Estimates CACE via 2SLS under one-sided noncompliance with encouragement |
| `declaration_18.9c.R` | Placebo-controlled design | Estimates CACE by restricting to identified compliers (placebo design) with OLS |
| `declaration_18.10.R` | Stepped-wedge trial | Waitlist/crossover design with staggered rollout and two-way fixed effects estimation |
| `declaration_18.11.R` | **Parameterized experiment** | Simple DIM experiment parameterized by sample size and effect size for power analysis |
| `declaration_18.12.R` | **Saturation design** | Two-factor design varying cluster-level saturation and individual treatment for spillover effects |
| `declaration_18.13.R` | **Spatial interference** | Spatial experiment estimating direct, indirect, and total ATEs with adjacency-based exposure mapping |

### Ch. 19: Complex Designs

| File | Design Type | Description |
|------|-------------|-------------|
| `declaration_19.1.R` | **Causal forest (HTE)** | Uses generalized random forest to discover treatment effect heterogeneity |
| `declaration_19.2.R` | Structural estimation | Structural model of ultimatum bargaining estimating parameters via MLE |
| `declaration_19.3.R` | **Meta-analysis** | Random-effects and fixed-effects meta-analysis estimating pooled mean and heterogeneity |
| `declaration_19.4.R` | **Multi-site trial** | Five-site RCT comparing high vs. low coordination with meta-analytic pooling |

### Ch. 23: Integration (Covariate Adjustment)

| File | Design Type | Description |
|------|-------------|-------------|
| `declaration_23.1a.R` | Model specification (no confounding) | DGP where X is pretreatment non-confounder with independent treatment assignment |
| `declaration_23.1b.R` | Model specification (confounding) | DGP where X is pretreatment confounder affecting both treatment and outcome |
| `declaration_23.1c.R` | Estimator specification | Declares unadjusted and covariate-adjusted OLS estimators for comparison |
| `declaration_23.1d.R` | **Covariate adjustment integration** | Combines three models with two estimators to show when adjustment helps or hurts |

---

## Quick Lookup by Design Need

| If you need... | Start with | Then see |
|----------------|-----------|----------|
| Basic two-arm experiment | `declaration_18.1.R` | `declaration_18.2.R` (add covariates) |
| Factorial experiment (2x2) | `declaration_18.7.R` | `declaration_18.6.R` (CATE estimation) |
| Blocked randomization | `declaration_18.4.R` | `declaration_9.6.R` (IPW with blocks) |
| Cluster randomization | `declaration_18.5.R` | `declaration_12.1c.R` (multi-arm cluster) |
| Noncompliance / encouragement | `declaration_18.8.R` | `declaration_18.9a-c.R` (CACE) |
| Conjoint experiment | `declaration_17.5.R` | — |
| List experiment | `declaration_17.3.R` | `declaration_17.4.R` (vs. direct question) |
| Audit / correspondence study | `declaration_17.1.R` | `declaration_17.2.R` (two-level) |
| Power analysis / redesign | `declaration_18.11.R` | `declaration_11.2.R` (random effect size) |
| Spillover / interference | `declaration_18.12.R` | `declaration_18.13.R` (spatial) |
| HTE / causal forest | `declaration_19.1.R` | — |
| Meta-analysis | `declaration_19.3.R` | `declaration_19.4.R` (multi-site) |
| Covariate adjustment decisions | `declaration_23.1d.R` | `declaration_10.4.R` (precision gains) |
| Difference-in-differences | `declaration_16.3.R` | — |
| Instrumental variables | `declaration_16.4.R` | — |
| Regression discontinuity | `declaration_16.5.R` | `declaration_16.6.R` (local linear) |
| Survey sampling | `declaration_15.1.R` | `declaration_15.3c.R` (stratified cluster) |

---

## Diagnosis and Figure Files

Diagnosis files follow the same numbering scheme in `diagnoses/diagnosis_*.R`. Figure files are in `figures/figure_*.R`. These are useful for understanding what diagnostics to run and how to visualize design properties, but the declaration files are the primary templates for building new designs.
