# Strategy Review: Argument Durability Under Partial Disconfirmation

**Date:** 2026-04-03
**Reviewer:** strategist-critic
**Phase Severity:** STRATEGY (constructive, medium severity)
**Score:** 76/100

---

## Phase 1: Claim Identification

- **Design:** Mixed between-subjects (justification condition) x within-subjects (policy domain) survey experiment
- **Estimand:** Structural interaction effect — does hybrid argument structure moderate the impact of matched disconfirmation?
- **Treatment:** Phase 1 = justification type; Phase 2 = disconfirmation type
- **Control:** Irrelevant-information cells serve as within-condition baselines

**Assessment:** Claims clearly causal and well-articulated. Estimand formally defined.

---

## Phase 2: Core Design Validity — 7 Issues

### Issue 2.1: Primary regression pools disconfirmation types (MAJOR, -8)

The primary specification regresses Delta on `Hybrid x Matched`, pooling normative and practical disconfirmation. This means the primary H1 test presupposes H4 (symmetry). If normative disconfirmation hits the hybrid harder than practical disconfirmation, the pooled estimate masks this.

**Fix:** Estimate TWO separate interaction effects: Hybrid x NormDisconf and Hybrid x PracDisconf. Test H4 as beta_4 = beta_5. Pool only as secondary specification conditional on H4 confirmation.

### Issue 2.2: Power shortfall — 200/cell vs. 300/cell needed (MAJOR, -7)

The analytic calculation yields 300/cell but the allocation is 200/cell — a 33% shortfall. H1c (TOST) is underpowered at ~70%, H4 at ~65%.

**Fix:** Increase N to ~2,500-2,800, or run DeclareDesign simulation to formally justify 200/cell, or drop the gain arm and reallocate.

### Issue 2.3: H1c additivity weight w_k underspecified (MAJOR, -5)

If w_k is estimated from the same experiment, the test is circular. If w_k = 0.5 is assumed, it may be wrong across domains.

**Fix:** Use w_k = 0.5 as confirmatory test. Add small "no justification" baseline (N=50-100) for external anchor. Report weighted version as exploratory.

### Issue 2.4: Primary specification inconsistency (MODERATE, -3)

Section 5 says change-score is primary; Section 12 says ANCOVA is primary.

**Fix:** Make ANCOVA primary throughout. Change-score as first robustness check.

### Issue 2.5: H2 loss-gain confound (MODERATE, -4)

Loss condition involves processing contradictory information; gain condition involves assimilating confirmatory information. Cannot cleanly separate loss aversion from asymmetric information processing.

**Fix:** Reframe H2 more modestly. Do not claim clean prospect theory test.

### Issue 2.6: Within-subject carryover for H4 (MODERATE, -3)

Within hybrid condition, disconfirmation type varies within-subject, making H4 symmetry test vulnerable to order effects.

**Fix:** Use first-scenario-only between-subjects comparison as confirmatory H4 test.

### Issue 2.7: No "no justification" baseline (MINOR, -2)

No condition without any justification. This would anchor weight estimation and detect backlash.

**Fix:** Add small baseline condition (N=50-100).

---

## Phase 3: Inference Soundness — 4 Issues

### Issue 3.1: TOST equivalence bounds need sensitivity (MODERATE, -3)

The +/- 0.15 SD bounds are reasonable but arbitrary.

**Fix:** Report sensitivity at +/- 0.10, 0.15, 0.20 SD.

### Issue 3.2: Mediation sequential ignorability (MODERATE, -3)

H5a/H5b mediation requires sequential ignorability assumption, which is untestable.

**Fix:** State assumption explicitly, report sensitivity parameter, frame as suggestive.

### Issue 3.3: Multiple comparisons family structure (MINOR, -2)

H1 in separate family from H2-H4 is defensible but a referee might argue for one family.

**Fix:** Justify family structure; report both corrected and uncorrected p-values.

### Issue 3.4: DeclareDesign pseudo-code structural issues (MINOR, -2)

Circular dependencies and ambiguous multi-level specification. Conceptual design is sound but coder needs to rebuild from scratch.

**Fix:** Flag to coder that pseudo-code is conceptual only.

---

## Phase 4: Polish — 4 Issues

### Issue 4.1: Missing CONSORT flow diagram (MINOR, -1)

**Fix:** Pre-specify CONSORT flow structure in PAP.

### Issue 4.2: Missing extreme-attitude exclusion check (MINOR, -1)

**Fix:** Add to exclusion sensitivity: exclude Y_pre at scale extremes.

### Issue 4.3: Falsification Test 5 measurement concern (MINOR, -1)

Respondents may not meaningfully rate credibility of a justification they never received.

**Fix:** Rephrase as hypothetical evaluation.

### Issue 4.4: Bibliography not populated (MINOR, 0)

Expected at strategy phase. Flag for librarian.

---

## Score Summary

| Issue | Severity | Deduction |
|-------|----------|-----------|
| 2.1 Pools disconfirmation types | MAJOR | -8 |
| 2.2 Power shortfall | MAJOR | -7 |
| 2.3 H1c weight underspecified | MAJOR | -5 |
| 2.4 Spec inconsistency | MODERATE | -3 |
| 2.5 H2 loss-gain confound | MODERATE | -4 |
| 2.6 Carryover for H4 | MODERATE | -3 |
| 2.7 No baseline condition | MINOR | -2 |
| 3.1 TOST sensitivity | MODERATE | -3 |
| 3.2 Mediation assumptions | MODERATE | -3 |
| 3.3 Family structure | MINOR | -2 |
| 3.4 Pseudo-code issues | MINOR | -2 |
| 4.1 Missing CONSORT | MINOR | -1 |
| 4.2 Missing exclusion check | MINOR | -1 |
| 4.3 Falsification Test 5 | MINOR | -1 |
| **Final Score** | | **76/100** |

---

## Positive Findings

1. Competing-predictions framing is excellent — every outcome is informative
2. Filler design and demand effect mitigation are thorough
3. Falsification test battery is unusually comprehensive (8 tests with decision rules)
4. Specification curve (1,080 specifications) is well-designed

**Verdict:** Conceptually strong design with specification-level issues. Revise and resubmit.
