# Research Specification: The Durability of Hybrid Arguments Under Partial Disconfirmation

## Research Question

When a political position rests on both normative and practical justifications (a "hybrid argument"), does its structural complexity make it more fragile, more resilient, or no different from pure arguments when one justification is disconfirmed? Three established theoretical traditions make competing predictions — this paper provides the first experimental test.

## Motivation

Political elites routinely justify policies on multiple grounds simultaneously: war is waged for both national security (practical) and allied self-determination (normative); trade agreements are defended as both economically efficient and morally fair; climate policy is framed as both cost-saving and ethically obligatory. These hybrid justifications are the norm in political discourse, not the exception.

Yet we know almost nothing about their structural properties under stress. When events undermine one leg of a hybrid argument — a war decreases rather than increases security, an ally turns out not to be democratic, a trade deal fails to deliver promised jobs — does the remaining leg hold? Three well-established literatures make competing predictions:

1. **Averaging/dilution theory** (Obermaier & Koch 2024; Weaver, Garcia & Schwarz 2012; Nisbett, Zukier & Lemley 1981) predicts **fragility**: people average rather than add when processing multiple arguments, so disconfirmation of one component reveals the position was weaker than perceived, and a credibility cascade may contaminate the surviving justification.

2. **Belief perseverance theory** (Anderson, Lepper & Ross 1980; Ross, Lepper & Hubbard 1975; Johnson & Seifert 1994) predicts **resilience**: once people generate causal explanations connecting justifications to a position, removing one justification does not eliminate the position. Hybrid arguments involve richer explanatory structures that should survive partial pruning better than single-justification arguments.

3. **Rational updating** predicts **additivity**: support declines proportionally to the weight of the disconfirmed component, with no interaction between justification types. The surviving leg is unaffected.

These competing predictions have never been tested against each other in the context of compound political arguments. This matters for democratic accountability: the structural properties of hybrid justifications determine whether elites who "stack" arguments are building durable coalitions or brittle ones, and whether the common strategy of reinforcing moral claims with practical benefits is effective or counterproductive.

## Hypotheses

### Competing Primary Hypotheses

**H1a (Fragility — averaging/dilution):** When one component of a hybrid argument is disconfirmed, support drops *more* than it does for a pure argument of the surviving type that was never paired with the disconfirmed component. The hybrid structure is more vulnerable than its parts.

**H1b (Resilience — perseverance):** When one component of a hybrid argument is disconfirmed, support drops *less* than it does for a pure argument of the disconfirmed type. The hybrid structure is more durable because the surviving justification anchors the position and provides a ready-made alternative explanation.

**H1c (Additivity — rational updating):** When one component of a hybrid argument is disconfirmed, support drops proportionally to that component's independent contribution. No interaction between justification types — the surviving leg is unaffected.

### Additional Primary Hypothesis

**H2 (Asymmetric gain/loss):** Adding a new justification to an existing argument increases support *less* than removing a justification of equivalent initial strength decreases it. (Loss aversion in argument structure.) This hypothesis is directional and holds regardless of whether H1a, H1b, or H1c is supported.

### Secondary Hypotheses

**H3 (Cross-domain generality):** The pattern observed in H1 (whichever variant is supported) holds across multiple policy domains (war, trade, climate, immigration), suggesting a general property of hybrid argument structure rather than a domain-specific phenomenon.

**H4 (Symmetry):** The H1 pattern holds symmetrically — disconfirming the normative leg and disconfirming the practical leg produce comparable structural effects. These are tested independently.

### Mechanism Hypotheses (Discriminating Between H1a and H1b)

**H5a (Credibility cascade — supports H1a):** Disconfirmation of one component reduces perceived credibility of the *remaining* component, mediating the fragility effect. Measured via post-disconfirmation credibility ratings of the surviving justification.

**H5b (Anchoring/compensation — supports H1b):** Disconfirmation of one component increases perceived importance of the *remaining* component, mediating the resilience effect. The surviving justification takes on compensatory weight.

## Empirical Strategy

### Part 1: Survey Experiment

**Design:** Between-subjects randomized experiment with within-subject replication across policy domains.

**Treatment structure (per policy scenario):**

| Condition | Phase 1 (Justification) | Phase 2 (Disconfirmation) |
|-----------|------------------------|--------------------------|
| Normative only | Normative argument | Normative disconfirmed |
| Normative only (control) | Normative argument | Practical disconfirmed (irrelevant) |
| Practical only | Practical argument | Practical disconfirmed |
| Practical only (control) | Practical argument | Normative disconfirmed (irrelevant) |
| Hybrid → practical disconfirmed | Normative + practical | Practical disconfirmed |
| Hybrid → normative disconfirmed | Normative + practical | Normative disconfirmed |

**Additional condition for H3:** A "gain" arm where respondents initially receive a single-justification argument and then receive an additional justification.

**Key design features:**
- Multiple policy domains per respondent (minimum 3: war, trade, climate/environment, possibly immigration)
- Randomized scenario order
- Filler scenarios between treatment scenarios to prevent respondents from anticipating the disconfirmation pattern
- Attention checks and comprehension checks
- Manipulation checks: verify respondents perceived the justification type and the disconfirmation event

**Outcome measures:**
- Policy support (primary): 7-point scale, pre and post disconfirmation
- Argument credibility (mediator): perceived strength of remaining justification
- Certainty/confidence in position
- Willingness to advocate for the position publicly

**Identification:** Random assignment to justification condition ensures causal identification of the effect of argument structure on support durability. The key comparison is: support change in hybrid condition vs. support change in matched pure condition after the same disconfirmation event.

**Threats and mitigations:**
- *Demand effects:* Filler scenarios, careful scenario design to obscure hypothesis. Post-experiment suspicion probe.
- *Order effects:* Randomize scenario order; test for order effects in analysis.
- *Ceiling/floor effects:* Pilot test to calibrate initial support levels.
- *Equivalence of disconfirmation:* Pre-test disconfirmation events for perceived strength.

### Part 2: Observational/Textual Analysis (Suggestive, Not Causal)

**Approach:** Code elite rhetoric (presidential speeches, Congressional floor statements, op-eds) for justification type (normative, practical, hybrid) across selected historical cases. Match to public opinion time series. Examine whether opinion shifts are larger after events that undermine the practical or normative rationale.

**Cases (preliminary):**
- War context: Iraq War (WMD disconfirmation = practical leg kicked out; Abu Ghraib = normative leg kicked out)
- Trade context: NAFTA (job loss evidence = practical disconfirmation)
- Climate context: Economic cost revelations for climate policy
- Additional cases TBD based on data availability

**Limitations (acknowledged upfront):** Public opinion polls generally do not capture *why* individuals support a policy, so we cannot directly observe individual-level justification type in observational data. This component serves as external validity and motivation, not as a second causal test.

## Data

### Experiment
- **Platform:** Qualtrics (deployment) + Prolific or similar recruitment panel
- **Sample:** ~1,500-2,000 respondents (exact N from power analysis pending)
- **Population:** US adults; stratified by partisanship, age, education
- **Pre-registration:** EGAP or OSF, before data collection

### Observational Component
- **Elite rhetoric:** Presidential speeches (American Presidency Project), Congressional Record, major newspaper op-eds
- **Public opinion:** Gallup, Pew, ANES time series, war-specific polls (e.g., Gelpi/Feaver Iraq War polls)
- **Events:** Dated historical events with clear disconfirmation of normative or practical rationales

## Expected Results

This paper is framed as adjudicating between three theoretically derived competing predictions. All outcomes are pre-registered and theoretically informative:

1. **If H1a (fragility):** Hybrid arguments show *greater* support decline than pure arguments after matched disconfirmation. The credibility cascade mechanism (H5a) mediates: disconfirmation of one leg reduces perceived credibility of the surviving leg. This would extend the averaging/dilution tradition into post-formation durability.
2. **If H1b (resilience):** Hybrid arguments show *smaller* support decline than pure arguments. The anchoring/compensation mechanism (H5b) mediates: the surviving leg takes on compensatory weight. This would extend the belief perseverance tradition to compound argument structures.
3. **If H1c (additivity):** Hybrid arguments decline proportionally — no interaction between justification types. This would suggest the public is more rational about compound arguments than either the perseverance or averaging literatures predict.
4. **H2 (loss > gain asymmetry):** Regardless of which H1 variant holds, losing a justification reduces support more than gaining one increases it. This is a directional prediction derived from prospect theory.
5. **H3 (cross-domain generality):** The pattern replicates across war, trade, climate, and immigration domains.

## Contribution

This paper introduces the concept of **argument structure durability** — the idea that the *combination* of justifications supporting a political position has emergent properties that differ from the individual justifications considered separately. Three established literatures make competing predictions about these properties, but none has tested them:

- **Belief perseverance** (Anderson, Lepper & Ross 1980): predicts resilience, but has only tested single beliefs with fabricated evidence — not compound political arguments with real-world disconfirmation
- **Averaging/dilution** (Obermaier & Koch 2024; Weaver et al. 2012): predicts fragility, but studies initial persuasion — not post-formation durability under disconfirmation
- **Framing effects** (Chong & Druckman 2007): studies *competing* frames — not *reinforcing* frames under stress
- **Belief network models** (Dalege et al. 2016): provide theoretical scaffolding for how attitudes with multiple bases might respond to partial disconfirmation, but the specific competing-predictions test has not been conducted
- **Motivated reasoning** (Taber & Lodge 2006): studies how prior attitudes filter information — not how justification *structure* moderates disconfirmation responses

The paper bridges four literatures that have developed in isolation (perseverance, averaging, framing, belief networks) by asking a question none has posed: when a political position rests on both normative and practical justifications, does the compound structure create fragility, resilience, or additivity when one justification is disconfirmed?

**Literature gap confirmed:** Three passes of targeted literature search (55 papers across political science, social psychology, communication, moral psychology, behavioral economics, consumer behavior, and philosophy) confirm that this specific three-way test is novel. The Chan et al. (2017) perseverance meta-analysis confirms that structural complexity has not been tested as a moderator. See `quality_reports/literature/argument-durability/positioning.md` for full novelty assessment.

## Open Questions

1. **Power analysis:** How many respondents per cell? Depends on expected effect size — needs piloting or calibration from adjacent literature.
2. **Number of scenarios:** Minimum 3 domains confirmed; 4th (immigration) contingent on viable scenario construction. Need to pilot-test scenario equivalence.
3. **Disconfirmation strength calibration:** How strong should the disconfirmation event be? Too weak = null results; too strong = floor effects. Requires pre-testing.
4. **Mechanism measurement:** How best to measure both the credibility cascade (H5a) and anchoring/compensation (H5b)? Direct questions about remaining argument strength, perceived credibility of surviving leg, and importance ratings.
5. **Observational case selection:** Which historical cases have the cleanest separation between normative and practical disconfirmation events, with sufficient polling data?
6. **Scope of "political":** Should we include non-political hybrid arguments as a benchmark (e.g., health decisions with moral and practical justifications)?
7. **Pre-existing attitudes:** How to handle respondents who already have strong opinions on the policy topics used in vignettes? Likely a moderator, not an exclusion criterion.
8. **Bayesian benchmark:** The rational updating prediction (H1c) needs a formal operationalization — how do we define "proportional decline" to test against?
