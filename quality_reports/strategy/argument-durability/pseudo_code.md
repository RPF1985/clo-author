# Pseudo-Code: Argument Durability Experiment

**Date:** 2026-04-03
**Revised:** 2026-04-03 (Round 2 — specification fixes, conceptual flag for coder)

**[IMPORTANT NOTE FOR CODER — Issue 3.4]:** This entire file is CONCEPTUAL pseudo-code. It illustrates the design logic and target analyses but has known structural simplifications (e.g., the DeclareDesign declaration uses a simplified 2-group model rather than the full 3-arm x 3-disconfirmation x 4-domain structure). The Coder MUST rebuild the actual implementation from scratch using this as a specification guide, NOT as copy-paste source code. Specific issues to rebuild:

1. The multi-level respondent-by-domain structure requires proper nesting in DeclareDesign
2. The three-arm justification condition (pure_norm, pure_prac, hybrid) is not a simple binary
3. Blocking by partisanship x education (6 blocks) needs proper `block_ra()` implementation
4. The within-subject disconfirmation assignment depends on the between-subject justification assignment
5. The primary specification estimates $\beta_4$ and $\beta_5$ separately (not a single pooled interaction)

---

## 1. DeclareDesign Declaration (Conceptual Specification)

```r
library(DeclareDesign)
library(estimatr)
library(fabricatr)
library(randomizr)

# ==============================================================
# Parameters
# ==============================================================

N_respondents <- 2100     # pre-exclusion target
n_domains     <- 3        # policy domains per respondent
sigma         <- 1        # outcome SD (standardized)
tau_disconfirm <- -0.50   # main effect: matched disconfirmation on support
tau_norm_interaction <- 0.20  # Hybrid x NormDisconf interaction
tau_prac_interaction <- 0.20  # Hybrid x PracDisconf interaction
rho_respondent <- 0.40    # ICC: within-person correlation across domains
pre_post_r    <- 0.60     # pre-post attitude correlation
exclusion_rate <- 0.07    # expected exclusion rate

# ==============================================================
# Model (M): Data Generating Process
# ==============================================================
# CONCEPTUAL -- Coder must implement proper multi-level structure

model <- declare_model(
  # Level 1: Respondents
  respondents = add_level(
    N = round(N_respondents * (1 - exclusion_rate)),
    partisanship = sample(c("Dem", "Rep", "Ind"), N, replace = TRUE,
                          prob = c(0.35, 0.30, 0.35)),
    education = sample(c("college", "no_college"), N, replace = TRUE),
    pol_knowledge = rnorm(N),
    nfc = rnorm(N),
    U_i = rnorm(N, sd = sqrt(rho_respondent))
  ),
  # Level 2: Domain-observations (3 per respondent)
  observations = add_level(
    N = n_domains,
    domain = sample(c("war", "trade", "climate", "immigration"), n_domains,
                    replace = FALSE),
    U_ij = rnorm(n_domains * N_respondents, sd = sqrt(1 - rho_respondent)),
    # Pre-treatment attitude (centered at 4 on 7-pt scale)
    Y_pre = 4 + 0.3 * U_i + 0.5 * U_ij + rnorm(n_domains * N_respondents, sd = 0.3)
  )
)

# ==============================================================
# Assignment (D): Randomization
# ==============================================================

# Between-subjects: justification type (blocked by partisanship x education)
# Conditions: pure_norm, pure_prac, hybrid
# (Plus small T0 baseline group, N=75 -- handle separately)
assignment_justification <- declare_assignment(
  Z_justification = block_ra(
    blocks = paste(partisanship, education),
    conditions = c("pure_norm", "pure_prac", "hybrid")
  )
)

# Within-subjects: disconfirmation type (varies across domains within person)
# For hybrid: {norm_disconfirm, prac_disconfirm, control} across 3 domains
# For pure_norm: {norm_disconfirm, prac_disconfirm, control}
# For pure_prac: {prac_disconfirm, norm_disconfirm, control}
# NOTE: Coder must implement conditional assignment logic
assignment_disconfirmation <- declare_assignment(
  Z_disconfirmation = block_ra(
    blocks = respondents,
    conditions = c("norm_disconfirm", "prac_disconfirm", "control")
  )
)

# ==============================================================
# Measurement and Derived Variables
# ==============================================================

measurement <- declare_measurement(
  # Derived treatment indicators
  is_hybrid = as.numeric(Z_justification == "hybrid"),
  norm_disconf = as.numeric(Z_disconfirmation == "norm_disconfirm"),
  prac_disconf = as.numeric(Z_disconfirmation == "prac_disconfirm"),

  # Post-disconfirmation outcome (DGP)
  Y_post = Y_pre +
    tau_disconfirm * (norm_disconf + prac_disconf) +
    tau_norm_interaction * is_hybrid * norm_disconf +
    tau_prac_interaction * is_hybrid * prac_disconf +
    rnorm(N, sd = 0.5),

  # Change score
  Delta_Y = Y_post - Y_pre,

  # Mechanism measures
  surviving_credibility = 5 +
    -0.3 * is_hybrid * (norm_disconf + prac_disconf) +
    rnorm(N, sd = 1),
  surviving_importance = 5 +
    0.2 * is_hybrid * (norm_disconf + prac_disconf) +
    rnorm(N, sd = 1)
)

# ==============================================================
# Inquiry (I): Estimands -- SEPARATE for each disconfirmation type
# ==============================================================

inquiry_beta4 <- declare_inquiry(
  beta_4 = mean(
    Delta_Y[is_hybrid == 1 & norm_disconf == 1] -
    Delta_Y[is_hybrid == 0 & norm_disconf == 1]
  ),
  label = "H1: Hybrid x NormDisconf"
)

inquiry_beta5 <- declare_inquiry(
  beta_5 = mean(
    Delta_Y[is_hybrid == 1 & prac_disconf == 1] -
    Delta_Y[is_hybrid == 0 & prac_disconf == 1]
  ),
  label = "H1: Hybrid x PracDisconf"
)

# ==============================================================
# Answer Strategy (A): Estimators
# ==============================================================

# Primary: ANCOVA with SEPARATE interaction terms
estimator_primary <- declare_estimator(
  Y_post ~ is_hybrid * norm_disconf + is_hybrid * prac_disconf + Y_pre,
  clusters = respondents,
  model = lm_robust,
  se_type = "CR2",
  term = "is_hybrid:norm_disconf",
  inquiry = "beta_4",
  label = "Primary: ANCOVA (beta_4)"
)

estimator_primary_b5 <- declare_estimator(
  Y_post ~ is_hybrid * norm_disconf + is_hybrid * prac_disconf + Y_pre,
  clusters = respondents,
  model = lm_robust,
  se_type = "CR2",
  term = "is_hybrid:prac_disconf",
  inquiry = "beta_5",
  label = "Primary: ANCOVA (beta_5)"
)

# Robustness 1: Change score
estimator_change <- declare_estimator(
  Delta_Y ~ is_hybrid * norm_disconf + is_hybrid * prac_disconf,
  clusters = respondents,
  model = lm_robust,
  se_type = "CR2",
  term = "is_hybrid:norm_disconf",
  inquiry = "beta_4",
  label = "Robustness: Change Score (beta_4)"
)

# ==============================================================
# Full Design
# ==============================================================

design <- model + assignment_justification + assignment_disconfirmation +
  measurement + inquiry_beta4 + inquiry_beta5 +
  estimator_primary + estimator_primary_b5 + estimator_change

# ==============================================================
# Diagnosis
# ==============================================================

diagnosis <- diagnose_design(design, sims = 1000)
print(diagnosis)

# ==============================================================
# Power Curves -- Coder implements these
# ==============================================================

# Curve 1: Power vs N
designs_N <- redesign(design, N_respondents = seq(500, 3000, 250))
diag_N <- diagnose_designs(designs_N, sims = 500)

# Curve 2: Power vs effect size (vary both interactions together)
designs_tau <- redesign(design,
                        tau_norm_interaction = seq(0.05, 0.40, 0.05),
                        tau_prac_interaction = seq(0.05, 0.40, 0.05))
diag_tau <- diagnose_designs(designs_tau, sims = 500)

# Curve 3: Power vs ICC
designs_rho <- redesign(design, rho_respondent = seq(0.1, 0.7, 0.1))
diag_rho <- diagnose_designs(designs_rho, sims = 500)

# Curve 4: TOST power at three bound levels
# Coder: implement custom TOST estimator within DeclareDesign
# Bounds: +/- 0.10, 0.15, 0.20 SD
```

---

## 2. Primary Analysis Script (Post-Data Collection)

```r
library(tidyverse)
library(estimatr)
library(lme4)
library(lmerTest)
library(mediation)
library(TOSTER)

# ==============================================================
# Data Loading and Preparation
# ==============================================================

df <- read_csv("data/cleaned/argument_durability_main.csv")

# Apply pre-registered exclusion criteria
df_analysis <- df %>%
  filter(
    attn_check_pass >= 1,           # pass at least 1 of 2 attention checks
    completion_time > median_time / 3, # not a speeder
    !is.na(Y_post),                 # completed the study
    !duplicated(prolific_id)         # no duplicates
  )

# Derived variables
df_analysis <- df_analysis %>%
  mutate(
    is_hybrid = as.numeric(justification_condition == "hybrid"),
    norm_disconf = as.numeric(disconfirmation_type == "norm_disconfirm"),
    prac_disconf = as.numeric(disconfirmation_type == "prac_disconfirm"),
    # Pooled matched indicator (for secondary specification only)
    matched = case_when(
      justification_condition == "pure_norm" &
        disconfirmation_type == "norm_disconfirm" ~ 1,
      justification_condition == "pure_prac" &
        disconfirmation_type == "prac_disconfirm" ~ 1,
      justification_condition == "hybrid" &
        disconfirmation_type %in% c("norm_disconfirm", "prac_disconfirm") ~ 1,
      TRUE ~ 0
    ),
    Delta_Y = Y_post - Y_pre
  )

# ==============================================================
# H1: Primary Specification (ANCOVA, separate interactions)
# ==============================================================

h1_primary <- lm_robust(
  Y_post ~ is_hybrid * norm_disconf + is_hybrid * prac_disconf +
    Y_pre + factor(domain),
  data = df_analysis,
  clusters = respondent_id,
  se_type = "CR2"
)
summary(h1_primary)
# Coefficients of interest:
#   beta_4 = is_hybrid:norm_disconf
#   beta_5 = is_hybrid:prac_disconf

# H4 test: Wald test of beta_4 = beta_5
library(car)
linearHypothesis(h1_primary, "is_hybrid:norm_disconf = is_hybrid:prac_disconf")

# ==============================================================
# H1: Robustness 1 -- Change Score (first robustness check)
# ==============================================================

h1_change <- lm_robust(
  Delta_Y ~ is_hybrid * norm_disconf + is_hybrid * prac_disconf +
    factor(domain),
  data = df_analysis,
  clusters = respondent_id,
  se_type = "CR2"
)

# ==============================================================
# H1: Robustness 2 -- Pooled Interaction (secondary, conditional on H4)
# ==============================================================

# Run ONLY if H4 Wald test p > 0.10
h1_pooled <- lm_robust(
  Y_post ~ is_hybrid * matched + Y_pre + factor(domain),
  data = df_analysis,
  clusters = respondent_id,
  se_type = "CR2"
)

# ==============================================================
# H1: Robustness 3 -- Multilevel Model
# ==============================================================

h1_mlm <- lmer(
  Y_post ~ is_hybrid * norm_disconf + is_hybrid * prac_disconf +
    Y_pre + factor(domain) + (1 | respondent_id),
  data = df_analysis
)
summary(h1_mlm)

# ==============================================================
# H1: Robustness 4 -- First Scenario Only (between-subjects)
# ==============================================================

df_first <- df_analysis %>%
  filter(scenario_position == 1)

h1_first <- lm_robust(
  Y_post ~ is_hybrid * norm_disconf + is_hybrid * prac_disconf + Y_pre,
  data = df_first,
  se_type = "HC2"
)

# CONFIRMATORY H4 test (first-scenario only, no carryover)
linearHypothesis(h1_first, "is_hybrid:norm_disconf = is_hybrid:prac_disconf")

# ==============================================================
# H1c: Equivalence Test (TOST) at THREE bound levels
# ==============================================================

# For beta_4
beta4 <- coef(h1_primary)["is_hybrid:norm_disconf"]
se4 <- sqrt(vcov(h1_primary)["is_hybrid:norm_disconf", "is_hybrid:norm_disconf"])

# For beta_5
beta5 <- coef(h1_primary)["is_hybrid:prac_disconf"]
se5 <- sqrt(vcov(h1_primary)["is_hybrid:prac_disconf", "is_hybrid:prac_disconf"])

# TOST at three bound levels for each beta
bounds <- c(0.10, 0.15, 0.20)
tost_results <- map(bounds, function(b) {
  list(
    beta4_tost = TOSTone(
      m = beta4, mu = 0,
      sd = se4 * sqrt(nobs(h1_primary)),
      n = nobs(h1_primary),
      low_eqbound_d = -b, high_eqbound_d = b, alpha = 0.05
    ),
    beta5_tost = TOSTone(
      m = beta5, mu = 0,
      sd = se5 * sqrt(nobs(h1_primary)),
      n = nobs(h1_primary),
      low_eqbound_d = -b, high_eqbound_d = b, alpha = 0.05
    )
  )
})
names(tost_results) <- paste0("bounds_", bounds)

# ==============================================================
# H1c: Additivity weight test (confirmatory: w_k = 0.5)
# ==============================================================

# Confirmatory: test whether hybrid decline = 0.5 * pure decline
# For normative disconfirmation:
hybrid_norm_decline <- mean(df_analysis$Delta_Y[
  df_analysis$is_hybrid == 1 & df_analysis$norm_disconf == 1])
pure_norm_decline <- mean(df_analysis$Delta_Y[
  df_analysis$justification_condition == "pure_norm" &
  df_analysis$norm_disconf == 1])

additivity_test_norm <- hybrid_norm_decline - 0.5 * pure_norm_decline
# SE via delta method or bootstrap

# Exploratory: estimate w_k from T0 baseline
df_t0 <- df_analysis %>% filter(justification_condition == "no_justification")
baseline_support <- mean(df_t0$Y_pre)
pure_norm_support <- mean(df_analysis$Y_pre[
  df_analysis$justification_condition == "pure_norm"])
hybrid_support <- mean(df_analysis$Y_pre[
  df_analysis$justification_condition == "hybrid"])
w_norm_estimated <- (pure_norm_support - baseline_support) /
                    (hybrid_support - baseline_support)
# Report as exploratory

# ==============================================================
# H3: Cross-Domain Generality
# ==============================================================

h3_test <- lm_robust(
  Y_post ~ is_hybrid * norm_disconf * factor(domain) +
           is_hybrid * prac_disconf * factor(domain) + Y_pre,
  data = df_analysis,
  clusters = respondent_id,
  se_type = "CR2"
)
# Joint F-test on domain interaction terms

# Domain-specific estimates
domain_effects <- df_analysis %>%
  group_by(domain) %>%
  group_map(~ lm_robust(
    Y_post ~ is_hybrid * norm_disconf + is_hybrid * prac_disconf + Y_pre,
    data = .x, se_type = "HC2"
  ))

# ==============================================================
# H4: Symmetry (Confirmatory: first-scenario-only)
# ==============================================================

# Confirmatory test already computed above in h1_first
# Supplementary: within-subject version
h4_within <- linearHypothesis(
  h1_primary,
  "is_hybrid:norm_disconf = is_hybrid:prac_disconf"
)

# ==============================================================
# H5: Mechanism (Causal Mediation) -- SUGGESTIVE
# ==============================================================

# NOTE: Sequential ignorability assumption stated explicitly.
# Results framed as suggestive, not definitive causal claims.

# H5a: Credibility cascade
med_model_5a <- lm(
  surviving_credibility ~ is_hybrid * norm_disconf + is_hybrid * prac_disconf +
    Y_pre + factor(domain),
  data = df_analysis
)
out_model_5a <- lm(
  Y_post ~ surviving_credibility + is_hybrid * norm_disconf +
    is_hybrid * prac_disconf + Y_pre + factor(domain),
  data = df_analysis
)
mediation_5a <- mediate(
  med_model_5a, out_model_5a,
  treat = "norm_disconf", mediator = "surviving_credibility",
  sims = 1000
)

# Sensitivity analysis for sequential ignorability
sens_5a <- medsens(mediation_5a)
# Report rho at which ACME crosses zero

# H5b: Anchoring/compensation
med_model_5b <- lm(
  surviving_importance ~ is_hybrid * norm_disconf + is_hybrid * prac_disconf +
    Y_pre + factor(domain),
  data = df_analysis
)
out_model_5b <- lm(
  Y_post ~ surviving_importance + is_hybrid * norm_disconf +
    is_hybrid * prac_disconf + Y_pre + factor(domain),
  data = df_analysis
)
mediation_5b <- mediate(
  med_model_5b, out_model_5b,
  treat = "norm_disconf", mediator = "surviving_importance",
  sims = 1000
)
sens_5b <- medsens(mediation_5b)

# ==============================================================
# Falsification Tests
# ==============================================================

# F1: Irrelevant disconfirmation should not reduce support for pure
df_f1 <- df_analysis %>%
  filter(is_hybrid == 0, matched == 0)  # pure + irrelevant
df_f1_ctrl <- df_analysis %>%
  filter(is_hybrid == 0, disconfirmation_type == "control")

f1_test <- t.test(df_f1$Delta_Y, df_f1_ctrl$Delta_Y)

# F5: Hypothetical evaluation of non-presented justification
# (See falsification_tests.md for revised wording)

# F6: Matched disconfirmation should reduce support for pure (sanity check)
df_f6_matched <- df_analysis %>%
  filter(is_hybrid == 0, matched == 1)
df_f6_ctrl <- df_analysis %>%
  filter(is_hybrid == 0, disconfirmation_type == "control")

f6_test <- t.test(df_f6_matched$Delta_Y, df_f6_ctrl$Delta_Y,
                  alternative = "less")

# ==============================================================
# Multiple Comparisons Adjustment
# ==============================================================

# Primary family: H1 (beta_4 and beta_5)
p_primary <- c(
  beta_4 = summary(h1_primary)$coefficients["is_hybrid:norm_disconf", "Pr(>|t|)"],
  beta_5 = summary(h1_primary)$coefficients["is_hybrid:prac_disconf", "Pr(>|t|)"]
)
p_primary_adjusted <- p.adjust(p_primary, method = "BH")

# Mechanism family: H5a, H5b
p_mechanism <- c(
  H5a = summary(mediation_5a)$d0.p,
  H5b = summary(mediation_5b)$d0.p
)
p_mechanism_adjusted <- p.adjust(p_mechanism, method = "BH")

# Report BOTH corrected and uncorrected for all families
```

---

## 3. Specification Curve (Robustness Check 13)

```r
library(specr)

# Define specification space
# NOTE: Now includes separate vs pooled interaction dimension
specs <- run_specs(
  df = df_analysis,
  y = c("Y_post", "Delta_Y"),
  x = c("is_hybrid:norm_disconf", "is_hybrid:prac_disconf",
        "is_hybrid:matched"),  # pooled version
  model = c("lm", "glm"),
  controls = list(
    c("Y_pre"),
    c("Y_pre", "factor(domain)"),
    c("Y_pre", "factor(domain)", "pol_knowledge", "nfc")
  ),
  subsets = list(
    all = TRUE,
    first_scenario = df_analysis$scenario_position == 1,
    pass_both_attn = df_analysis$attn_check_pass == 2,
    exclude_extreme = df_analysis$Y_pre > 1 & df_analysis$Y_pre < 7
  )
)

plot_specs(specs)
```

---

## Revision Log

| Change | Reason | Section |
|--------|--------|---------|
| Added conceptual-only warning | Issue 3.4: pseudo-code has structural simplifications; coder must rebuild | Header, Section 1 |
| Primary spec now estimates beta_4, beta_5 separately | Issue 2.1: pooled interaction made H1 dependent on H4 | Sections 1, 2 |
| Pooled spec is secondary, conditional on H4 | Issue 2.1 | Section 2 |
| Change-score is labeled as first robustness, not primary | Issue 2.4 | Section 2 |
| TOST at three bound levels | Issue 3.1 | Section 2 |
| Added additivity weight test with w_k = 0.5 confirmatory | Issue 2.3 | Section 2 |
| Added T0 baseline w_k estimation as exploratory | Issue 2.3 | Section 2 |
| H4 confirmatory uses first-scenario-only | Issue 2.6 | Section 2 |
| Mediation includes sensitivity analysis | Issue 3.2 | Section 2 |
| Removed gain arm / H2 code | Issue 2.5: H2 deferred | Section 2 |
| Reports both corrected and uncorrected p-values | Issue 3.3 | Section 2 |
| Spec curve includes extreme-attitude subset | Issue 4.2 | Section 3 |
