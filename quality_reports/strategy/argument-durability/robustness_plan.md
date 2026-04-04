# Robustness Plan: Argument Durability Under Partial Disconfirmation

**Date:** 2026-04-03
**Revised:** 2026-04-03 (Round 2 — TOST sensitivity, extreme-attitude exclusion, ANCOVA primary)

---

## Priority-Ordered Robustness Checks

All robustness checks are pre-registered. Results are reported in the supplementary appendix with a summary table in the main text.

---

### 1. Alternative Outcome Specification

**Rationale:** The primary analysis uses ANCOVA (Y_post regressed on Y_pre + treatment). Change scores are a common alternative. Both are valid but can differ when pre-post correlation varies or when there are floor/ceiling effects.

- **1a.** Change-score specification: $\Delta_i = Y_i^{post} - Y_i^{pre}$ as dependent variable. **This is the first robustness check** -- the most natural alternative to ANCOVA.
- **1b.** Post-score only (no pre-score control) -- tests whether results depend on ANCOVA adjustment
- **1c.** Standardized change score: $\Delta_i / SD(Y_i^{pre})$ -- puts effect in interpretable SD units

**Decision rule:** If sign, significance, and approximate magnitude match across 1a-1c, primary results are robust.

---

### 2. First-Scenario-Only Analysis (Fully Between-Subjects)

**Rationale:** The within-subject component (3 domains per respondent) may introduce carryover effects, learning, or demand. Analyzing only the first scenario each respondent encounters eliminates all within-subject concerns.

- Use only the first policy scenario encountered by each respondent
- This gives a clean between-subjects experiment with N ~ 2,000 / 1 observation per person
- Lower power but eliminates the most serious design concern
- **[REVISION NOTE — Issue 2.6]:** This is also the CONFIRMATORY test for H4 (symmetry). The first-scenario-only comparison of $\beta_4$ vs. $\beta_5$ is free of carryover. The within-subject version is supplementary.

**Decision rule:** If the interaction effect has the same sign and is at least marginally significant (p < 0.10), the within-subject structure is not driving results.

---

### 3. Pooled Interaction (Secondary Specification)

**[NEW — Issue 2.1]:** The primary specification estimates $\beta_4$ (Hybrid x NormDisconf) and $\beta_5$ (Hybrid x PracDisconf) separately. The pooled specification using a single `Hybrid x Matched` indicator is reported as a secondary specification, conditional on the H4 symmetry test not being rejected.

$$Y_i^{post} = \alpha + \rho Y_i^{pre} + \beta_1 \text{Hybrid}_i + \beta_2 \text{Matched}_{ij} + \beta_3 (\text{Hybrid}_i \times \text{Matched}_{ij}) + \gamma X_i + \delta_j + \epsilon_{ij}$$

**Decision rule:** Report only if Wald test of $\beta_4 = \beta_5$ yields p > 0.10. If rejected, do not pool.

---

### 4. Ordered Logistic Regression

**Rationale:** The 7-point Likert scale is ordinal, not continuous. OLS on ordinal data can produce biased estimates if the response distribution is highly skewed.

- Ordered logit on Y_post with Y_pre as covariate
- Report proportional odds test (Brant test)
- If proportional odds violated, report partial proportional odds model or dichotomized analysis (support vs. not)

**Decision rule:** If ordered logit confirms the direction and significance of the OLS interaction effect, the linear approximation is adequate.

---

### 5. Multilevel Model with Respondent Random Effects

**Rationale:** Each respondent contributes 3 observations (one per domain). The multilevel model properly accounts for the nested structure and estimates the within-person correlation.

$$Y_{ij}^{post} = \alpha + \rho Y_{ij}^{pre} + \beta_1 \text{Hybrid}_i + \beta_2 \text{NormDisconf}_{ij} + \beta_3 \text{PracDisconf}_{ij} + \beta_4 (\text{Hybrid}_i \times \text{NormDisconf}_{ij}) + \beta_5 (\text{Hybrid}_i \times \text{PracDisconf}_{ij}) + \delta_j + u_i + \epsilon_{ij}$$

- $u_i \sim N(0, \sigma_u^2)$: respondent random intercept
- $\delta_j$: domain fixed effects
- Report ICC and variance decomposition

**Decision rule:** Compare $\hat{\beta}_4$ and $\hat{\beta}_5$ to the primary OLS estimates. If they differ substantially, the multilevel model is preferred (and should become the primary specification).

---

### 6. Exclusion Sensitivity Analysis

**Rationale:** Pre-registered exclusion criteria (attention checks, speeders, comprehension failures) could differentially affect conditions.

- **6a.** Full sample (no exclusions)
- **6b.** Exclude attention check failures only
- **6c.** Exclude speeders only (completion time < median/3)
- **6d.** Exclude comprehension check failures only
- **6e.** All exclusions applied (primary specification)

Report results for all five. Present as a robustness table.

**Decision rule:** If results are directionally consistent across all five, exclusion criteria are not driving findings.

---

### 7. Extreme-Attitude Exclusion

**[NEW — Issue 4.2]:** Respondents with extreme pre-treatment attitudes (Y_pre at scale endpoints: 1 or 7 on the 7-point scale) may have floor or ceiling effects that prevent meaningful attitude change.

- **7a.** Primary analysis (all respondents)
- **7b.** Exclude respondents with Y_pre = 1 or Y_pre = 7 on any scenario
- **7c.** Exclude respondents with Y_pre = 1, 2, 6, or 7 on any scenario (stricter)

Report all three. If the treatment effect strengthens after excluding extremes, discuss ceiling/floor effects as attenuation.

**Decision rule:** If sign and significance are preserved across 7a-7c, extreme attitudes are not driving or masking results.

---

### 8. Domain-Level Heterogeneity

**Rationale:** H3 predicts cross-domain generality, but the effect may vary across war, trade, climate, and immigration.

- Estimate $\beta_4$ and $\beta_5$ separately for each domain
- Report domain x treatment interaction F-test
- Forest plot of domain-specific effects with pooled estimate

**Decision rule:** If all domain-specific effects have the same sign and the heterogeneity Q-statistic is non-significant, H3 is supported.

---

### 9. Heterogeneous Treatment Effects (Pre-Specified Moderators)

**Rationale:** Theory predicts that the structural effect may vary by respondent characteristics.

| Moderator | Measurement | Theoretical Prediction |
|-----------|-------------|----------------------|
| Partisanship (D/R/I) | Self-reported PID, 7-point | Stronger structural effect for weak partisans (less motivated reasoning to resist disconfirmation) |
| Political knowledge | 5-item factual knowledge battery | Higher knowledge may enable more rational updating (favoring H1c) |
| Need for cognition | 6-item NFC short scale (Lins de Holanda Coelho et al. 2020) | High NFC may process justifications more carefully, amplifying structural effects |
| Prior attitude strength | Pre-treatment attitude extremity | Stronger prior attitudes may resist disconfirmation more (ceiling effect) |
| Scenario-specific priors | Issue importance self-report | More important issues may trigger motivated reasoning |

- Each moderator tested as a triple interaction: Hybrid x DisconfType x Moderator
- These are EXPLORATORY -- labeled as such, no multiple comparison correction
- Report in supplementary materials

---

### 10. Disconfirmation Strength as Covariate

**Rationale:** The manipulation check includes a perceived disconfirmation strength rating. If normative and practical disconfirmation are perceived as differently strong, this could confound the H4 symmetry test.

- Include perceived disconfirmation strength as a covariate
- Report results with and without this control
- If including it substantially changes the H4 result, discuss implications for symmetry claim

---

### 11. Scenario Order Effects

**Rationale:** Even with randomized order, position effects (fatigue, learning, sensitization) could exist.

- Include scenario position (1st, 2nd, 3rd, 4th, 5th) as covariate and as interaction with treatment
- Test for linear position effect on outcome
- Test for position x treatment interaction

**Decision rule:** If no significant position x treatment interaction, order effects are not a concern.

---

### 12. TOST Equivalence Bounds Sensitivity

**[NEW — Issue 3.1]:** The primary TOST test for H1c uses bounds of $\pm 0.15$ SD. Report sensitivity at three levels:

| Bound | Value | Substantive Justification | Expected Power |
|-------|-------|---------------------------|----------------|
| Strict | $\pm 0.10$ SD | Half the lower CI bound of Chan et al. (2017) perseverance effect (d = 0.12). If the interaction falls within this range, even conservative readers accept additivity. | ~60% |
| Primary | $\pm 0.15$ SD | Half the lower bound of the perseverance meta-analytic effect (d = 0.23). Pre-registered confirmatory bound. | ~80% |
| Liberal | $\pm 0.20$ SD | Equal to the expected main interaction effect. If structural moderation is smaller than its own expected magnitude, no meaningful amplification/attenuation. | ~90% |

Report TOST results at all three bounds. Decision:
- If TOST rejects at strict bounds: strong evidence for additivity
- If TOST rejects at primary but not strict: moderate evidence
- If TOST rejects at liberal but not primary: suggestive evidence only
- If TOST fails at liberal bounds: cannot conclude additivity

---

### 13. Specification Curve Analysis

**Rationale:** Many reasonable analytic choices exist (outcome measure, model type, exclusion criteria, covariates). A specification curve (Simonsohn, Simmons, & Nelson 2020) shows results are not an artifact of one particular specification.

Dimensions of the curve:
- Outcome: ANCOVA post-score / change score / standardized change
- Model: OLS / ordered logit / multilevel
- Exclusions: all five variants from Check 6
- Covariates: none / demographics only / demographics + political knowledge + NFC / all
- Domain: all domains pooled / first scenario only
- Standard errors: HC2 / clustered / bootstrap
- Interaction: separate $\beta_4$/$\beta_5$ / pooled $\beta_3$

Total specifications: 3 x 3 x 5 x 4 x 2 x 3 x 2 = 2,160

Report: (a) percentage of specifications with same sign, (b) percentage significant at p < 0.05, (c) median effect size across specifications.

---

### 14. Bayesian Robustness

**Rationale:** Bayes factors provide evidence for the null (H1c) in a way that frequentist tests cannot.

- Compute Bayes Factor for each interaction effect ($\beta_4$, $\beta_5$) using `BayesFactor::lmBF()` in R
- Prior: default Cauchy prior on effect sizes (scale = 0.707, "medium" in BayesFactor convention)
- BF_01 > 3: evidence for null (additivity)
- BF_10 > 3: evidence for structural effect (fragility or resilience)
- 1/3 < BF < 3: inconclusive

---

### 15. Sensitivity Analysis for Unobserved Confounding

**Rationale:** Although the experiment is randomized, concerns about post-randomization confounding (e.g., differential attention, scenario interpretation) can be addressed formally.

- Use `sensemakr` (Cinelli & Hazlett 2020) to compute robustness value (RV) for each interaction effect
- Report: how strong would an unobserved confounder need to be (relative to observed covariates) to eliminate the effect?
- This is insurance against referee concern about "what if something went wrong with randomization"

---

## Summary Table Template

| Check | Primary Result | Robustness Result | Consistent? |
|-------|---------------|-------------------|-------------|
| 1a. Change score | [report] | [report] | [Y/N] |
| 1b. Post-only | [report] | [report] | [Y/N] |
| 2. First scenario only | [report] | [report] | [Y/N] |
| 3. Pooled interaction | [report] | [report] | [Y/N] |
| 4. Ordered logit | [report] | [report] | [Y/N] |
| 5. Multilevel | [report] | [report] | [Y/N] |
| 6. Exclusion variants | [report] | [report] | [Y/N] |
| 7. Extreme-attitude exclusion | [report] | [report] | [Y/N] |
| 12. TOST sensitivity | [report at 3 bounds] | [report] | [Y/N] |
| ... | ... | ... | ... |

---

## Revision Log

| Change | Reason | Section |
|--------|--------|---------|
| Added Check 3 (Pooled interaction as secondary) | Issue 2.1: primary spec now estimates $\beta_4$, $\beta_5$ separately | New Section 3 |
| Added Check 7 (Extreme-attitude exclusion) | Issue 4.2 | New Section 7 |
| Added Check 12 (TOST sensitivity at 3 bounds) | Issue 3.1 | New Section 12 |
| Updated Check 1a language | Issue 2.4: change-score is now explicitly first robustness, not primary | Section 1 |
| Updated Check 2 language | Issue 2.6: first-scenario is confirmatory for H4 | Section 2 |
| Updated Check 5 multilevel specification | Issue 2.1: uses $\beta_4$, $\beta_5$ not pooled $\beta_3$ | Section 5 |
| Updated spec curve dimensions | Issue 2.1: added separate vs. pooled interaction dimension | Section 13 |
| Renumbered all checks for consistency | Organizational | Throughout |
