# Falsification Tests: Argument Durability Under Partial Disconfirmation

**Date:** 2026-04-03
**Revised:** 2026-04-03 (Round 2 — Test 5 rephrased, cell references updated)

---

## Purpose

Falsification tests identify conditions where the theory predicts NO effect. If effects appear where they should not, something is wrong with the design, the manipulation, or the theory. These are pre-registered alongside the primary hypotheses.

---

## Falsification Test 1: Irrelevant Disconfirmation Should Not Reduce Support for Pure Arguments

**Logic:** If a respondent receives only a normative justification (T1) and then receives practical disconfirmation (D_prac), this disconfirmation is irrelevant to their basis of support. Support should NOT decline.

**Test:** Compare Cells 2 and 4 (pure argument + irrelevant disconfirmation) to Cells 8 and 9 (pure argument + no disconfirmation control).

$$E[\Delta_i(\text{pure\_norm}, D_{prac})] \approx E[\Delta_i(\text{pure\_norm}, D_{irr})]$$
$$E[\Delta_i(\text{pure\_prac}, D_{norm})] \approx E[\Delta_i(\text{pure\_prac}, D_{irr})]$$

**Expected result:** No significant difference. If the irrelevant disconfirmation DOES reduce support, this suggests either (a) the disconfirmation events have spillover effects beyond their targeted justification type, or (b) any negative information about the policy reduces support regardless of justification type (a general negativity effect that would complicate interpretation of all hypotheses).

**Diagnostic action if violated:** Report the irrelevant-disconfirmation effect as a baseline "negativity spillover" and adjust the interpretation of the hybrid interaction effect accordingly. Specifically, subtract the irrelevant-disconfirmation effect from the matched-disconfirmation effect before computing the structural interaction.

---

## Falsification Test 2: No Treatment Effect on Filler Scenarios

**Logic:** Filler scenarios do not involve justification manipulation or disconfirmation. Treatment condition assignment (hybrid vs. pure) should not affect attitudes toward filler topics.

**Test:** Regress filler-scenario attitude change on justification condition assignment (T1 vs. T2 vs. T3).

**Expected result:** No significant effect of justification condition on filler attitudes. If justification condition somehow affects filler responses, this suggests demand effects or mood/arousal spillovers from treatment scenarios.

---

## Falsification Test 3: Pre-Treatment Balance on Post-Treatment Measures (Timing Placebo)

**Logic:** Randomization should ensure that pre-treatment attitudes (Y_pre) do not differ across justification conditions for the SAME scenario, conditional on having received the justification but BEFORE disconfirmation.

**Test:** Regress Y_pre (post-justification, pre-disconfirmation) on disconfirmation assignment (D_norm vs. D_prac vs. D_irr). Since disconfirmation has not yet occurred at this point, there should be no effect.

**Expected result:** No significant difference. If Y_pre differs by disconfirmation assignment, randomization may have failed or there is a survey programming error.

---

## Falsification Test 4: Suspicion Probe -- Hypothesis-Aware Respondents

**Logic:** If respondents figure out the hypothesis ("they're testing whether combined arguments fall apart"), their behavior may not reflect genuine attitude change.

**Test:** Post-experiment open-ended question: "What do you think this study was about?" Coded blind by two RAs for hypothesis awareness (0 = no awareness, 1 = partial, 2 = full awareness).

**Analyses:**
- Report distribution of suspicion codes by condition
- Re-run primary analysis EXCLUDING respondents coded as fully aware (code = 2)
- Re-run with suspicion as a moderator

**Expected result:** < 5% of respondents should be fully hypothesis-aware. If results change substantially when excluding aware respondents, demand effects are a concern.

---

## Falsification Test 5: Hypothetical Evaluation of Non-Presented Justifications

**[REVISION NOTE — Issue 4.3]:** This test has been rephrased. Respondents in pure conditions were never presented with the other justification type, so asking directly about its "credibility" is problematic -- they have no basis for a credibility judgment. Instead, we frame the question as a hypothetical evaluation.

**Logic:** In the pure-normative condition (T1), the practical justification was never presented. If normative disconfirmation somehow affects respondents' hypothetical evaluation of a practical justification they never received, this suggests respondents are spontaneously generating or imagining the missing justification, which would blur the hybrid-pure distinction.

**Test:** In Cell 1 (pure normative, normative disconfirmed), ask: "Suppose the government had also argued that intervention serves national security. How convincing would you find that argument?" Compare responses to Cell 8 (pure normative, irrelevant info) receiving the same hypothetical question.

**Expected result:** No difference -- normative disconfirmation should not affect hypothetical evaluation of a practical justification that was never presented. If it does, respondents in pure conditions may be mentally "filling in" the missing justification type, complicating the hybrid-pure comparison.

**Note:** This test is now framed as an evaluation of a hypothetical argument, which is a meaningful cognitive task, rather than a credibility rating of something never encountered.

---

## Falsification Test 6: Matched Disconfirmation Should Reduce Support for Pure Arguments

**Logic:** This is a POSITIVE falsification test (sanity check). The manipulation SHOULD work in the most straightforward case: if you give someone only a practical justification and then disconfirm it, their support should decline.

**Test:** Compare Cells 1 and 3 (pure argument + matched disconfirmation) to Cells 8 and 9 (pure argument + irrelevant info).

$$E[\Delta_i(\text{pure\_norm}, D_{norm})] < E[\Delta_i(\text{pure\_norm}, D_{irr})]$$
$$E[\Delta_i(\text{pure\_prac}, D_{prac})] < E[\Delta_i(\text{pure\_prac}, D_{irr})]$$

**Expected result:** Significant negative effect. If disconfirmation does not reduce support even in the pure condition, the manipulation is too weak and the entire experiment is uninformative. This is the most important sanity check.

**Diagnostic action if violated:** The experiment has failed its manipulation. Do not proceed to hybrid comparisons. Redesign disconfirmation vignettes and re-pilot.

---

## Falsification Test 7: No Differential Attrition by Condition

**Logic:** If respondents in certain conditions (e.g., those receiving disconfirmation of a position they support) are more likely to drop out, the remaining sample is not a random subset of the assigned sample.

**Test:**
- Chi-square test of completion rates across all 10 cells
- Logistic regression of completion (1/0) on treatment indicators + pre-treatment covariates
- Compare pre-treatment covariate means between completers and non-completers within each cell

**Expected result:** No significant differences. Completion rates should be within 2-3 percentage points across cells.

---

## Falsification Test 8: Manipulation Check Pass Rates Should Not Vary by Justification Type

**Logic:** If the normative justification is inherently harder to comprehend than the practical one (or vice versa), differential manipulation check pass rates would indicate non-equivalent manipulations.

**Test:** Compare manipulation check pass rates across T1 (pure normative), T2 (pure practical), and T3 (hybrid).

**Expected result:** Pass rates should be comparable (within 5 percentage points). The hybrid condition may have slightly lower pass rates due to more information to process -- report this if observed.

---

## Summary: Decision Tree for Falsification Results

| Test | If PASSED | If FAILED |
|------|-----------|-----------|
| F1: Irrelevant disconfirmation null | Proceed as planned | Adjust by subtracting negativity spillover baseline |
| F2: Filler scenario null | Proceed as planned | Investigate demand effects; report with caveat |
| F3: Pre-disconfirmation balance | Proceed as planned | Check randomization; possible survey programming error |
| F4: Suspicion probe | Proceed as planned | Exclude aware respondents; report with and without |
| F5: Hypothetical evaluation null | Proceed as planned | Respondents generating own justifications; discuss implications for hybrid-pure distinction |
| F6: Matched disconfirmation works | Proceed as planned | **Stop.** Manipulation failed. Redesign and re-pilot. |
| F7: No differential attrition | Proceed as planned | Lee bounds; discuss selection threat |
| F8: Manipulation check equivalence | Proceed as planned | Condition on passing manipulation check as robustness |

---

## Revision Log

| Change | Reason | Section |
|--------|--------|---------|
| Rephrased Falsification Test 5 | Issue 4.3: respondents cannot meaningfully rate credibility of a justification they never received. Now framed as hypothetical evaluation with specific question wording. | Test 5 |
| Updated cell count reference in Test 7 | Design now has 10 cells (gain arm dropped) | Test 7 |
