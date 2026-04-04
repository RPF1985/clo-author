# Power Analysis: Argument Durability Under Partial Disconfirmation

**Date:** 2026-04-03
**Revised:** 2026-04-03 (Round 2 — gain arm dropped, N reallocated, TOST power addressed)
**Framework:** DeclareDesign (Blair, Coppock, Humphreys 2023)

---

## 1. Effect Size Calibration

### Adjacent Literature Benchmarks

| Source | Effect | Size (Cohen's d) | Context |
|--------|--------|-------------------|---------|
| Chan et al. (2017) meta-analysis | Belief perseverance | d = 0.23 [0.12, 0.34] | k = 52, N = 6,878; persistence after discrediting |
| Obermaier & Koch (2024) | Averaging/dilution | d = 0.30-0.50 | Adding weak arguments reduces strong argument persuasion |
| Weaver et al. (2012) | Presenter's Paradox | d = 0.35-0.55 | Evaluators average rather than add across multiple studies |
| Chong & Druckman (2007) | Competing frame effects | d = 0.20-0.40 | Counterframe effects on opinion in political domains |
| Wood & Porter (2019) | Correction effects | d = 0.10-0.30 | Factual corrections shift attitudes modestly |
| Tomz & Weeks (2013) | Vignette treatment effects | d = 0.15-0.35 | War support experiments with factorial design |

### Target Effect Sizes

The key estimands are the **two separate structural interaction effects** ($\beta_4$: Hybrid x NormDisconf; $\beta_5$: Hybrid x PracDisconf). These are interaction effects, which are typically smaller than main effects.

- **Optimistic:** d = 0.25 (half the averaging main effect, comparable to perseverance)
- **Expected:** d = 0.20 (consistent with interaction effects in political psychology)
- **Pessimistic:** d = 0.15 (at the lower bound of detectable effects with reasonable N)

**Primary power target: 80% power to detect d = 0.20 for each interaction effect at alpha = 0.05.**

### Minimum Detectable Effect (MDE)

For the H1c equivalence test (TOST with bounds at +/- 0.15 SD): we need 80% power to reject the null of a meaningful effect when the true effect is zero. This requires approximately 70% larger N than the standard superiority test at the same alpha.

---

## 2. Sample Size Derivation

### Analytic Power Calculation (Between-Subjects Component)

For the core comparison (Hybrid vs. Pure, within one disconfirmation type):

- Effect size: d = 0.20
- Alpha: 0.05 (two-sided)
- Power: 0.80
- Design: Two-group comparison (Hybrid + NormDisconf vs. PureNorm + NormDisconf)

Required N per group for detecting d = 0.20:

$$N_{group} = \frac{(z_{1-\alpha/2} + z_{1-\beta})^2 \cdot 2 \cdot \sigma^2}{d^2} = \frac{(1.96 + 0.84)^2 \cdot 2}{0.04} = \frac{7.84 \cdot 2}{0.04} \approx 392 \text{ per group}$$

This is for a pure between-subjects design with NO within-subject replication and NO ANCOVA.

### Power Gain from Within-Subject Replication

Each respondent provides 3 domain-level observations. The effective N depends on the within-person correlation ($\rho$) across domains:

$$N_{effective} = N_{respondents} \times \frac{m}{1 + (m-1)\rho}$$

where $m = 3$ domains. With $\rho = 0.40$ (estimated correlation of attitude changes across domains for the same person -- moderate, as different policy domains elicit partially independent reactions):

$$N_{effective} = N_{respondents} \times \frac{3}{1 + 2(0.40)} = N_{respondents} \times 1.67$$

This gives approximately a 67% boost in effective sample size.

### ANCOVA Efficiency Gain

Using ANCOVA (controlling for Y_pre) further reduces required N. With pre-post correlation $r = 0.60$ (typical for political attitude measures over short intervals):

$$N_{ANCOVA} = N_{raw} \times (1 - r^2) = N_{raw} \times 0.64$$

### Combined Requirement Per Cell

$$N_{cell} \approx 392 \times 0.64 / 1.67 \approx 150 \text{ respondents per cell}$$

**[REVISION NOTE]:** The analytic calculation now yields ~150/cell as the minimum. The revised allocation of ~250/cell provides substantial headroom, addressing the critic's concern about the power shortfall. At 250/cell, power for the primary interaction exceeds 90% at d = 0.20. This also provides adequate power for the TOST equivalence test (see Section 5).

### Recommended Allocation (Revised)

**[REVISION NOTE — Issue 2.2]:** Gain arm dropped. Freed respondents reallocated to core cells.

| Cell Group | Cells | N per cell | Subtotal |
|------------|-------|------------|----------|
| Core treatment (6 cells) | 1-6 | 250 | 1,500 |
| Hybrid control | 7 | 200 | 200 |
| Pure controls | 8-9 | 100 | 200 |
| No-justification baseline | 10 | 75 | 75 |
| **Total** | | | **~1,975** |

**Round up to N = 2,100** to account for exclusions (~7% expected from attention checks, speeders, comprehension failures).

**Effective N for analysis after exclusions: ~1,950**

**Comparison to Round 1:**
- Round 1: 200/cell across 6 core cells + 300 in gain arm = 1,900 target → 200/cell for primary test
- Round 2: 250/cell across 6 core cells + 475 in controls/baseline = 1,975 target → 250/cell for primary test
- **Net gain: +50/cell (+25%) for the primary test with 100 fewer total respondents**

---

## 3. DeclareDesign Declaration (Revised)

**[NOTE FOR CODER — Issue 3.4]:** This is CONCEPTUAL pseudo-code. The DeclareDesign specification below illustrates the design structure and target diagnostics but has known structural simplifications. The Coder must rebuild the actual implementation from scratch, handling: (1) the multi-level respondent-by-domain structure, (2) the three-arm justification condition (not just 2x2), (3) proper blocking, and (4) the separate $\beta_4$/$\beta_5$ estimation. Do NOT copy-paste this into the analysis script.

```r
library(DeclareDesign)
library(estimatr)

# ==============================================================
# Design Declaration: Argument Durability Experiment (Revised)
# ==============================================================

# Parameters
N_total <- 2100           # recruit total (pre-exclusion)
n_domains <- 3            # domains per respondent
rho_within <- 0.40        # within-person correlation across domains
pre_post_r <- 0.60        # pre-post attitude correlation
tau_norm_interaction <- 0.20  # structural interaction: Hybrid x NormDisconf
tau_prac_interaction <- 0.20  # structural interaction: Hybrid x PracDisconf
tau_disconfirm <- -0.50   # main effect of matched disconfirmation
sigma <- 1                # outcome SD (standardized)
exclusion_rate <- 0.07    # expected exclusion rate

# --- Conceptual Model ---
# Respondent-level:
#   - Justification condition: pure_norm, pure_prac, hybrid (between-subjects)
#   - Covariates: partisanship, education, pol_knowledge, NFC
#
# Domain-level (3 per respondent):
#   - Disconfirmation type: norm_disconfirm, prac_disconfirm, control (within-subjects)
#   - Domain: war, trade, climate, immigration (3 of 4 assigned)
#
# Potential outcomes:
#   Y_post = rho * Y_pre + tau_disconfirm * matched_disconfirm
#            + tau_norm_interaction * hybrid * norm_disconfirm
#            + tau_prac_interaction * hybrid * prac_disconfirm
#            + U_respondent + U_domain + epsilon

# --- Simplified 2-group declaration for power ---
# (Coder: expand to full 3-arm x 3-disconfirmation x 4-domain structure)

design <- declare_model(
  N = round(N_total * (1 - exclusion_rate)),
  U = rnorm(N),
  Y_pre = 4 + rnorm(N, sd = sigma),
  potential_outcomes(
    Y_post ~ pre_post_r * Y_pre +
      tau_disconfirm * Z_matched +
      tau_norm_interaction * Z_hybrid * Z_norm_disconf +
      U,
    conditions = list(
      Z_hybrid = c(0, 1),
      Z_matched = c(0, 1),
      Z_norm_disconf = c(0, 1)
    )
  )
) +

# --- Inquiries ---
declare_inquiry(
  beta_4 = mean(
    (Y_post_Z_hybrid_1_Z_matched_1_Z_norm_disconf_1 -
     Y_post_Z_hybrid_1_Z_matched_0_Z_norm_disconf_0) -
    (Y_post_Z_hybrid_0_Z_matched_1_Z_norm_disconf_1 -
     Y_post_Z_hybrid_0_Z_matched_0_Z_norm_disconf_0)
  ),
  label = "H1: Hybrid x NormDisconf Interaction"
) +

# --- Assignment ---
declare_assignment(
  Z_hybrid = complete_ra(N, prob = 0.5),
  Z_matched = complete_ra(N, prob = 0.67),
  Z_norm_disconf = complete_ra(N, prob = 0.5)
) +

# --- Measurement ---
declare_measurement(
  Y_post = reveal_outcomes(Y_post ~ Z_hybrid + Z_matched + Z_norm_disconf)
) +

# --- Estimator: ANCOVA with separate interactions ---
declare_estimator(
  Y_post ~ Z_hybrid * Z_norm_disconf + Y_pre,
  term = "Z_hybrid:Z_norm_disconf",
  model = lm_robust,
  inquiry = "beta_4",
  label = "Primary: ANCOVA (Hybrid x NormDisconf)"
)

# ==============================================================
# Diagnosis
# ==============================================================

diagnosis <- diagnose_design(design, sims = 1000)
print(diagnosis)

# Expected output (revised):
# - Power for beta_4: ~0.90 at d = 0.20 with 250/cell
# - Bias: ~0 (randomized experiment)
# - Coverage: ~0.95
# - Type S error: <0.01
```

---

## 4. Power Curves

The Coder should generate power curves varying:

### Curve 1: Power vs. N for primary interaction effect

```r
# Vary N from 500 to 3000 in steps of 250
designs <- redesign(design, N_total = seq(500, 3000, 250))
power_curve <- diagnose_designs(designs, sims = 500)
# Plot: x = N, y = power, horizontal line at 0.80
# Mark N = 2100 (our target) on the curve
```

### Curve 2: Power vs. Effect Size at fixed N = 2100

```r
# Vary tau_norm_interaction from 0.05 to 0.40 in steps of 0.05
designs <- redesign(design, tau_norm_interaction = seq(0.05, 0.40, 0.05))
mde_curve <- diagnose_designs(designs, sims = 500)
# Plot: x = effect size, y = power, horizontal line at 0.80
```

### Curve 3: Power vs. within-person correlation

```r
# Vary rho_within from 0.1 to 0.7 in steps of 0.1
designs <- redesign(design, rho_within = seq(0.1, 0.7, 0.1))
rho_curve <- diagnose_designs(designs, sims = 500)
# Plot: x = rho, y = power; shows value of within-subject replication
```

### Curve 4: Power for equivalence test (H1c) — TOST at three bound levels

```r
# TOST with equivalence bounds +/- 0.10, 0.15, 0.20 SD
# True effect = 0
# Vary N from 1000 to 4000
# Plot three curves (one per bound level)
# Mark our target N = 2100
```

---

## 5. Power for Each Hypothesis (Revised)

**[REVISION NOTE — Issue 2.2]:** Updated power estimates reflect N = 2,100 (pre-exclusion), ~250/cell for core cells, and gain arm dropped.

| Hypothesis | Test Type | Expected Effect | Power at N = 2,100 | Notes |
|------------|-----------|-----------------|---------------------|-------|
| H1 ($\beta_4$: Hybrid x NormDisconf) | Two-sided t-test on interaction | d = 0.20 | ~0.90 | Primary test; 250/cell provides headroom |
| H1 ($\beta_5$: Hybrid x PracDisconf) | Two-sided t-test on interaction | d = 0.20 | ~0.90 | Primary test; symmetric design |
| H1c (equivalence at $\pm 0.15$ SD) | TOST | d = 0.00 | ~0.80 | Adequate at 250/cell (was ~0.70 at 200/cell) |
| H1c (equivalence at $\pm 0.10$ SD) | TOST | d = 0.00 | ~0.60 | Strict bound; report honestly as sensitivity |
| H1c (equivalence at $\pm 0.20$ SD) | TOST | d = 0.00 | ~0.90 | Liberal bound |
| H3 (cross-domain) | Interaction: treatment x domain | d = 0.10 (heterogeneity) | ~0.55 | Underpowered for small heterogeneity -- expected; null is desired |
| H4 (symmetry: $\beta_4 = \beta_5$) | Wald test + equivalence | d = 0.00 | ~0.75 (first-scenario-only); ~0.85 (within-subject) | Confirmatory uses first-scenario; within-subject is supplementary |
| H5a/H5b (mechanisms) | Mediation analysis | Indirect effect ~0.05-0.10 | ~0.65 | Mediation always underpowered; framed as suggestive |

### Implications (Revised)

- **H1** is now well-powered at ~90% for d = 0.20 (up from ~80% in Round 1)
- **H1c equivalence at $\pm 0.15$ SD** is now adequately powered at ~80% (up from ~70%)
- **H1c at strict bounds ($\pm 0.10$ SD)** remains modestly powered -- this is inherent and reported honestly
- **H4** is adequately powered using the within-subject version (~85%); the first-scenario-only confirmatory test has lower power (~75%) but cleaner identification
- **H2 is deferred** -- the gain arm has been dropped, so H2 is not tested in this study
- **H5** mediation remains suggestive -- this is standard for single-study mediation
- **If pilot data suggest smaller effects (d < 0.15):** increase N to 2,800 or simplify to 2 domains

---

## 6. Sensitivity to Assumptions (Revised)

| Assumption | Optimistic | Baseline | Pessimistic | Impact on N |
|------------|-----------|----------|-------------|-------------|
| Interaction effect size | d = 0.25 | d = 0.20 | d = 0.15 | 1,300 / 2,100 / 3,800 |
| Within-person correlation | rho = 0.30 | rho = 0.40 | rho = 0.50 | Power gain: 77% / 67% / 58% |
| Pre-post correlation | r = 0.70 | r = 0.60 | r = 0.50 | ANCOVA gain: 51% / 64% / 75% of raw N |
| Exclusion rate | 3% | 7% | 12% | Recruit 2,060 / 2,100 / 2,270 |

**Recommendation:** Recruit N = 2,100 to provide a buffer against higher-than-expected exclusion rates and potentially smaller effects. Cost at $2.50/respondent on Prolific: ~$5,250 + platform fees.

---

## 7. Cost-Benefit of Further Simplifications

If budget is constrained beyond the revised design:

| Simplification | N Saved | Power Trade-off |
|----------------|---------|-----------------|
| Reduce to 2 domains | ~0 (same respondents, fewer observations) | H3 weaker; ~15% power reduction for primary |
| Drop control cells (8-9) | ~200 | Lose pure-control baseline; can still estimate from mismatched cells (2, 4) |
| Drop T0 baseline | ~75 | Lose external anchor for $w_k$; H1c confirmatory test unaffected (uses $w_k = 0.5$) |
| Combine into 4-cell design (drop symmetry) | ~600 | Lose H4; primary test unaffected |

**Minimum viable design:** 4 core cells (hybrid + matched, hybrid + irrelevant, pure + matched, pure + irrelevant) x 2 domains, N = 1,200. Tests H1 only. Not recommended -- the theoretical contribution requires H3-H5.

---

## Revision Log

| Change | Reason | Impact |
|--------|--------|--------|
| Dropped gain arm (Cells 10-11 from Round 1) | Issue 2.2 (power), Issue 2.5 (confound) | Freed ~300 respondents; H2 deferred |
| Reallocated to core cells: 200 -> 250/cell | Issue 2.2 | Primary power ~80% -> ~90%; TOST power ~70% -> ~80% |
| Added T0 baseline (Cell 10, N=75) | Issue 2.3, 2.7 | External anchor for $w_k$; minimal N cost |
| Updated total N: 2,000 -> 2,100 | Buffer for exclusions at 7% rate | ~1,950 analyzable |
| Added TOST sensitivity at three bound levels | Issue 3.1 | Power reported at $\pm 0.10, 0.15, 0.20$ SD |
| Flagged DeclareDesign code as conceptual | Issue 3.4 | Coder rebuilds from scratch |
| Updated power table with separate $\beta_4$, $\beta_5$ | Issue 2.1 | Reflects revised primary specification |
