# Adaptation Plan: Applied Econometrics → Political Science Survey Experiments

**Date:** 2026-03-27
**Prepared for:** Political science researcher specializing in public opinion, military force, and political psychology
**Primary methods:** Factorial vignette survey experiments, conjoint designs, experimental designs with moral reasoning and policy framing manipulations

---

## Master File Inventory

Every file audited, with change category and summary.

| # | File | Category | Summary |
|---|------|----------|---------|
| 1 | `.claude/references/domain-profile.md` | **CRITICAL** | Entire file is economics template — rewrite for political science survey experiments |
| 2 | `.claude/references/journal-profiles.md` | **CRITICAL** | 20+ economics/finance/accounting/marketing journals — replace with PS journals (APSR, JOP, AJPS, IO, JPR, JCR, Political Psychology, Political Behavior, BJPS) |
| 3 | `.claude/agents/strategist.md` | **CRITICAL** | Lists only quasi-experimental designs (DiD, IV, RDD, SC) — must add RCT/survey experiment design framework as primary |
| 4 | `.claude/agents/strategist-critic.md` | **CRITICAL** | 300-line checklist entirely for DiD/IV/RDD/SC — must add experimental design validity checklist (randomization balance, attrition, compliance, manipulation checks) |
| 5 | `.claude/agents/methods-referee.md` | **CRITICAL** | "Applied microeconometrics" framing — reframe for experimental political science; add survey design evaluation dimensions |
| 6 | `.claude/agents/domain-referee.md` | **IMPORTANT** | Generic structure works but examples and field calibration are economics-centric; "economic sense" → "theoretical sense" |
| 7 | `.claude/agents/editor.md` | **IMPORTANT** | All 20+ journal examples are economics; referee pet peeves assume economics norms; must add PS-specific dispositions and pet peeves |
| 8 | `.claude/agents/explorer.md` | **IMPORTANT** | Data sources list is CPS/BLS/FRED/Medicare — replace with survey platforms (Qualtrics, Prolific, MTurk), voter files, ANES, CCES |
| 9 | `.claude/agents/librarian.md` | **IMPORTANT** | Search protocol targets AER/NBER/RePEc — add PS journals, SSRN Political Science, Google Scholar PS filters |
| 10 | `.claude/agents/coder.md` | **IMPORTANT** | Analysis pipeline assumes observational causal inference — add DeclareDesign framework, randomization inference, survey experiment analysis stages |
| 11 | `.claude/rules/content-standards.md` | **IMPORTANT** | Table examples use wages/employment; file naming uses `did_`, `first_stage_` prefixes — adapt for experimental results |
| 12 | `.claude/rules/working-paper-format.md` | **MINOR** | LaTeX preamble is field-neutral; section structure has "Empirical Strategy" but not "Experimental Design" — minor relabeling |
| 13 | `.claude/skills/strategize/SKILL.md` | **IMPORTANT** | PAP registries list AEA RCT Registry first — reorder for EGAP/AsPredicted/OSF; add DeclareDesign-based power analysis |
| 14 | `.claude/skills/discover/SKILL.md` | **IMPORTANT** | Literature search targets AER/NBER; data discovery lists CPS/Medicare — replace with PS sources |
| 15 | `.claude/skills/submit/SKILL.md` | **IMPORTANT** | References "AEA-compliant replication package" and "AEA Data Editor" — replace with APSR/JOP dataverse deposit standards |
| 16 | `.claude/skills/review/SKILL.md` | **MINOR** | Routing logic is field-agnostic; journal calibration inherits from profiles |
| 17 | `.claude/skills/analyze/SKILL.md` | **MINOR** | Generic analysis dispatch — add DeclareDesign as preferred framework |
| 18 | `.claude/skills/write/SKILL.md` | **MINOR** | Anti-hedging and notation rules are field-neutral |
| 19 | `.claude/skills/revise/SKILL.md` | **MINOR** | R&R routing is field-agnostic |
| 20 | `.claude/skills/talk/SKILL.md` | **MINOR** | Beamer/Quarto format is field-neutral |
| 21 | `.claude/skills/tools/SKILL.md` | **MINOR** | Utility commands are field-neutral |
| 22 | `.claude/skills/new-project/SKILL.md` | **MINOR** | Pipeline orchestration is field-neutral |
| 23 | `CLAUDE.md` | **IMPORTANT** | Field placeholder says "Economics, Finance, Marketing..." — fill in for political science; compilation commands are fine |
| 24 | `.claude/agents/writer.md` | **MINOR** | Mostly field-neutral; notation examples may need updating |
| 25 | `.claude/agents/writer-critic.md` | **MINOR** | Checks are format-level (LaTeX quality, hedging) — field-neutral |
| 26 | `.claude/agents/verifier.md` | **IMPORTANT** | "AEA Data Editor compliance" and "AEA replication package" references — replace with PS dataverse standards |
| 27 | `.claude/agents/coder-critic.md` | **MINOR** | Code quality checks are field-neutral |
| 28 | `.claude/agents/librarian-critic.md` | **MINOR** | Literature coverage checks are field-neutral |
| 29 | `.claude/agents/explorer-critic.md` | **MINOR** | Data assessment rubric is field-neutral |
| 30 | `.claude/agents/data-engineer.md` | **MINOR** | Data pipeline is field-neutral |
| 31 | `.claude/agents/orchestrator.md` | **MINOR** | Infrastructure — field-neutral |
| 32 | `.claude/agents/storyteller.md` | **MINOR** | Beamer talks — field-neutral |
| 33 | `.claude/agents/storyteller-critic.md` | **MINOR** | Talk evaluation — field-neutral |
| 34 | `.claude/rules/agents.md` | **MINOR** | Worker-critic pair structure — field-neutral |
| 35 | `.claude/rules/quality.md` | **MINOR** | Scoring weights may need adjustment (identification validity weight vs. design pre-registration weight) |
| 36 | `.claude/rules/workflow.md` | **MINOR** | Pipeline dependencies — field-neutral |
| 37 | `.claude/rules/revision.md` | **MINOR** | R&R protocol — field-neutral |
| 38 | `.claude/rules/logging.md` | **NONE** | Logging format — fully field-neutral |
| 39 | `.claude/rules/meta-governance.md` | **NONE** | Template governance — field-neutral |
| 40 | `.claude/WORKFLOW_QUICK_REF.md` | **MINOR** | Quick reference — inherits from other files |
| 41 | `.claude/settings.json` | **NONE** | Harness configuration — field-neutral |
| 42 | `MEMORY.md` | **IMPORTANT** | Contains economics-specific [LEARN] entries — clear and rebuild for PS |
| 43 | `README.md` | **MINOR** | Says "empirical social science" which is fine; examples may be econ-flavored |
| 44 | `CHANGELOG.md` | **NONE** | Version history — keep as-is |
| 45 | `.gitignore` | **NONE** | Already updated with declaredesign-replication/ |
| 46 | `guide/*.qmd` (6 files) | **MINOR** | Documentation examples may reference economics; mostly generic |
| 47 | `templates/*.md` (7 files) | **NONE** | Templates are field-neutral |
| 48 | `scripts/quality_score.py` | **NONE** | Scoring rubrics for Quarto/R/Beamer — field-neutral |
| 49 | `Bibliography_base.bib` | **NONE** | Empty/minimal — user populates |

**New files to create:**

| # | File | Category | Summary |
|---|------|----------|---------|
| N1 | `.claude/agents/survey-instrument-reviewer.md` | **NEW AGENT** | Reviews survey instruments for ambiguity, order effects, acquiescence bias, double-barreled items, leading language, PAP alignment |
| N2 | `.claude/agents/experimental-methods-reviewer.md` | **NEW AGENT** | Uses DeclareDesign book + Gerber & Green as knowledge base to evaluate experimental design choices |
| N3 | `.claude/agents/irb-drafter.md` | **NEW AGENT** | Auto-fills Duke IRB application template from project description, instrument, consent language |
| N4 | `.claude/agents/qsf-builder.md` | **NEW AGENT** | Converts survey instrument to Qualtrics-importable QSF format with blocks, logic, randomization |
| N5 | `.claude/rules/r-function-verification.md` | **NEW RULE** | Enforce help-doc check before using any unverified R function |
| N6 | `scripts/New-ResearchProject.ps1` | **NEW SCRIPT** | PowerShell: provisions GitHub repo, clones template, sets remote, opens VS Code |
| N7 | Extend `.claude/agents/verifier.md` | **EXTEND** | Add Python replication of R analysis + discrepancy flagging |

---

## Detailed Plan: CRITICAL Files

### 1. `.claude/references/domain-profile.md` — FULL REWRITE

**Current state:** Economics template with placeholder brackets. Every section defaults to economics examples (AER/JPE/CPS/DiD/moral hazard).

**Target state:** Populated political science survey experiment profile.

| Section | Current | New Content |
|---------|---------|-------------|
| Field | `[e.g., Health Economics, Labor Economics...]` | **Primary:** Political Psychology / Public Opinion / International Security. **Adjacent:** Experimental Political Science, Comparative Politics, International Relations |
| Target Journals | AER, Econometrica, JPE, QJE, REStud | **Tier 1:** APSR, AJPS, JOP. **Tier 2:** IO, JPR, JCR. **Tier 3:** Political Psychology, Political Behavior, BJPS. **Tier 4:** JEP, PRQ, PSRM |
| Common Data Sources | CPS, BLS, FRED | Qualtrics (survey deployment), Prolific/MTurk/CloudResearch (recruitment), ANES, CCES/CES, Pew Research, YouGov, voter files |
| Common Identification Strategies | State-level DiD / policy variation | Between-subjects factorial experiments, conjoint designs, within-subjects pre/post, crossover designs, list experiments for sensitive items |
| Field Conventions | LPM + logit, log costs, clustering at state level | OLS with robust SEs for experimental data, ordered logistic for Likert outcomes, pre-registered exclusion criteria (attention checks, speeders, straight-liners), AAPOR reporting standards, heterogeneous treatment effects by partisanship/ideology, CONSORT flow diagrams |
| Notation | $Y_{it}$, $D_{it}$ | $Y_i(T=t)$ potential outcomes, $\tau$ = ATE, $\tau_{CACE}$ = complier average, treatment indicators $T_i \in \{0,1\}$ or factorial $T_{ij}$ for multi-factor designs |
| Seminal References | Finkelstein et al. (2012) | Hainmueller, Hopkins & Yamamoto (2014) — conjoint analysis; Tomz & Weeks (2013) — force experiments; Berinsky, Huber & Lenz (2012) — MTurk validity; Mutz (2011) — population-based survey experiments; Gerber & Green (2012) — field experiments textbook; Blair, Coppock, Humphreys (2023) — DeclareDesign |
| Referee Concerns | "Why not Oregon HIE?" / "Moral hazard vs adverse selection" | "Why not a nationally representative sample?" / "Social desirability bias in responses" / "Demand effects from treatment wording" / "External validity beyond Prolific/MTurk" / "Pre-registration: was this pre-specified?" / "Multiple comparisons — how many outcomes tested?" |

### 2. `.claude/references/journal-profiles.md` — FULL REWRITE

**Current state:** 20+ profiles for economics, finance, accounting, marketing journals. Zero political science journals.

**Action:** Remove all current journal profiles. Create new profiles for:

**Must include (user's target list):**
- **APSR** — broadest audience, highest bar, requires general interest
- **AJPS** — strong empirical PS, values causal identification
- **JOP** — clean identification, strong empirics, Chicago tradition
- **IO** — international relations and security, theory-empirics integration
- **JPR** — peace and conflict research, quantitative and qualitative
- **JCR** — conflict resolution, interdisciplinary
- **Political Psychology** — psychological mechanisms in politics, experimental designs
- **Political Behavior** — voting, opinion formation, political participation
- **BJPS** — British journal, comparative and international scope

**Should include (adjacent):**
- Public Opinion Quarterly (POQ) — survey methodology, question wording
- Journal of Experimental Political Science (JEPS) — pure experimental PS
- Journal of Peace Research — conflict and peace
- International Studies Quarterly (ISQ) — IR
- Political Analysis — PS methods journal
- Comparative Political Studies (CPS) — comparative politics

Each profile follows the existing template format (Focus, Bar, Domain referee adjusts, Methods referee adjusts, Typical concerns, Referee pool weights).

**Key calibration differences from economics journals:**
- PS referees care heavily about **pre-registration** and **demand effects** — economics referees rarely ask about either
- PS referees ask about **sample representativeness** more than economics referees
- PS journals value **mechanism evidence** (mediation analysis, manipulation checks) whereas economics journals value **robustness to alternative specifications**
- **Theory** in PS means formal models OR verbal causal frameworks — not just structural estimation
- **APSR/AJPS** desk reject for narrow scope faster than AER does

### 3. `.claude/agents/strategist.md` — MAJOR REWRITE

**Current state:** Lists 6 designs: DiD, IV, RDD, SC, Event Study, Selection-on-Observables. All quasi-experimental.

**Changes:**

1. **Expand design repertoire** to make experimental designs primary:
   - Between-subjects randomized experiment (simple, factorial, conjoint)
   - Within-subjects / crossover designs
   - Factorial vignette experiments
   - Conjoint analysis (Hainmueller et al.)
   - List experiments / endorsement experiments (sensitive topics)
   - Natural experiments (retain DiD, IV, RDD for observational PS work)
   - DeclareDesign framework for all design declaration and diagnosis

2. **Change estimand vocabulary:**
   - ATE, ITT, CACE (not LATE — PS uses CACE terminology)
   - AMCE (average marginal component effect) for conjoint
   - Conditional ATEs for heterogeneous treatment effects

3. **Add experiment-specific specification elements:**
   - Randomization scheme (simple, blocked, cluster)
   - Power analysis via DeclareDesign `diagnose_design()`
   - Pre-registration platform (EGAP, AsPredicted, OSF)
   - Exclusion criteria (attention checks, comprehension checks, speeders)
   - Manipulation check strategy
   - Consent and debriefing protocol
   - IRB considerations

4. **Reframe "Anticipate Referee Objections" for PS:**
   - "Is this pre-registered?" → link to registry
   - "Demand effects in treatment wording?" → manipulation checks, indirect measures
   - "External validity beyond convenience sample?" → compare demographics to population benchmarks
   - "Multiple comparisons?" → pre-specified correction method
   - "Social desirability bias?" → list experiment or behavioral measure

### 4. `.claude/agents/strategist-critic.md` — MAJOR REWRITE

**Current state:** 300 lines of checklists for DiD (classic + staggered), IV, RDD, Synthetic Control, Event Studies. Zero experimental design content.

**Changes:**

1. **Add new Phase 2 design-specific checklists:**

   **Randomized Experiment (Between-Subjects):**
   - [ ] Randomization mechanism documented (simple, blocked, stratified)
   - [ ] Balance check across treatment arms (F-test, randomization inference)
   - [ ] Attrition analysis: differential by treatment arm?
   - [ ] CONSORT flow diagram: enrollment → randomization → allocation → analysis
   - [ ] ITT vs CACE distinction clear
   - [ ] Pre-registration linked and deviations documented
   - [ ] Attention/comprehension check exclusion criteria pre-specified
   - [ ] Power analysis reported with stated assumptions (effect size, alpha, sample)
   - [ ] DeclareDesign declaration and diagnosis provided

   **Factorial Vignette Experiment:**
   - [ ] Factor levels and dimensions clearly specified
   - [ ] Randomization of factor levels independent (no aliasing)
   - [ ] Main effects and interactions pre-specified
   - [ ] Number of vignettes per respondent justified (fatigue)
   - [ ] Profile restrictions (implausible combinations) documented

   **Conjoint Analysis:**
   - [ ] AMCE interpretation correct (average over attribute distribution)
   - [ ] Randomization constraints documented (no impossible profiles)
   - [ ] Number of tasks per respondent justified
   - [ ] Forced-choice vs. rating scale documented
   - [ ] Attribute order randomization (if applicable)
   - [ ] Marginal means reported alongside AMCEs (Leeper et al.)

2. **Adapt sanity checks:**
   - "Does the direction of the effect make **theoretical** sense?" (not "economic sense")
   - "Is the effect size plausible given prior experimental work on this topic?"
   - "Do subgroup effects tell a coherent story about the mechanism?"

3. **Keep existing quasi-experimental checklists** (DiD, IV, RDD) for observational PS work — just deprioritize them (move to "Other Designs" section)

4. **Update citation fidelity list** for PS methods:
   - Hainmueller, Hopkins & Yamamoto (2014, PA) — conjoint
   - Leeper, Hobolt & Tilley (2020, PA) — marginal means for conjoint
   - Gerber & Green (2012) — field experiments bible
   - Coppock (2019) — generalizing from survey experiments
   - Blair, Coppock & Humphreys (2023) — DeclareDesign
   - Berinsky, Huber & Lenz (2012, PA) — MTurk validity
   - Clifford, Jewell & Waggoner (2015) — Prolific vs MTurk

### 5. `.claude/agents/methods-referee.md` — MAJOR REWRITE

**Current state:** "Applied microeconometrics and causal inference" specialist. Fluent in DiD/IV/RDD/SC/Event Studies.

**Changes:**

1. **Reframe expertise:**
   - "Applied experimental methodology and causal inference in political science"
   - Fluent in: randomized experiments, factorial designs, conjoint analysis, survey methodology, natural experiments, DeclareDesign framework

2. **Revise 5 evaluation dimensions:**

   | Dimension | Current (Econ) | New (PS Experiments) | Weight |
   |-----------|---------------|---------------------|--------|
   | Identification Strategy | DiD/IV/RDD focus | Randomization validity, treatment construction, exclusion criteria | 30% |
   | Estimation & Implementation | Estimator-estimand match | DeclareDesign alignment, correct estimator for design, proper randomization inference | 25% |
   | Statistical Inference | Clustering, few clusters | Robust SEs, multiple comparison corrections, equivalence tests, power | 20% |
   | Robustness & Sensitivity | Oster bounds, placebos | Manipulation checks, demand effect tests, heterogeneity, sensitivity to exclusion criteria | 15% |
   | Replication Readiness | Data + code | Data + code + survey instrument + pre-registration + stimuli | 10% |

3. **Add survey-specific sanity checks:**
   - [ ] **Manipulation check:** Did the treatment actually work?
   - [ ] **Demand effects:** Could respondents guess the hypothesis?
   - [ ] **Sample quality:** Attention check pass rate, completion time distribution
   - [ ] **Effect size:** Plausible given the vignette's intensity?

---

## Detailed Plan: IMPORTANT Files

### 6. `.claude/agents/editor.md`

**Changes:**
- Add PS-specific referee dispositions alongside or replacing economics ones
- New disposition: **PREREGISTRATION** — "Was this pre-registered? Show me the deviations log."
- Revise critical pet peeves:
  - "Demands a formal theoretical model even for reduced-form papers" → "Demands explicit causal framework even for exploratory experiments"
  - "Believes every paper needs a welfare calculation" → "Believes every paper needs a power analysis"
  - "Insists on separate tables for men and women regardless of topic" → "Insists on heterogeneous effects by partisanship/ideology regardless of topic"
  - "Demands event study plot even when not doing DiD" → "Demands manipulation check even for obvious treatments"
  - Add: "Questions whether convenience sample results generalize to voting population"
  - Add: "Demands AAPOR-compliant response rate reporting"
  - Add: "Wants to see DeclareDesign declaration and diagnosis"
- Constructive pet peeves: Add "Impressed by pre-registration and transparent reporting of deviations", "Gives credit for CONSORT flow diagram"

### 7. `.claude/agents/explorer.md`

**Changes to data sources list:**
| Current | New |
|---------|-----|
| Census, ACS, CPS, BLS, FRED, IPUMS | ANES, CCES/CES, Pew Research, GSS (political modules) |
| Medicare, education records | Voter files (L2, TargetSmart), campaign finance (FEC/OpenSecrets) |
| NLSY, PSID, HRS, Add Health | YouGov panels, Lucid, Dynata |
| World Bank, OECD, Eurostat | V-Dem, Polity, UCDP/PRIO, Correlates of War |
| Novel/unconventional | Survey platforms: Qualtrics, Prolific, MTurk, CloudResearch |

### 8. `.claude/agents/librarian.md`

**Changes:**
- Line 22: "Search top-5 generals" → APSR, AJPS, JOP (not AER/JPE/QJE)
- Line 23: "NBER/SSRN/RePEc" → SSRN Political Science eJournals, Google Scholar, JSTOR PS subset
- Line 23: Add field journals: IO, JPR, JCR, Political Psychology, Political Behavior
- Add working paper series: Harvard Kennedy School, Stanford CISAC, Princeton Niehaus Center

### 9. `.claude/agents/coder.md`

**Changes:**
- Add Stage 0.5: **DeclareDesign Declaration**
  - Declare the full design using `declare_model()`, `declare_inquiry()`, `declare_assignment()`, `declare_measurement()`, `declare_estimator()`
  - Run `diagnose_design()` for power/bias/RMSE/coverage diagnostics
  - Compare declared estimands with actual analysis
- Stage 0 additions:
  - Check randomization balance (omnibus F-test + individual covariate balance)
  - Identify and exclude attention check failures, speeders, straight-liners
  - Produce CONSORT flow diagram counts
  - Calculate AAPOR response rates
- Stage 1 modifications:
  - Add randomization inference as default alongside parametric tests
  - Support ordered logistic regression for Likert-scale outcomes
  - Support conjoint analysis via `cregg` or `cjoint` packages
  - Support interaction effects and heterogeneous treatment effects by subgroup
- Stage 2 additions:
  - Multiple comparison corrections (Bonferroni, BH, Romano-Wolf)
  - Equivalence tests (TOST)
  - Sensitivity to exclusion criteria (include/exclude failed attention checks)
  - Manipulation check analysis
- Add global rule: **Before using any R function not previously verified this session, retrieve and review `?function_name` documentation and confirm correct usage**

### 10. `.claude/rules/content-standards.md`

**Changes:**
- Line 20: "AER, QJE, and Econometrica formatting" → "APSR, AJPS, and JOP formatting"
- Line 70-72: Replace econ variable name examples:
  - `Log wages` → `Support for military action`
  - `Female` → `Republican`
  - `Years of education` → `Ideology (7-point scale)`
- Lines 161-172: Replace file naming prefixes:
  - `reg_` → keep (regressions still used)
  - `did_` → `exp_` (experimental results)
  - `first_stage_` → `manipulation_check_`
  - Add `balance_` (randomization balance), `conjoint_` (AMCE results), `het_` (heterogeneous effects)
- Lines 200-270: Replace table templates:
  - Descriptive stats: survey demographics, not wages
  - Balance table: treatment vs control demographic balance
  - Multi-outcome panels: "Panel A: Support for force", "Panel B: Perceived legitimacy"
- Line 189: "Never used in economics journals" → "Never used in political science journals"
- Line 190: "stargazer" → still deprecated; `modelsummary` remains primary

### 11. `.claude/skills/strategize/SKILL.md`

**Changes:**
- Lines 86-102: Reorder PAP platforms: **EGAP** first (user's field), then **OSF/AsPredicted**, then **AEA RCT Registry** last (note it's primarily for economics)
- Add **AsPredicted** as a platform option (simpler format, 9 questions)
- Add DeclareDesign-based power analysis as mandatory PAP section:
  ```r
  design <- declare_model(...) + declare_inquiry(...) + declare_assignment(...) + declare_estimator(...)
  diagnosis <- diagnose_design(design, sims = 500)
  ```
- Update interactive PAP interview questions for survey experiments:
  - Add: "What is the survey instrument? (vignette text, question wording)"
  - Add: "What exclusion criteria will you apply? (attention checks, comprehension, speeders)"
  - Add: "What platform will you recruit participants from?"

### 12. `.claude/skills/discover/SKILL.md`

**Changes:**
- Line 72-74: Replace "AER, Econometrica, QJE, JPE, REStud" → APSR, AJPS, JOP
- Line 74: "NBER/SSRN/IZA" → "SSRN PS eJournals, Google Scholar"
- Lines 111-114: Replace data source categories:
  - "CPS, ACS, NHIS, MEPS" → "ANES, CCES, Pew, GSS"
  - "Medicare claims, tax records" → "Voter files, campaign finance (FEC)"
  - "RAND HRS, PSID, Add Health, NLSY" → "YouGov, Prolific panels, Lucid"
  - Keep international and novel categories

### 13. `.claude/skills/submit/SKILL.md`

**Changes:**
- Line 29: "AEA-compliant replication package" → "Dataverse-compliant replication package (APSR/JOP standard)"
- Line 36: "AEA standards" → "APSR/JOP dataverse deposit standards"
- Check 10: "README Completeness (AEA Format)" → "README Completeness (Dataverse Format)"
- Add to package contents: survey instrument, pre-registration link, stimuli materials, IRB approval documentation

### 14. `.claude/agents/verifier.md`

**Changes:**
- Line 1 description: "AEA replication package audit" → "Dataverse replication package audit"
- Lines 56-90: Replace "AEA Data Editor" references with PS dataverse standards
- Check 10: "AEA Format" README → Dataverse format
- **NEW: Cross-language replication check (extending existing functionality):**
  - When verifying R code, attempt to replicate core analyses in Python (pandas + statsmodels + pingouin/scipy)
  - Flag discrepancies beyond tolerance thresholds
  - Add as Check 11 in submission mode

### 15. `CLAUDE.md`

**Changes:**
- Line 5: `[YOUR FIELD]` → "Political Science — Experimental Political Psychology / Public Opinion / International Security"
- Line 7: "applied economics" default text — update to political science
- Compilation commands: keep as-is (XeLaTeX + biber is correct)
- Section structure suggestion (line ~configurable): Add "Experimental Design" as standard section name

### 16. `MEMORY.md`

**Changes:** Clear economics-specific entries and replace with PS equivalents:
- Remove: `[LEARN:skills] regression formatter (economics)` example
- Keep: all workflow, documentation, design philosophy, and governance entries (field-neutral)
- Add: `[LEARN:field] DeclareDesign is the primary framework for design declaration, power analysis, and diagnosis in all projects`
- Add: `[LEARN:field] Pre-registration on EGAP or AsPredicted before data collection — non-negotiable`
- Add: `[LEARN:field] AAPOR reporting standards for survey methodology`

---

## New Capabilities to Create

### N1: Survey Instrument Reviewer Agent (`.claude/agents/survey-instrument-reviewer.md`)

**Purpose:** Reviews survey instruments for quality and alignment with pre-registered hypotheses.

**Evaluation dimensions:**
1. **Question wording** — ambiguity, double-barreled items, leading language
2. **Response options** — balanced scales, adequate range, "don't know" option
3. **Order effects** — primacy/recency, question sequencing, priming
4. **Acquiescence bias** — one-directional items, reverse-coded items present?
5. **Treatment fidelity** — do vignettes/treatments actually manipulate the intended construct?
6. **PAP alignment** — does the instrument match the pre-registered hypotheses and outcomes?
7. **Comprehension** — reading level, cognitive burden, attention check placement
8. **Sensitive items** — social desirability risk, list experiment appropriateness

**Paired with:** Could create a `survey-instrument-critic.md` OR operate as standalone reviewer (your call).

### N2: Experimental Methods Reviewer Agent (`.claude/agents/experimental-methods-reviewer.md`)

**Purpose:** Evaluates design choices against DeclareDesign textbook and Gerber & Green.

**Knowledge base:**
- `.claude/references/declaredesign-book.pdf` (once generated)
- `.claude/references/Field Experiments (Alan S. Gerber, Donald P. Green).pdf`

**Evaluation dimensions:**
1. **Randomization** — mechanism, balance, blocking strategy
2. **Treatment construction** — operationalization, manipulation strength, demand effects
3. **Manipulation checks** — appropriate, well-timed, informative
4. **Outcome measurement** — construct validity, reliability, sensitivity
5. **Statistical power** — DeclareDesign diagnosis, effect size assumptions
6. **Threats to validity** — internal (attrition, noncompliance, SUTVA) and external (sample, setting)

**Behavior when texts disagree:** Gerber & Green emphasizes field experimental concerns (compliance, spillovers); DeclareDesign emphasizes formal design diagnosis and simulation. Note which text supports each recommendation.

### N3: IRB Drafter Agent (`.claude/agents/irb-drafter.md`)

**Purpose:** Auto-fills Duke IRB application using `.claude/references/Duke_IRB.docx` template.

**Inputs:** Project description, survey instrument, consent language, pre-registration.

**Behavior:**
1. Read Duke IRB template structure
2. Map project components to IRB fields
3. Generate completed .docx using python-docx
4. Flag any fields that require researcher judgment (risk level, vulnerable populations)
5. Mark all auto-filled fields with `[AUTO-FILLED — REVIEW]`

**Output:** `paper/replication/irb_application_draft.docx`

### N4: QSF Builder Agent (`.claude/agents/qsf-builder.md`)

**Purpose:** Converts a survey instrument specification into Qualtrics Survey Format (QSF).

**Capabilities:**
- Parse instrument from markdown/LaTeX/plain text
- Build QSF JSON with block structure
- Implement display logic (branching, skip patterns)
- Set up randomization (treatment arms, factorial designs, conjoint profiles)
- Configure response options (Likert, multiple choice, open-ended, sliders)
- Add attention checks and comprehension checks
- Set timing and progress bar options

**Output:** `.qsf` file importable directly into Qualtrics.

### N5: R Function Verification Rule (`.claude/rules/r-function-verification.md`)

**Content:** Global rule enforced on the coder agent:
- Before using any R function not previously verified in this session, the agent must run `?function_name` or `help(function_name)` and confirm correct argument names, default values, and behavior
- Maintain a session-level verified function list
- Exception: base R functions (c, mean, sum, length, etc.) are pre-verified

### N6: New-Project PowerShell Script (`scripts/New-ResearchProject.ps1`)

**Functionality:**
1. Accept project name and optional GitHub organization as parameters
2. Create private GitHub repo via `gh repo create`
3. Clone this template repo into the new directory
4. Remove `.git` history, reinitialize
5. Set remote to the new private repo
6. Push initial commit
7. Open VS Code in the new directory

**Also:** Expose as `/new-project` slash command (distinct from existing `/new-project` which orchestrates the pipeline within a repo).

### N7: Extend Verifier for Cross-Language Replication

**Changes to `.claude/agents/verifier.md`:**
- New Check 11 (submission mode): Cross-language replication
  - For each R analysis script, attempt equivalent in Python (pandas + statsmodels + pingouin)
  - Compare point estimates, standard errors, p-values
  - Flag discrepancies beyond tolerance (from domain-profile.md)
  - Report: which results replicate, which diverge, likely cause of divergence

---

## Proposed Execution Order

### Phase 1: Foundation (do first — everything else depends on these)
1. **`.claude/references/domain-profile.md`** — populate for political science
2. **`.claude/references/journal-profiles.md`** — replace all profiles with PS journals
3. **`CLAUDE.md`** — fill in field placeholders

### Phase 2: Core Agents (the "brain" of the system)
4. **`.claude/agents/strategist.md`** — add experimental design framework
5. **`.claude/agents/strategist-critic.md`** — add experimental design checklists
6. **`.claude/agents/methods-referee.md`** — reframe for experimental PS
7. **`.claude/agents/domain-referee.md`** — adjust for PS field concerns
8. **`.claude/agents/editor.md`** — PS journal culture, dispositions, pet peeves

### Phase 3: Support Agents
9. **`.claude/agents/explorer.md`** — PS data sources
10. **`.claude/agents/librarian.md`** — PS search protocol
11. **`.claude/agents/coder.md`** — DeclareDesign framework, experimental analysis pipeline
12. **`.claude/agents/verifier.md`** — dataverse standards, cross-language replication

### Phase 4: Skills and Rules
13. **`.claude/skills/strategize/SKILL.md`** — PAP registries, DeclareDesign power
14. **`.claude/skills/discover/SKILL.md`** — PS journals and data sources
15. **`.claude/skills/submit/SKILL.md`** — dataverse deposit standards
16. **`.claude/rules/content-standards.md`** — PS table/figure examples
17. **`.claude/rules/working-paper-format.md`** — minor section name changes

### Phase 5: New Capabilities
18. **Create survey-instrument-reviewer agent**
19. **Create experimental-methods-reviewer agent**
20. **Create IRB drafter agent**
21. **Create QSF builder agent**
22. **Create R function verification rule**
23. **Create New-ResearchProject.ps1 PowerShell script**

### Phase 6: Cleanup
24. **`MEMORY.md`** — clear economics entries, add PS entries
25. **`README.md`** — update any economics-specific examples
26. **`guide/*.qmd`** — update documentation examples
27. **`.claude/WORKFLOW_QUICK_REF.md`** — update if needed

---

## Questions Before Proceeding

1. **DeclareDesign enforcement level:** You said "use DeclareDesign at every step where it is capable." Should I make DeclareDesign mandatory (the coder-critic deducts points if not used) or recommended (flagged but not penalized)? My recommendation: **mandatory for design declaration and power analysis; recommended for estimation** (since some estimators aren't yet in DeclareDesign).

2. **Existing quasi-experimental content:** Should I **remove** the DiD/IV/RDD checklists from strategist-critic, or **keep them** in a secondary section? Political scientists do use these methods for observational work. My recommendation: **keep but deprioritize** — move to an "Observational Designs" subsection after the experimental checklists.

3. **Survey instrument reviewer pairing:** Should this be a worker-critic pair (survey-instrument-creator + survey-instrument-reviewer) or a standalone reviewer only? Since you're writing instruments yourself and want the agent to review them, I think **standalone reviewer** makes more sense.

4. **Journal profile scope:** Your target list has 9 journals. Should I also add profiles for closely adjacent venues (JEPS, POQ, Political Analysis, ISQ, CPS, PSRM) or keep it tight? My recommendation: **include all 15** — it's little extra effort and makes the system more useful across project types.

5. **New-Project command naming:** The existing `/new-project` skill orchestrates the full research pipeline within a repo. Your requested PowerShell script provisions a new GitHub repo from scratch. These are genuinely different operations. Options:
   - Rename the PowerShell script command to `/init-project` or `/provision-repo`
   - Rename the existing `/new-project` to `/run-pipeline` and give the PowerShell script `/new-project`
   - Keep both with different invocation paths (skill vs. PowerShell)

   My recommendation: **`/init-project`** for the PowerShell provisioner, keep `/new-project` for the pipeline orchestrator.

6. **Cross-language replication scope:** When the verifier replicates R in Python, should it attempt **all analyses** or just **main specifications**? Full replication of conjoint analyses in Python would require `statsmodels` + custom conjoint code. My recommendation: **main specifications only** — balance tests, primary treatment effects, and key heterogeneity analyses.

7. **IRB drafter — Duke-specific or generalizable?** The Duke IRB template is specific. Should I build the agent to handle only the Duke template, or design it to be template-flexible (read any .docx IRB template and fill it)? My recommendation: **template-flexible with Duke as default** — you may change institutions or collaborate across schools.

8. **Quality weight adjustment:** The current quality weights give 25% to "identification validity." For experimental work where randomization handles identification, should this weight shift toward "design pre-registration" and "survey instrument quality"? Current weights may undervalue what matters most for your work.
