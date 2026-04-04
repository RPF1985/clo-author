# Strategy Review (Round 2): Argument Durability Under Partial Disconfirmation

**Date:** 2026-04-03
**Reviewer:** strategist-critic
**Round:** 2 of 3
**Prior Score:** 76/100
**Score:** 93/100
**Verdict:** PASS

---

## Round 1 Issue Resolution

All 14 Round 1 issues addressed:

| Issue | Round 1 | Status | Credit Restored |
|-------|---------|--------|----------------|
| 2.1 Pooled disconfirmation types | -8 | RESOLVED (separate beta_4, beta_5) | +6 (new issue found in implementation) |
| 2.2 Power shortfall | -7 | FULLY RESOLVED (gain arm dropped, 250/cell) | +7 |
| 2.3 H1c weight circular | -5 | FULLY RESOLVED (w_k=0.5 confirmatory, T0 baseline) | +5 |
| 2.5 H2 loss-gain confound | -4 | FULLY RESOLVED (deferred to follow-up) | +4 |
| 2.4 Spec inconsistency | -3 | FULLY RESOLVED (ANCOVA primary throughout) | +3 |
| 2.6 Carryover for H4 | -3 | FULLY RESOLVED (first-scenario confirmatory) | +3 |
| 3.1 TOST sensitivity | -3 | FULLY RESOLVED (three bounds with justification) | +3 |
| 3.2 Mediation assumptions | -3 | FULLY RESOLVED (stated, sensitivity, suggestive) | +3 |
| Minor issues (6) | -10 | ALL RESOLVED | +10 |

---

## New Issues (Round 2)

### New Issue 1: Estimand-Regression Mismatch (MAJOR, -5)

Binary `is_hybrid` indicator pools both pure conditions as reference group. Under normative disconfirmation, this means pure_prac respondents (for whom the disconfirmation is irrelevant) are pooled into the reference group, diluting the comparison.

**Fix:** Use three-level justification factor with targeted contrasts, or estimate each interaction from the appropriate subsample (hybrid vs. matched pure only).

### New Issue 2: linearHypothesis CR2 propagation (MINOR, -1)

`car::linearHypothesis()` may not automatically use CR2 vcov from `lm_robust`.

**Fix:** Explicitly pass vcov.

### New Issue 3: T0 baseline precision (MINOR, -1)

N=75 provides limited precision for exploratory w_k estimation. Acceptable since labeled exploratory.

---

## Score: 93/100

## Verdict: PASS — Design ready to advance to execution.

## Positive Findings

1. Excellent revision discipline — every issue mapped and addressed
2. Gain-arm drop was a strong editorial decision (solved power + confound simultaneously)
3. Competing-predictions framework remains the design's greatest strength
4. Robustness infrastructure (15 checks, 8 falsification tests, 2,160-spec curve) is comprehensive
