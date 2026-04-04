# Strategy Memo: Argument Durability Under Partial Disconfirmation

**Date:** 2026-04-03
**Revised:** 2026-04-03 (Round 2 — addressing strategist-critic review, score 76/100)
**Strategist:** Identification and Experimental Design
**Phase:** Strategy
**Status:** REVISED

---

## 1. The Ideal Experiment

The ideal experiment would randomly assign citizens to receive a political justification (normative only, practical only, or hybrid), let them form genuine attitudes over time, then expose them to real-world disconfirmation events while controlling everything else about their information environment. This is infeasible: we cannot control real-world events, cannot wait for attitudes to form organically, and cannot isolate the justification channel.

The best feasible approximation is a **survey experiment** with vignette-based justification manipulation, immediate post-exposure attitude measurement, randomized disconfirmation treatment, and post-disconfirmation re-measurement. The gap between ideal and feasible is the standard gap in experimental political psychology, well-understood and accepted in AJPS/JOP (Mutz 2011; Tomz & Weeks 2013).

---

## 2. Design Overview

### Design Type

**Mixed design: Between-subjects (justification condition) x Within-subjects (policy domain replication)**

Each respondent is assigned to ONE justification condition for the experiment but evaluates MULTIPLE policy scenarios within that condition. This is the standard approach in political psychology vignette experiments (Tomz & Weeks 2013; Kertzer et al. 2014).

### Why Not Fully Between-Subjects?

A fully between-subjects design with 8 cells (see below) x 4 domains = 32 cells would require ~6,400+ respondents at 200/cell. The mixed design reduces this by having each respondent serve as their own control across domains, increasing power while keeping N manageable.

### Why Not Conjoint?

Conjoint is optimal for multidimensional preference profiles with many attributes. Here the core manipulation is simpler: justification type (3 levels) x disconfirmation type (2-3 levels). The key outcome is attitude CHANGE (pre-post difference), which conjoint does not naturally capture. The two-phase structure (justification then disconfirmation) is inherently sequential, not a simultaneous attribute bundle.

---

## 3. Treatment Structure

### Phase 1: Justification Exposure

Respondents read a policy scenario and are randomly assigned to one justification condition:

| Condition | Label | What Respondent Reads |
|-----------|-------|----------------------|
| T1 | Pure Normative | Policy justified on normative/moral grounds only |
| T2 | Pure Practical | Policy justified on practical/consequentialist grounds only |
| T3 | Hybrid | Policy justified on BOTH normative AND practical grounds |
| T0 | No Justification Baseline | Policy described with factual context only, no justification offered |

**After Phase 1:** Respondents report initial policy support (Y_pre) and justification credibility ratings.

**[REVISION NOTE — Issue 2.3, 2.7]:** The gain arm (T4) has been dropped (see Section 3a below). A small "no justification" baseline condition (T0, N=75) has been added. T0 respondents receive the policy scenario without any normative or practical justification. This serves two purposes: (1) anchoring the additivity weight $w_k$ for H1c externally rather than circularly, and (2) detecting backlash effects where disconfirmation drives support below uninformed baseline.

### Phase 2: Information Treatment

After an intervening filler task, respondents receive new information about the policy:

| Condition | Label | What Respondent Reads |
|-----------|-------|----------------------|
| D_norm | Normative disconfirmation | Credible information undermining the normative justification |
| D_prac | Practical disconfirmation | Credible information undermining the practical justification |
| D_irr | Irrelevant information (control) | Information about the policy that does not undermine either justification |

**After Phase 2:** Respondents report post-treatment policy support (Y_post), credibility ratings of each justification, certainty, and willingness to advocate.

### 3a. Design Decision: Dropping the Gain Arm

**[REVISION NOTE — Issue 2.2, 2.5]:** The gain arm (D_gain: adding a NEW justification) has been dropped from the confirmatory design. Rationale:

1. **Power reallocation:** The gain arm consumed ~300 respondents across 2 cells. Dropping it frees these respondents for reallocation to the 6 core cells, increasing cell sizes from ~200 to ~250 and addressing the power shortfall identified by the critic.
2. **Confound elimination (Issue 2.5):** The loss condition involves processing contradictory information (effortful); the gain condition involves assimilating confirmatory information (easier). This processing asymmetry cannot be separated from loss aversion, making H2 uninterpretable as a clean prospect theory test.
3. **H2 becomes secondary:** H2 (loss-gain asymmetry) is reframed as a hypothesis for a follow-up study with a design that can address the processing confound (e.g., using equivalently structured information that adds vs. removes justifications).

### Full Cell Structure (Revised)

| Cell | Phase 1 | Phase 2 | N per cell | Tests |
|------|---------|---------|------------|-------|
| 1 | Pure Normative (T1) | Normative disconfirmed (D_norm) | ~250 | Baseline: pure argument disconfirmed (matched) |
| 2 | Pure Normative (T1) | Practical disconfirmed (D_prac) | ~250 | Placebo: irrelevant disconfirmation for pure |
| 3 | Pure Practical (T2) | Practical disconfirmed (D_prac) | ~250 | Baseline: pure argument disconfirmed (matched) |
| 4 | Pure Practical (T2) | Normative disconfirmed (D_norm) | ~250 | Placebo: irrelevant disconfirmation for pure |
| 5 | Hybrid (T3) | Normative disconfirmed (D_norm) | ~250 | KEY TEST: hybrid under partial disconfirmation |
| 6 | Hybrid (T3) | Practical disconfirmed (D_prac) | ~250 | KEY TEST: hybrid under partial disconfirmation |
| 7 | Hybrid (T3) | Irrelevant info (D_irr) | ~200 | Control: hybrid with no disconfirmation |
| 8 | Pure Normative (T1) | Irrelevant info (D_irr) | ~100 | Control: pure normative baseline change |
| 9 | Pure Practical (T2) | Irrelevant info (D_irr) | ~100 | Control: pure practical baseline change |
| 10 | No Justification (T0) | Irrelevant info (D_irr) | ~75 | Anchor: baseline support without justification |

**Total target N: ~2,000** (detailed justification in power analysis)

**Post-exclusion target: ~1,850** (assuming ~7% exclusion rate from attention checks, speeders, comprehension failures)

### Within-Subject Replication Across Domains

Each respondent sees **3 policy scenarios** drawn from the pool of 4 domains:

1. **Military intervention** (normative: humanitarian obligation; practical: national security threat)
2. **Trade agreement** (normative: fair wages/labor rights; practical: economic growth/jobs)
3. **Climate policy** (normative: moral duty to future generations; practical: cost savings/green jobs)
4. **Immigration policy** (normative: refugee obligation; practical: labor market needs)

**Critical design choice:** Each respondent is assigned to the SAME justification condition across all 3 scenarios but receives DIFFERENT disconfirmation types across scenarios. This means:

- A respondent in the Hybrid condition might see: Scenario 1 (normative disconfirmed), Scenario 2 (practical disconfirmed), Scenario 3 (irrelevant info control)
- This within-subject variation in disconfirmation type increases power for testing H4 (symmetry)
- The justification condition remains between-subjects to avoid demand effects from seeing different justification types

**Scenario assignment:** Each respondent receives 3 of 4 domains (Latin square incomplete block design), with domain order randomized.

### Filler Design

To prevent respondents from anticipating the disconfirmation pattern:

1. **2 filler scenarios** interspersed among the 3 treatment scenarios (total: 5 scenarios per respondent)
2. Fillers involve policy scenarios where the Phase 2 information is:
   - Neutral/mixed (e.g., "New data shows the policy had moderate effects")
   - Positive (e.g., "New evidence strengthens the case")
   - Unrelated to the justification type
3. Fillers use different policy domains (e.g., education, healthcare) to avoid overlap
4. Scenario order: randomized across all 5 scenarios (treatment + filler)
5. Fillers are presented identically to treatment scenarios -- same structure, same timing, same questions

**Why this works:** With 5 scenarios of varying Phase 2 outcomes (some disconfirmation, some neutral, some positive), the respondent cannot predict what information they will receive for any given scenario. The disconfirmation pattern is not detectable.

---

## 4. Estimands

### Primary Estimand: Structural Effect of Hybrid Arguments on Disconfirmation Vulnerability

Define:
- $Y_i^{post}(t, d)$: post-disconfirmation support for unit $i$ under justification condition $t$ and disconfirmation type $d$
- $Y_i^{pre}(t)$: pre-disconfirmation support for unit $i$ under justification condition $t$
- $\Delta_i(t, d) = Y_i^{post}(t, d) - Y_i^{pre}(t)$: within-person attitude change

**[REVISION NOTE — Issue 2.1]:** The primary estimand is now defined as TWO separate structural interaction effects, one for each disconfirmation type. This avoids pooling normative and practical disconfirmation, which would make the H1 test dependent on H4 (symmetry).

**H1 Core Estimands: Separate Structural Interaction Effects**

$$\tau_{H1}^{norm} = E[\Delta_i(\text{hybrid}, D_{norm})] - E[\Delta_i(\text{pure\_norm}, D_{norm})]$$

$$\tau_{H1}^{prac} = E[\Delta_i(\text{hybrid}, D_{prac})] - E[\Delta_i(\text{pure\_prac}, D_{prac})]$$

- If BOTH $\tau_{H1}^{norm} < 0$ AND $\tau_{H1}^{prac} < 0$: H1a (fragility) supported
- If BOTH $\tau_{H1}^{norm} > 0$ AND $\tau_{H1}^{prac} > 0$: H1b (resilience) supported
- If BOTH $\tau_{H1}^{norm} \approx 0$ AND $\tau_{H1}^{prac} \approx 0$: H1c (additivity) supported -- confirmed via TOST

**Pooled estimand (secondary, conditional on H4):**

$$\tau_{H1}^{pooled} = E[\Delta_i(\text{hybrid}, d_k)] - E[\Delta_i(\text{pure}_k, d_k)]$$

This pooled version is reported as a secondary specification only after testing whether $\tau_{H1}^{norm} = \tau_{H1}^{prac}$ (the H4 symmetry test).

**H1c Operationalization (Additivity Test):**

**[REVISION NOTE — Issue 2.3]:** The confirmatory test uses a fixed weight $w_k = 0.5$ (equal-weight assumption). The no-justification baseline (T0, Cell 10) provides an external anchor for estimating $w_k$ in an exploratory version.

*Confirmatory version:* Under equal weighting, the hybrid's decline from disconfirming component $k$ should be approximately half the pure-$k$ condition's decline:

$$\tau_{H1c}^{confirm} = E[\Delta_i(\text{hybrid}, d_k)] - 0.5 \cdot E[\Delta_i(\text{pure}_k, d_k)]$$

Test: $\tau_{H1c}^{confirm} = 0$ via equivalence test (TOST).

*Exploratory version:* Estimate $w_k$ from the T0 baseline:

$$\hat{w}_{norm} = \frac{E[Y_{pre}(\text{pure\_norm})] - E[Y_{pre}(\text{T0})]}{E[Y_{pre}(\text{hybrid})] - E[Y_{pre}(\text{T0})]}$$

Report the weighted additivity test using $\hat{w}_k$ as exploratory, clearly labeled as data-dependent.

### H2 Estimand: Loss-Gain Asymmetry (Deferred)

**[REVISION NOTE — Issue 2.5]:** H2 is deferred to a follow-up study. The gain arm has been dropped from this design due to the processing-mode confound: loss involves contradictory information processing while gain involves confirmatory assimilation. H2 is reframed as: "The observed pattern is consistent with but not uniquely explained by loss aversion in argument structure. A clean test requires a follow-up design that equates processing demands across gain and loss conditions."

### H3 Estimand: Cross-Domain Generality

$$\tau_{H1}^{norm, domain_j} \text{ and } \tau_{H1}^{prac, domain_j} \text{ for } j \in \{\text{war, trade, climate, immigration}\}$$

Test whether $\tau_{H1}^{norm}$ and $\tau_{H1}^{prac}$ have the same sign across all domains. Formal test: interaction between treatment and domain indicators should be non-significant (equivalence test preferred).

### H4 Estimand: Symmetry

$$\tau_{H4} = \tau_{H1}^{norm} - \tau_{H1}^{prac}$$

Testing whether the structural effect is the same when the normative vs. practical component is disconfirmed.

**[REVISION NOTE — Issue 2.6]:** The confirmatory test of H4 uses first-scenario-only data (between-subjects comparison), eliminating within-subject carryover. The within-subject version pooling all scenarios is reported as supplementary.

### H5 Estimands: Mechanism

- **H5a (Credibility cascade):** $E[C_i^{surviving}(\text{hybrid}, d_k)] < E[C_i^{surviving}(\text{pure}_{-k}, d_k)]$ where $C_i^{surviving}$ is the perceived credibility of the SURVIVING justification. If disconfirming component $k$ in the hybrid reduces credibility of component $-k$ more than the same disconfirmation reduces credibility of component $-k$ in the pure-$-k$ condition (where it was never paired with $k$), the cascade is operating.

- **H5b (Anchoring/compensation):** $E[I_i^{surviving}(\text{hybrid}, d_k)] > E[I_i^{surviving}(\text{pure}_{-k}, d_k)]$ where $I_i^{surviving}$ is the perceived importance of the surviving justification. If the surviving justification gains compensatory weight in the hybrid condition, anchoring is operating.

**[REVISION NOTE — Issue 3.2]:** Both H5a and H5b require the sequential ignorability assumption (Imai, Keele & Tingley 2010): conditional on treatment and pre-treatment covariates, the mediator is independent of potential outcomes. This assumption is untestable in a single experiment. We address this by: (1) stating the assumption explicitly in the text, (2) reporting sensitivity analysis using the $\rho$ parameter from the `mediation` package — the correlation between residuals of the mediator and outcome models at which the ACME crosses zero, and (3) framing mediation results as "suggestive evidence for mechanism," not definitive causal claims.

---

## 5. Estimation Approach

### Primary Specification

**[REVISION NOTE — Issue 2.1, 2.4]:** The primary specification is ANCOVA (not change-score), estimating TWO separate interaction effects for normative and practical disconfirmation rather than pooling them.

ANCOVA with robust (HC2) standard errors:

$$Y_i^{post} = \alpha + \rho Y_i^{pre} + \beta_1 \text{Hybrid}_i + \beta_2 \text{NormDisconf}_{ij} + \beta_3 \text{PracDisconf}_{ij} + \beta_4 (\text{Hybrid}_i \times \text{NormDisconf}_{ij}) + \beta_5 (\text{Hybrid}_i \times \text{PracDisconf}_{ij}) + \gamma X_i + \delta_j + \epsilon_{ij}$$

where:
- $Y_i^{post}$: post-disconfirmation support
- $Y_i^{pre}$: pre-disconfirmation support (ANCOVA covariate)
- $\text{Hybrid}_i = 1$ if respondent received the hybrid justification
- $\text{NormDisconf}_{ij} = 1$ if observation received normative disconfirmation
- $\text{PracDisconf}_{ij} = 1$ if observation received practical disconfirmation
- $\delta_j$ = domain fixed effects
- $X_i$ = pre-registered covariates (partisanship, education, political knowledge, need for cognition)
- **$\beta_4$ is the structural interaction for normative disconfirmation**
- **$\beta_5$ is the structural interaction for practical disconfirmation**

**Interpretation:**
- $\beta_4 < 0$ AND $\beta_5 < 0$: Fragility (H1a)
- $\beta_4 > 0$ AND $\beta_5 > 0$: Resilience (H1b)
- $\beta_4 \approx 0$ AND $\beta_5 \approx 0$: Additivity (H1c) -- confirmed via equivalence test on each
- $\beta_4 \neq \beta_5$: Asymmetry (H4 rejected)

**H4 test:** Wald test of $\beta_4 = \beta_5$.

**Pooled specification (secondary, conditional on H4 non-rejection):**

$$Y_i^{post} = \alpha + \rho Y_i^{pre} + \beta_1 \text{Hybrid}_i + \beta_2 \text{MatchedDisconf}_{ij} + \beta_3 (\text{Hybrid}_i \times \text{MatchedDisconf}_{ij}) + \gamma X_i + \delta_j + \epsilon_{ij}$$

Reported only if $\beta_4 = \beta_5$ is not rejected (H4 confirmed).

### Alternative Specifications

1. **Change-score specification (first robustness check):** $\Delta_i = Y_i^{post} - Y_i^{pre}$ as dependent variable, same regressors minus $Y_i^{pre}$

   **[REVISION NOTE — Issue 2.4]:** Change-score is explicitly the FIRST robustness check, not the primary specification. ANCOVA is primary throughout because it is more efficient when the pre-post correlation is positive but not 1 (McKnight et al. 2007).

2. **Ordered logistic regression** for Likert-scale outcome (7-point) -- report proportional odds test

3. **Multilevel model** with random intercepts for respondent (since each respondent provides 3 observations across domains):

$$Y_{ij}^{post} = \alpha + \rho Y_{ij}^{pre} + \beta_1 \text{Hybrid}_i + \beta_2 \text{NormDisconf}_{ij} + \beta_3 \text{PracDisconf}_{ij} + \beta_4 (\text{Hybrid}_i \times \text{NormDisconf}_{ij}) + \beta_5 (\text{Hybrid}_i \times \text{PracDisconf}_{ij}) + \delta_j + u_i + \epsilon_{ij}$$

where $j$ indexes domain and $u_i \sim N(0, \sigma_u^2)$ is the respondent random effect.

### Clustering

Standard errors clustered at the respondent level in the multilevel specification (each respondent provides 3 domain-level observations). In the between-subjects-only analysis (collapsing across domains to one observation per respondent), no clustering needed -- HC2 robust SEs sufficient.

### Software

- **R:** `estimatr::lm_robust()` for OLS with HC2; `lme4::lmer()` for multilevel; `DeclareDesign` for design declaration
- **Multiple comparisons:** `p.adjust(method = "BH")` for Benjamini-Hochberg across secondary outcomes

### Specific Tests by Hypothesis

| Hypothesis | Test | Coefficient(s) | Decision Rule |
|------------|------|----------------|---------------|
| H1a vs H1b | Sign of $\beta_4$ and $\beta_5$ | Hybrid x NormDisconf, Hybrid x PracDisconf | Both < 0 (fragility), both > 0 (resilience) |
| H1c | Equivalence test (TOST) on each | $\beta_4$ and $\beta_5$ separately | Reject if each falls within equivalence bounds |
| H3 | Heterogeneity across domains | $\beta_4 \times \text{Domain}$, $\beta_5 \times \text{Domain}$ | Joint F-test for domain interactions = 0 |
| H4 | Symmetry of normative vs practical | $\beta_4 - \beta_5$ | Wald test; confirmatory test uses first-scenario-only |
| H5a | Credibility cascade | Mediator: surviving justification credibility | Causal mediation (Imai et al. 2011) + sensitivity analysis |
| H5b | Anchoring/compensation | Mediator: surviving justification importance | Causal mediation (Imai et al. 2011) + sensitivity analysis |

### Equivalence Bounds for H1c

**[REVISION NOTE — Issue 3.1]:** The equivalence bounds are reported at three levels with substantive justification for each:

- **Strict bounds: $\pm 0.10$ SD.** Half the lower CI bound of the Chan et al. (2017) perseverance effect (d = 0.12). If the structural interaction falls within these bounds, even the most conservative interpretation supports additivity.
- **Primary bounds: $\pm 0.15$ SD.** Half the lower bound of the perseverance meta-analytic effect. This is the pre-registered confirmatory bound.
- **Liberal bounds: $\pm 0.20$ SD.** Equal to the expected main effect size. If the interaction is smaller than the main effect by a factor of 1, there is no meaningful structural amplification or attenuation.

Report TOST results at all three bounds. The $\pm 0.15$ SD result is the pre-registered confirmatory test; the other two are sensitivity analyses.

---

## 6. Randomization Scheme

### Between-Subjects Randomization

- **Unit of randomization:** Individual respondent
- **Method:** Complete randomization via Qualtrics randomizer, blocked by partisanship (Democrat, Republican, Independent/Other) and education (college degree vs. no college degree) -- 6 blocks
- **Allocation ratio:** Equal across the 6 core cells (Cells 1-6); smaller allocation to control cells (7-9) and baseline (10)
- **Balance covariates:** Age, gender, race/ethnicity, political knowledge (measured pre-treatment)

### Within-Subject Randomization

- **Domain assignment:** 3 of 4 domains per respondent, using a balanced incomplete block design (each domain appears equally often)
- **Domain order:** Randomized independently for each respondent
- **Filler placement:** 2 fillers randomly interspersed among 3 treatment scenarios
- **Disconfirmation type within domains:** For hybrid respondents seeing 3 domains, assign {normative disconfirmed, practical disconfirmed, irrelevant control} across the 3 domains, with assignment randomized

---

## 7. Key Assumptions

1. **Random assignment holds (SUTVA):** Individual-level randomization on a survey platform -- no contact between respondents. SUTVA satisfied by design.

2. **No interference:** Respondents take the survey independently. No spillovers.

3. **Excludability:** The justification condition affects attitudes ONLY through the justification content, not through other features of the vignette (length, complexity, readability). Mitigated by: matching vignette length across conditions, pilot-testing readability, and including the no-justification baseline (T0) in the pilot.

4. **No defiance:** In a survey experiment, compliance is essentially perfect -- respondents read what they are shown. Confirmed via comprehension checks.

5. **Monotonicity of disconfirmation:** The disconfirmation manipulation reduces support for the disconfirmed justification. Confirmed via manipulation check.

6. **Equivalence of disconfirmation strength:** Normative and practical disconfirmation events are equally credible and impactful. Must be confirmed in pilot testing with separate sample.

7. **Measurement equivalence:** The 7-point support scale measures the same construct across domains and conditions. Addressed via confirmatory factor analysis on pilot data.

---

## 8. Testable Implications and Manipulation Checks

### Manipulation Checks (Post-Treatment Only)

1. **Justification perception check:** "What reasons were given for [policy]?" (multiple choice with correct and incorrect options). Must correctly identify at least the justification type received. Placement: after Y_post measurement to avoid priming.

2. **Disconfirmation perception check:** "What new information did you receive about [policy]?" (multiple choice). Must correctly identify the disconfirmation type.

3. **Disconfirmation strength check:** "How convincing was the new information you received?" (7-point scale). Used to verify equivalent disconfirmation strength across normative and practical conditions.

### Balance Checks

- Pre-treatment covariate balance across justification conditions (partisanship, education, age, gender, race, political knowledge)
- Reported in balance table (Appendix); joint F-test for omnibus imbalance

### Attention Checks

- 2 attention checks embedded in the survey (e.g., "Please select 'Somewhat agree' for this question")
- Threshold: respondents failing BOTH attention checks are excluded
- Sensitivity analysis: report results with and without exclusions

### Speeder Exclusion

- Median completion time estimated from pilot
- Exclude respondents completing in < (median / 3)
- Report results with and without speeder exclusions

### Comprehension Check

- After the first scenario, a brief comprehension question tests whether the respondent understood the policy and justification. Respondents who fail are flagged but NOT excluded from primary analysis (included in robustness).

### CONSORT Flow Diagram

**[REVISION NOTE — Issue 4.1]:** The PAP will include a pre-specified CONSORT-style flow diagram with the following nodes:

1. **Enrolled:** Total respondents who begin survey
2. **Randomized:** Total assigned to conditions (after consent, pre-treatment demographics)
3. **Allocated:** Counts per cell
4. **Excluded post-randomization:** Counts and reasons (failed both attention checks, speeder, duplicate IP/Prolific ID)
5. **Analyzed (primary):** Counts per cell after exclusions
6. **Analyzed (full sample):** Counts for robustness with no exclusions

---

## 9. Threats to Inference

### Demand Effects

**Threat:** Respondents infer the hypothesis and adjust responses accordingly (e.g., "they want me to change my mind after bad news").

**Mitigation:**
1. Filler scenarios with non-disconfirming information break the pattern
2. The hybrid vs. pure distinction is never made salient -- respondents in different conditions do not know what others received
3. Post-experiment suspicion probe: "What do you think this study was about?" Coded by blind RA for hypothesis awareness
4. The cover story frames the study as about "how people evaluate policy decisions when new information becomes available" -- true but vague

### Ecological Validity

**Threat:** Vignette-based disconfirmation is artificial; real-world attitude change involves gradual information accumulation, social networks, and media exposure.

**Mitigation:**
1. Vignettes grounded in real-world cases (Iraq War, NAFTA, Paris Agreement) for ecological validity
2. Disconfirmation events modeled on actual historical events
3. The study tests a MECHANISM (structural vulnerability) that should operate regardless of information delivery mode
4. Observational component (Part 2 of the research spec) provides external validity check

### Order Effects and Learning

**Threat:** Respondents learn the disconfirmation pattern across scenarios and adjust.

**Mitigation:**
1. Randomized scenario order
2. Filler scenarios break the pattern
3. Test for order effects: include scenario position as a covariate; report position x treatment interaction
4. If order effects detected: report results from first scenario only as robustness check (fully between-subjects, no within-subject contamination)

### Differential Attrition

**Threat:** Respondents in some conditions (e.g., those who feel strongly about a policy) are more likely to drop out after disconfirmation.

**Mitigation:**
1. Report completion rates by condition
2. Attrition balance test: compare pre-treatment covariates of completers vs. non-completers by condition
3. Lee bounds on treatment effects to bound the effect of differential attrition

### Ceiling/Floor Effects

**Threat:** Initial support is so high or low that there is no room for change.

**Mitigation:**
1. Pilot test scenarios to ensure initial support is moderate (3-5 on 7-point scale)
2. Choose scenarios where partisan valence is not extreme
3. Report distribution of Y_pre by condition; if bunched at extremes, use censored regression as robustness

### Experimenter Degrees of Freedom

**Threat:** Many possible specifications could be run; researcher chooses the one that "works."

**Mitigation:**
1. Pre-registration of primary specification, primary outcome, exclusion criteria, and equivalence bounds
2. All deviations from PAP documented transparently
3. Specification curve analysis across all reasonable model choices

---

## 10. Timing and Pre-Registration

### Pre-Registration Platform

**EGAP** (Evidence in Governance and Politics) -- standard for political science experiments.

### Timeline

1. **Pilot study** (N = 200-300): Test scenario equivalence, disconfirmation strength calibration, manipulation check pass rates, completion time estimation. NOT pre-registered (exploratory).
2. **Pre-registration:** Submit PAP to EGAP after pilot, before main data collection. PAP includes all hypotheses, specifications, exclusion criteria, and power analysis.
3. **Main study** (N ~ 2,000): Fielded on Prolific via Qualtrics.
4. **Analysis:** Follow PAP exactly; deviations documented.

### Consent and IRB

- Duke University IRB approval required before any data collection
- Informed consent: standard survey experiment consent language; no deception (justifications are real policy arguments; disconfirmation events are based on real-world scenarios)
- Debriefing: brief post-survey explanation that the study examined how people evaluate policy arguments when new information becomes available; no hypothesis reveal needed since no deception occurred

---

## 11. Multiple Comparisons Strategy

### Primary Outcome

- Policy support (measured via ANCOVA on $Y^{post}$ controlling for $Y^{pre}$) is the SINGLE primary outcome
- The two structural interaction effects ($\beta_4$, $\beta_5$) are the primary tests

### Secondary Outcomes (Benjamini-Hochberg corrected)

1. Certainty/confidence change
2. Willingness to advocate change
3. Surviving justification credibility (mediator for H5a)
4. Surviving justification importance (mediator for H5b)

### Hypothesis Family Structure

**[REVISION NOTE — Issue 3.3]:** Family structure is justified below. Both corrected and uncorrected p-values are reported for all tests.

| Family | Hypotheses | Correction | Justification |
|--------|-----------|------------|---------------|
| Primary | H1 ($\beta_4$, $\beta_5$: two structural interaction effects) | BH within family (2 tests) | Both test the same theoretical construct (structural vulnerability) across two disconfirmation types |
| Symmetry | H4 ($\beta_4 = \beta_5$) | None -- single test | Single Wald test |
| Mechanism | H5a, H5b | BH within family (2 tests) | Both test mediating mechanisms |
| Secondary | H3 (cross-domain) | BH within family (domain-specific tests) | Domain-level decomposition of primary effect |
| Exploratory | HTEs by partisanship, knowledge, NFC | Labeled exploratory; no correction; reported with caveat | Pre-registered as exploratory |

**Rationale for separating H1 from H4:** H1 tests the existence and direction of the structural effect; H4 tests symmetry. These are conceptually distinct questions. A referee who objects can inspect the "all hypotheses in one family" correction, which is reported as a supplementary table.

---

## 12. Recommended Primary Design + Robustness

**[REVISION NOTE — Issue 2.4]:** ANCOVA is now explicitly primary throughout. No ambiguity between Sections 5 and 12.

**Lead with:** Mixed between-within design. Between-subjects justification condition, within-subjects domain replication. **ANCOVA specification** with respondent-clustered SEs. Primary tests are the two separate Hybrid x Disconfirmation-Type interactions ($\beta_4$, $\beta_5$).

**Robustness with:**
1. Change-score specification (instead of ANCOVA) -- first robustness check
2. Pooled interaction (Hybrid x Matched) -- secondary, conditional on H4
3. First-scenario-only analysis (fully between-subjects, no within-subject contamination) -- confirmatory for H4
4. Ordered logistic regression for ordinal outcome
5. Multilevel model with respondent random effects
6. Results with and without attention check / speeder exclusions
7. Specification curve across all reasonable model choices

---

## 13. Anticipating Referee Objections

| # | Objection | Pre-Planned Response |
|---|-----------|---------------------|
| 1 | "Demand effects: respondents figure out you want them to change their minds after disconfirmation" | Filler scenarios break the pattern; suspicion probe data reported; between-subjects justification condition means no respondent sees both hybrid and pure; cover story is accurate but vague |
| 2 | "External validity: Prolific sample, vignette-based" | Prolific provides demographic diversity superior to MTurk (Peer et al. 2017); vignettes grounded in real-world cases; the mechanism (structural vulnerability) is general; cite Coppock (2019) on generalizability of treatment effects from convenience samples |
| 3 | "How do you distinguish H1c (additivity) from a null result?" | Pre-registered equivalence bounds reported at three levels ($\pm 0.10, 0.15, 0.20$ SD) with substantive justification for each; TOST procedure; power analysis shows adequate power; Bayesian BF as supplement |
| 4 | "The within-subject design creates carryover / learning" | Randomized order; filler scenarios; explicit order-effect test; first-scenario-only robustness (fully between-subjects); cite Clifford et al. (2021) on within-subject designs in political science |
| 5 | "Disconfirmation strength may not be equivalent across normative and practical" | Pilot-tested with separate sample; manipulation check data reported; disconfirmation strength rating included as covariate in robustness specification; H4 (symmetry) directly tests this as a separate hypothesis rather than assuming it |
| 6 | "Your primary regression assumes symmetry (H4)" | **[NEW]** Primary specification estimates $\beta_4$ and $\beta_5$ separately. Pooling is secondary, conditional on H4 non-rejection. |
| 7 | "The mediation analysis requires untestable assumptions" | **[NEW]** Sequential ignorability stated explicitly; sensitivity parameter $\rho$ reported; mediation framed as suggestive, not definitive. |
| 8 | "Multiple comparisons across many hypotheses" | **[NEW]** Family structure pre-specified and justified; BH correction within families; full correction across all tests reported as supplementary. Both corrected and uncorrected p-values reported. |

---

## Appendix A: Scenario Sketch (War Domain)

**Phase 1 -- Pure Normative (T1):**
> The government of [country] is considering military intervention in [target country]. Government officials argue that intervention is a moral obligation: [target country]'s government has been systematically violating the human rights of its citizens, including documented cases of [specific abuses]. Officials state that democracies have a responsibility to protect vulnerable populations from atrocities.

**Phase 1 -- Pure Practical (T2):**
> The government of [country] is considering military intervention in [target country]. Government officials argue that intervention serves national security: intelligence reports indicate that [target country] is developing weapons capabilities that could threaten [country] and its allies within [timeframe]. Officials state that acting now would prevent a more costly conflict in the future.

**Phase 1 -- Hybrid (T3):**
> [Both paragraphs above, connected with: "Government officials argue that intervention is justified on multiple grounds."]

**Phase 1 -- No Justification Baseline (T0):**
> The government of [country] is considering military intervention in [target country]. [Factual context about the situation in target country -- geography, population, recent events -- without normative or practical justification for intervention.]

**Phase 2 -- Normative Disconfirmation (D_norm):**
> Six months later, an independent investigation by [credible organization] found that the reports of human rights abuses in [target country] were significantly exaggerated. While some restrictions on political opposition exist, the systematic atrocities described by government officials could not be verified. Several key claims were based on unreliable sources.

**Phase 2 -- Practical Disconfirmation (D_prac):**
> Six months later, an independent assessment by [credible organization] found that [target country]'s weapons capabilities were significantly less advanced than intelligence reports indicated. The timeline for any potential threat was revised from [short timeframe] to [much longer timeframe], and several key intelligence claims were based on outdated or misinterpreted data.

*Note: Specific country names and details to be determined in pilot testing. Scenarios should be hypothetical enough to avoid strong partisan priors but realistic enough to be credible.*

---

## Revision Log

| Issue | Severity | Fix Applied | Section(s) Modified |
|-------|----------|-------------|---------------------|
| 2.1: Primary regression pools disconfirmation types | MAJOR | Restructured primary spec to estimate $\beta_4$ (Hybrid x NormDisconf) and $\beta_5$ (Hybrid x PracDisconf) separately. Pooled version is secondary, conditional on H4. | 4, 5, 12 |
| 2.2: Power shortfall (200 vs 300/cell) | MAJOR | Dropped gain arm, reallocated to core cells (250/cell). See power_analysis.md for updated calculations. | 3, 3a, power_analysis.md |
| 2.3: H1c weight w_k underspecified | MAJOR | Confirmatory test uses $w_k = 0.5$. Added T0 baseline (N=75) for external anchor. Weighted version is exploratory. | 3, 4 |
| 2.5: H2 loss-gain confound | MODERATE | Dropped gain arm; H2 deferred to follow-up study with explicit acknowledgment of processing confound. | 3a, 4 |
| 2.4: Primary specification inconsistency | MODERATE | ANCOVA is primary throughout. Change-score is first robustness check. Consistent across Sections 5 and 12. | 5, 12 |
| 2.6: Within-subject carryover for H4 | MODERATE | First-scenario-only between-subjects comparison is confirmatory H4 test. Within-subject version is supplementary. | 4, 12 |
| 2.7: No baseline condition | MINOR | Added T0 "no justification" baseline (N=75, Cell 10). | 3 |
| 3.1: TOST bounds need sensitivity | MODERATE | Report at $\pm 0.10, 0.15, 0.20$ SD with substantive justification for each. | 5 |
| 3.2: Mediation sequential ignorability | MODERATE | Assumption stated explicitly; sensitivity parameter reported; mediation framed as suggestive. | 4 |
| 3.3: Family structure justification | MINOR | Justified family structure; report both corrected and uncorrected p-values. | 11 |
| 4.1: Missing CONSORT flow diagram | MINOR | Added CONSORT specification to Section 8. | 8 |
| 4.2: Missing extreme-attitude exclusion | MINOR | Added to robustness_plan.md. | robustness_plan.md |
| 4.3: Falsification Test 5 wording | MINOR | Rephrased as hypothetical evaluation. | falsification_tests.md |
| 3.4: Pseudo-code structural issues | MINOR | Flagged as conceptual only for coder. | pseudo_code.md |
