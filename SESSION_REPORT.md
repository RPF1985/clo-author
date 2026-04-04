# Session Report -- Argument Durability

## 2026-04-03 -- Full Discovery + Strategy Session

**Operations:**
- Conducted discovery interview (9 questions) → research specification
- Literature review: 3 passes, 55 papers, librarian-critic scores 50→85→88/100
- Updated domain profile with perseverance, framing, just war seminal references
- Reframed paper from directional fragility hypothesis to competing predictions (fragility vs. resilience vs. additivity)
- Targeted novelty search confirmed gap across 5 search vectors
- Merged clo-author template updates (`template/main`, 19 files)
- Strategy memo: 2 rounds, strategist-critic scores 76→93/100
- Created APO cross-pollination task list in sibling project

**Decisions:**
- Paper framed as adjudicating between 3 competing predictions (not directional) — publishable at AJPS, Political Psychology per journal norms
- H1a (fragility/averaging), H1b (resilience/perseverance), H1c (additivity/rational updating) — all pre-registered, all informative
- H2 (loss > gain) deferred to follow-up study — processing confound in gain arm unresolvable
- Gain arm dropped → 9 core cells + T0 baseline, 250/cell, N=2,000
- ANCOVA primary, change-score as first robustness
- Belief perseverance literature (Anderson, Lepper & Ross 1980) is strongest competing prediction — paper must engage directly

**Results:**
- Research spec: `quality_reports/research_spec_argument_durability.md`
- Lit review (88/100): `quality_reports/lit_review_argument_durability.md` + `quality_reports/literature/argument-durability/`
- Strategy memo (93/100): `quality_reports/strategy/argument-durability/strategy_memo.md`
- Power analysis: `quality_reports/strategy/argument-durability/power_analysis.md`
- Robustness plan (15 checks): `quality_reports/strategy/argument-durability/robustness_plan.md`
- Falsification tests (8 tests): `quality_reports/strategy/argument-durability/falsification_tests.md`

**Commits:**
- `16b2f0b` Add discovery phase outputs: research spec, literature review, domain profile updates
- `9007124` Merge clo-author template updates into project
- `1e383cb` Reframe paper as competing predictions; targeted novelty search confirms gap
- `bedb130` Complete strategy phase: experimental design for argument durability (93/100)

**Status:**
- Done: Discovery phase, literature review (3 passes), strategy phase (2 rounds), APO cross-pollination
- Pending: Pre-analysis plan (`/strategize pap`), survey instrument development, pilot testing, DeclareDesign implementation
- Coder fix needed: Estimand-regression mismatch (binary is_hybrid → targeted contrasts per matched pure condition)
- Minor lit gaps: Walter & Murphy (2018) CIE meta-analysis, Kamenica & Gentzkow (2011) for Bayesian benchmark

---

## 2026-04-03 -- Strategy Memo Revision (Round 2)

**Operations:**
- Revised `quality_reports/strategy/argument-durability/strategy_memo.md` -- all 8 major/moderate issues + 4 minor issues addressed
- Revised `quality_reports/strategy/argument-durability/power_analysis.md` -- gain arm dropped, N reallocated (200->250/cell), TOST sensitivity added
- Revised `quality_reports/strategy/argument-durability/robustness_plan.md` -- added TOST sensitivity (3 bounds), extreme-attitude exclusion, pooled interaction as secondary spec
- Revised `quality_reports/strategy/argument-durability/falsification_tests.md` -- Test 5 rephrased as hypothetical evaluation
- Revised `quality_reports/strategy/argument-durability/pseudo_code.md` -- flagged as conceptual, fixed to separate beta_4/beta_5 specification

**Decisions:**
- Dropped gain arm (Option B) -- frees 300 respondents for core cells, eliminates H2 processing confound, H2 deferred to follow-up study
- Added no-justification baseline (T0, N=75) -- anchors w_k for H1c additivity test externally
- ANCOVA is primary throughout (resolved inconsistency between Sections 5 and 12)
- First-scenario-only is confirmatory for H4 symmetry test (within-subject version is supplementary)
- w_k = 0.5 is confirmatory; data-estimated w_k is exploratory
- TOST bounds reported at +/- 0.10, 0.15, 0.20 SD (0.15 is primary)

**Results:**
- All 4 major issues addressed (2.1, 2.2, 2.3, 2.5)
- All 4 moderate issues addressed (2.4, 2.6, 3.1, 3.2)
- All 4 minor issues addressed (4.1, 4.2, 4.3, 3.3, 3.4)
- Net design: 10 cells (down from 11), ~2,100 total N, 250/cell for core cells

**Status:**
- Done: Strategy revision round 2 complete
- Pending: Strategist-critic re-review for score >= 80
