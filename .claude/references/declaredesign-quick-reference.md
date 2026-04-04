# DeclareDesign Quick Reference

**Source:** Blair, Coppock & Humphreys (2023), *Research Design in the Social Sciences*, Princeton UP
**Full text:** `.claude/references/declaredesign-book.pdf` (PDF) or `.claude/references/declaredesignbook/` (HTML chapters, preferred for agent consumption)
**Replication code:** `.claude/references/declaredesign-replication/replication-materials/code/` (see `replication-code-index.md` for file descriptions)

---

## 1. The MIDA Framework

Every research design has four components. A complete DeclareDesign declaration specifies all four.

**Model (M):** The set of possible states of the world — population structure, background variables, potential outcomes, and the causal relationships between them. The model defines what we assume about the world before we collect data. In code: `declare_model()` with `potential_outcomes()`.

**Inquiry (I):** The question the design aims to answer — a function of the model's unknown quantities. Common inquiries: ATE (average treatment effect), CACE (complier average causal effect), AMCE (average marginal component effect for conjoint), conditional ATEs. In code: `declare_inquiry()`.

**Data Strategy (D):** How units are sampled from the population, how treatment is assigned, and how outcomes are measured. Three sub-components: sampling (`declare_sampling()`), assignment (`declare_assignment()`), and measurement (`declare_measurement()`).

**Answer Strategy (A):** The statistical procedure applied to the data to produce an answer to the inquiry — the estimator. In code: `declare_estimator()`.

*Reference: Ch. 2-4 (HTML files `2 What is a research design...html` through `4 Getting started...html`)*

---

## 2. Core Functions

### `declare_model()`
Defines the population and potential outcomes.

```r
declare_model(
  N = 1000,                              # population size
  U = rnorm(N),                          # unobserved heterogeneity
  X = rbinom(N, 1, 0.5),                 # pre-treatment covariate
  potential_outcomes(Y ~ tau * Z + U)    # PO as function of treatment Z
)
```

For hierarchical/clustered populations, use `add_level()`:
```r
declare_model(
  cluster = add_level(N = 50, cluster_shock = rnorm(N)),
  individual = add_level(N = 20, U = rnorm(N))
)
```

### `declare_inquiry()`
Defines the estimand — what you want to learn.

```r
declare_inquiry(ATE = mean(Y_Z_1 - Y_Z_0))                    # average treatment effect
declare_inquiry(CATE = mean(Y_Z_1[X==1] - Y_Z_0[X==1]))       # conditional ATE
declare_inquiry(ITT = mean(Y_Z_1 - Y_Z_0))                    # intent to treat (same as ATE under full compliance)
```

### `declare_sampling()`
Defines how units are sampled from the population (optional — omit if studying the full population).

```r
declare_sampling(S = complete_rs(N, n = 500))                  # simple random sample
declare_sampling(S = strata_rs(strata = region, n = 100))      # stratified random sample
declare_sampling(S = cluster_rs(clusters = village, n = 20))   # cluster random sample
```

### `declare_assignment()`
Defines treatment assignment. Uses functions from the `randomizr` package.

```r
declare_assignment(Z = complete_ra(N, prob = 0.5))             # simple complete RA
declare_assignment(Z = block_ra(blocks = gender))              # block RA
declare_assignment(Z = cluster_ra(clusters = village))         # cluster RA
declare_assignment(Z = block_and_cluster_ra(                   # block-and-cluster RA
  blocks = region, clusters = village))
```

For factorial designs, declare multiple assignment variables:
```r
declare_assignment(Z1 = complete_ra(N), Z2 = block_ra(Z1))
```

### `declare_measurement()`
Reveals potential outcomes and defines measured variables.

```r
declare_measurement(Y = reveal_outcomes(Y ~ Z))               # reveal PO based on treatment
declare_measurement(Y_obs = Y + rnorm(N, sd = 0.1))           # add measurement error
```

### `declare_estimator()`
Specifies the estimation strategy.

```r
declare_estimator(Y ~ Z, inquiry = "ATE")                     # OLS (default)
declare_estimator(Y ~ Z, .method = difference_in_means,       # DIM from estimatr
                  inquiry = "ATE")
declare_estimator(Y ~ Z, covariates = ~X,                     # Lin covariate-adjusted
                  .method = lm_lin, inquiry = "ATE")
declare_estimator(Y ~ Z, clusters = village,                  # clustered SEs
                  inquiry = "ATE")
```

*Reference: Ch. 5-9 (HTML files `5 Declaring designs...html` through `9 Choosing an answer strategy...html`)*

---

## 3. Diagnosing Designs

### `diagnose_design()`

Runs Monte Carlo simulation to evaluate design properties.

```r
diagnosis <- diagnose_design(design, sims = 500)
```

### Standard Diagnosands

| Diagnosand | Definition | Target |
|------------|-----------|--------|
| **Power** | Pr(reject H₀ \| H₀ false) | >= 0.80 for primary hypothesis |
| **Bias** | E[estimate] - estimand | Near 0 |
| **RMSE** | √(E[(estimate - estimand)²]) | As small as possible |
| **Coverage** | Pr(estimand ∈ CI) | Near 0.95 for 95% CIs |
| **Mean Estimate** | E[estimate] | Close to true estimand |
| **SD Estimate** | SD of estimates across simulations | Measures precision |
| **Type S Error** | Pr(sign wrong \| significant) | Near 0 |
| **Mean Estimand** | E[estimand] (useful when estimand varies) | — |

### Minimum Simulation Iterations

- **500** is the minimum for stable power estimates
- **1000+** recommended for coverage and Type S error
- **5000+** for publication-quality power curves

*Reference: Ch. 10 (HTML file `10 Diagnosing designs...html`)*

---

## 4. Redesigning

### `redesign()`
Modify design parameters to explore the design space.

```r
designs <- redesign(design, N = c(100, 200, 500, 1000))       # vary sample size
diagnoses <- diagnose_designs(designs)                         # diagnose all variants
```

### `compare_designs()`
Compare multiple candidate designs on diagnosands.

```r
comparison <- compare_designs(design_a, design_b, design_c)
```

### Common Redesign Parameters

| Parameter | What It Varies | Useful For |
|-----------|---------------|-----------|
| `N` | Sample size | Power curves |
| `prob` | Treatment probability | Optimal allocation |
| `effect_size` | Treatment effect | MDE analysis |
| `ICC` | Intracluster correlation | Cluster design decisions |
| `n_clusters` | Number of clusters | Cluster power |

*Reference: Ch. 11 (HTML file `11 Redesigning...html`)*

---

## 5. Annotated Templates

### Template 1: Canonical Two-Arm Experiment
*Source: `declaration_18.1.R`*

```r
design <- 
  declare_model(N = 100, U = rnorm(N),
                potential_outcomes(Y ~ 0.2 * Z + U)) +   # effect size = 0.2
  declare_inquiry(ATE = mean(Y_Z_1 - Y_Z_0)) +           # estimand: ATE
  declare_assignment(Z = complete_ra(N, prob = 0.5)) +     # 50/50 randomization
  declare_measurement(Y = reveal_outcomes(Y ~ Z)) +        # reveal observed Y
  declare_estimator(Y ~ Z, inquiry = "ATE")                # OLS estimate
```

### Template 2: Covariate-Adjusted (Lin Estimator)
*Source: `declaration_18.2.R`*

```r
design <- 
  declare_model(N = 100,
    draw_multivariate(c(U, X) ~ MASS::mvrnorm(n = N, mu = c(0,0),
      Sigma = matrix(c(1, sqrt(r_sq), sqrt(r_sq), 1), 2, 2))),
    potential_outcomes(Y ~ 0.1 * Z + U)) +
  declare_inquiry(ATE = mean(Y_Z_1 - Y_Z_0)) +
  declare_assignment(Z = complete_ra(N)) +
  declare_measurement(Y = reveal_outcomes(Y ~ Z)) +
  declare_estimator(Y ~ Z, covariates = ~X,                # Lin estimator
                    .method = lm_lin, inquiry = "ATE")
```

### Template 3: 2x2 Factorial Experiment
*Source: `declaration_18.7.R`*

```r
design <- 
  declare_model(N = 1000, U = rnorm(N),
    potential_outcomes(Y ~ 0.2*Z1 + 0.1*Z2 + 0.1*Z1*Z2 + U,
      conditions = list(Z1 = c(0,1), Z2 = c(0,1)))) +
  declare_inquiry(
    ATE_Z1 = 0.5*mean(Y_Z1_1_Z2_0 - Y_Z1_0_Z2_0) +       # marginal ATE of Z1
              0.5*mean(Y_Z1_1_Z2_1 - Y_Z1_0_Z2_1),
    interaction = mean(Y_Z1_1_Z2_1 - Y_Z1_0_Z2_1) -        # interaction effect
                  mean(Y_Z1_1_Z2_0 - Y_Z1_0_Z2_0)) +
  declare_assignment(Z1 = complete_ra(N), Z2 = block_ra(Z1)) +
  declare_measurement(Y = reveal_outcomes(Y ~ Z1 + Z2)) +
  declare_estimator(Y ~ Z1 + Z2 + Z1*Z2, term = "Z1:Z2",
                    inquiry = "interaction", label = "interaction")
```

### Template 4: Cluster Randomized Trial
*Source: `declaration_18.5.R`*

```r
design <- 
  declare_model(
    cluster = add_level(N = 10,
      cluster_size = rep(seq(10, 50, 10), 2),
      cluster_shock = scale(cluster_size + rnorm(N, sd=5)) * sqrt(ICC)),
    individual = add_level(N = cluster_size,
      individual_shock = rnorm(N, sd = sqrt(1 - ICC)),
      Y_Z_0 = cluster_shock + individual_shock,
      Y_Z_1 = Y_Z_0 + rnorm(N, sd = sqrt(ICC)) + rnorm(N, sd = sqrt(1-ICC)))) +
  declare_inquiry(ATE = mean(Y_Z_1 - Y_Z_0)) +
  declare_assignment(Z = block_and_cluster_ra(clusters = cluster,
                                               blocks = cluster_size)) +
  declare_measurement(Y = reveal_outcomes(Y ~ Z)) +
  declare_estimator(Y ~ Z, clusters = cluster, inquiry = "ATE")
```

### Template 5: Parameterized for Power Analysis
*Source: `declaration_18.11.R`*

```r
# Parameterize N and effect_size for redesign()
design <- 
  declare_model(N = N, U = rnorm(N),
                potential_outcomes(Y ~ effect_size * Z + U)) +
  declare_inquiry(ATE = mean(Y_Z_1 - Y_Z_0)) +
  declare_assignment(Z = complete_ra(N)) +
  declare_measurement(Y = reveal_outcomes(Y ~ Z)) +
  declare_estimator(Y ~ Z, inquiry = "ATE")

# Power curve
designs <- redesign(design, N = seq(100, 1000, 100), effect_size = 0.2)
diagnoses <- diagnose_designs(designs)
```

---

## 6. Chapter-to-HTML File Mapping

| Chapter | HTML File | Topic |
|---------|----------|-------|
| 1 (Preface) | `1 Preface...html` | Motivation and overview |
| 2 | `2 What is a research design...html` | MIDA framework introduction |
| 3 | `3 Research design principles...html` | Core principles |
| 4 | `4 Getting started...html` | First design declaration |
| 5 | `5 Declaring designs...html` | `declare_model`, `declare_inquiry`, etc. |
| 6 | `6 Specifying the model...html` | Model declaration details |
| 7 | `7 Defining the inquiry...html` | Estimand types |
| 8 | `8 Crafting a data strategy...html` | Sampling, assignment, measurement |
| 9 | `9 Choosing an answer strategy...html` | Estimator selection |
| 10 | `10 Diagnosing designs...html` | `diagnose_design()` and diagnosands |
| 11 | `11 Redesigning...html` | `redesign()` and design comparison |
| 12 | `12 Design example...html` | Full worked example (voter mobilization) |
| 13 | `13 Designing in code...html` | Modular code construction |
| 14 | `14 Research Design Library...html` | Library of common designs |
| 15 | `15 Observational : descriptive...html` | Survey sampling, MRP, indices |
| 16 | `16 Observational : causal...html` | DiD, IV, RDD, matching, synthetic control |
| 17 | `17 Experimental : descriptive...html` | Audit, list, conjoint, trust games |
| 18 | `18 Experimental : causal...html` | RCTs, blocking, clustering, factorial, noncompliance, spillovers |
| 19 | `19 Complex designs...html` | Causal forest, structural, meta-analysis |
| 20 | `20 Research Design Lifecycle...html` | Design lifecycle management |
| 21 | `21 Planning...html` | Pre-analysis plans |
| 22 | `22 Realization...html` | Implementation and fielding |
| 23 | `23 Integration...html` | Covariate adjustment, combining evidence |

**Prefer HTML files over the PDF** — they are text-extractable and faster to process.
