# Domain Profile

<!--
All agents read this file to calibrate their field-specific behavior.
Generated via /discover interview or filled manually.
-->

## Field

**Primary:** Political Psychology / Public Opinion / International Security
**Adjacent subfields:** Experimental Political Science, Comparative Politics, International Relations

---

## Target Journals (ranked by tier)

<!-- The Orchestrator uses this for journal selection. The Librarian prioritizes these in searches. -->

| Tier | Journals |
|------|----------|
| Top-3 | APSR, AJPS, JOP |
| Top field | IO, JPR, JCR, Political Psychology, Political Behavior, BJPS |
| Strong field | JEPS, POQ, Political Analysis, ISQ, CPS, PSRM |

---

## Common Data Sources

<!-- The Explorer prioritizes these. The explorer-critic knows their quirks. -->

| Dataset | Type | Access | Notes |
|---------|------|--------|-------|
| Qualtrics | Survey platform | Licensed | Primary deployment platform for survey experiments |
| Prolific | Recruitment panel | Paid per participant | Higher data quality than MTurk; demographic diversity; pre-screening |
| Amazon MTurk | Recruitment panel | Paid per participant | Large pool, fast turnaround; concerns about attentiveness and representativeness |
| CloudResearch | Recruitment panel | Paid per participant | MTurk overlay with quality filters; Virtual Chinchilla panel |
| ANES | National survey | Public | American National Election Studies — gold standard for political attitudes |
| CCES/CES | National survey | Public | Cooperative Election Study — large N, annual, validated vote |
| Pew Research | National survey | Public | Regular polling on political attitudes; methodological transparency |
| YouGov | Panel survey | Restricted | Matched random sample methodology; international panels available |
| GSS | National survey | Public | General Social Survey — long time series, political modules |
| V-Dem | Country-level panel | Public | Varieties of Democracy — democracy indicators across countries |
| UCDP/PRIO | Conflict data | Public | Armed conflict dataset — events and fatalities |
| Correlates of War | Country-level | Public | Interstate war, alliance, trade, capability data |
| Voter files (L2, TargetSmart) | Administrative | Restricted/paid | Individual-level voter registration, turnout history, modeled partisanship |
| FEC/OpenSecrets | Administrative | Public | Campaign finance — contributions, expenditures, PAC data |

---

## Common Identification Strategies

<!-- The Strategist considers these first. The strategist-critic knows field-specific threats. -->

| Strategy | Typical Application | Key Assumption to Defend |
|----------|-------------------|------------------------|
| Between-subjects randomized experiment | Factorial vignette, conjoint, simple treatment-control | Random assignment ensures balance; SUTVA holds |
| Conjoint analysis | Multi-attribute choice experiments | No profile-order effects; respondents evaluate attributes independently (AMCE interpretation) |
| Factorial vignette experiment | Manipulating multiple dimensions of a scenario | Factor orthogonality maintained; no aliasing between dimensions |
| Within-subjects / crossover design | Pre-post measurement with treatment | No carryover effects; order randomization sufficient |
| List experiment | Sensitive attitudes (racial prejudice, support for violence) | No design effects; treatment item does not change baseline count |
| Endorsement experiment | Sensitive preferences via cue attribution | Endorsement affects evaluation through the cue, not content change |
| Natural experiment (DiD, IV, RDD) | Policy changes, redistricting, close elections | Standard quasi-experimental assumptions (parallel trends, exclusion restriction, continuity) |

---

## Field Conventions

<!-- The Coder and Writer follow these. The writer-critic checks for them. -->

- OLS with robust (HC2) standard errors is default for experimental data with continuous outcomes
- Ordered logistic regression for Likert-scale outcomes; report proportional odds assumption test
- Pre-registered exclusion criteria applied before analysis: attention check failures, comprehension check failures, speeders (< median/3 completion time), straight-liners
- AAPOR reporting standards for survey methodology (response rates, completion rates, break-off rates)
- CONSORT-style flow diagrams for experimental attrition: enrollment → randomization → allocation → analysis
- Heterogeneous treatment effects by partisanship (D/R/I), ideology (liberal-conservative), and other pre-treatment covariates
- Multiple comparison corrections (Bonferroni, Benjamini-Hochberg) when testing multiple outcomes; report both corrected and uncorrected p-values
- Equivalence tests (TOST) when arguing for null effects
- Report effect sizes in substantively meaningful units (percentage points of opinion change, scale points on 7-point scale)
- DeclareDesign framework for design declaration, power analysis, and diagnosis
- Pre-registration on EGAP, AsPredicted, or OSF before data collection; deviations documented transparently

---

## Notation Conventions

<!-- The Writer and writer-critic enforce these. -->

| Symbol | Meaning | Anti-pattern |
|--------|---------|-------------|
| $Y_i(T=t)$ | Potential outcome for unit $i$ under treatment $t$ | Don't use $Y_{it}$ (panel notation) for experimental data |
| $\tau$ | Average treatment effect (ATE) | Don't use $\beta$ as the primary estimand label in experiments |
| $\tau_{CACE}$ | Complier average causal effect | Don't use LATE in political science contexts — use CACE |
| $T_i \in \{0,1\}$ | Binary treatment indicator | Don't use $D_i$ (economics convention) |
| $T_{ij}$ | Treatment assignment for factor $j$ in factorial design | Document factor structure explicitly |
| AMCE | Average marginal component effect (conjoint) | Always clarify AMCE vs. marginal means |
| $\alpha$ | Significance level (default 0.05) | State explicitly when using non-standard levels |
| $\hat{\tau}$ | Estimated treatment effect | Include standard error and confidence interval |

---

## Seminal References

<!-- The Librarian ensures these are cited when relevant. The strategist-critic knows their methods. -->

| Paper | Why It Matters |
|-------|---------------|
| Hainmueller, Hopkins & Yamamoto (2014) | Foundational conjoint analysis paper — AMCE framework |
| Leeper, Hobolt & Tilley (2020) | Marginal means for conjoint — complements AMCE interpretation |
| Tomz & Weeks (2013) | Survey experiments on public support for military force |
| Gerber & Green (2012) | Field experiments textbook — randomization, compliance, spillovers |
| Blair, Coppock & Humphreys (2023) | DeclareDesign — research design declaration and diagnosis |
| Berinsky, Huber & Lenz (2012) | MTurk validity for political science experiments |
| Coppock (2019) | Generalizing from survey experiments to target populations |
| Mutz (2011) | Population-based survey experiments methodology |
| Clifford, Jewell & Waggoner (2015) | Comparing Prolific and MTurk for survey experiments |
| Druckman & Kam (2011) | Student samples and external validity in experiments |
| Imai, King, Nall (2009) | Randomization inference for causal effects |
| Blair & Imai (2012) | List experiments — statistical methods for sensitive questions |
| Aronow & Miller (2019) | Foundations of Agnostic Statistics — design-based inference |
| Taber & Lodge (2006) | Motivated skepticism — prior attitudes filter political information |
| Druckman (2001) | Framing effects in political opinion — how alternative frames shift preferences |
| Gelpi, Feaver & Reifler (2009) | Paying the Human Costs of War — casualty sensitivity and war support |
| Chong & Druckman (2007) | Framing theory — competing frames and opinion formation |
| Kahneman & Tversky (1979) | Prospect theory — loss aversion framework (theoretical anchor for H3) |
| Haidt (2001) | Moral foundations — intuitive vs. reasoned moral judgment |
| Zaller (1992) | The Nature and Origins of Mass Opinion — elite cue reception model |

---

## Field-Specific Referee Concerns

<!-- The domain-referee and methods-referee watch for these. -->

- "Was this pre-registered? Show me the registry link and document any deviations."
- "Social desirability bias — how do you know respondents are answering honestly?"
- "Demand effects — could respondents infer the hypothesis from the treatment wording?"
- "External validity — Prolific/MTurk samples are not nationally representative. Why should we care about these respondents?"
- "Multiple comparisons — how many outcomes did you test? What correction was applied?"
- "Manipulation check — did the treatment actually change the intended perception?"
- "Attention checks — what exclusion criteria were applied, and how do results change if you include everyone?"
- "Sample size justification — show me the power analysis. What effect size did you assume and why?"
- "Why not a nationally representative sample? (YouGov, ANES module)"
- "Ecological validity — would people make the same choice outside a survey context?"

---

## Quality Tolerance Thresholds

<!-- Customize for your domain's standards. Used by quality.md. -->

| Quantity | Tolerance | Rationale |
|----------|-----------|-----------|
| Point estimates | 1e-6 | Numerical precision |
| Standard errors | 1e-4 | MC variability |
| Coverage rates | ± 0.01 | Simulation with B reps |
| Cross-language replication | 1e-6 for estimates, 1e-4 for SEs | Per MixtapeTools Referee 2 protocol |
