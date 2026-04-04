# DeclareDesign Blog Post Index

**Location:** `.claude/references/declaredesignbook/`
**Note:** Blog post HTML files are large (700KB-1MB) due to embedded CSS/JS. Read this index first; only open a specific HTML file when the topic is directly relevant to the current design.

---

| Blog Post | Topic | Relevant Design Types | Key Takeaway |
|-----------|-------|----------------------|--------------|
| Randomization does not justify t-tests | Inference | All experiments | Classical t-tests assume random sampling, not random assignment. Use randomization inference or robust SEs instead. |
| Common estimators of uncertainty overestimate uncertainty | Standard errors | All experiments | Standard Neyman estimator of variance is conservative; precision gains available through covariate adjustment (Lin estimator). |
| Sometimes blocking can reduce your precision | Blocking | Blocked experiments | Blocking on non-prognostic covariates can reduce precision. Block only on variables that predict the outcome. |
| The trouble with 'controlling for blocks' | Blocking | Blocked experiments | Including block fixed effects in regression can reduce precision compared to block-weighted estimators when blocks have unequal size. |
| Improve power using your answer strategy, not just your data strategy | Power analysis | All | Covariate adjustment (Lin estimator) and improved estimation can increase power without increasing N. |
| How misleading are clustered SEs in designs with few clusters? | Clustering | Cluster experiments | With fewer than ~50 clusters, cluster-robust SEs are badly biased. Use wild cluster bootstrap or randomization inference. |
| Sometimes you need to cluster standard errors above the level of treatment | Clustering | Cluster experiments, multi-site | When outcomes are correlated within groups larger than the treatment unit, cluster at the higher level. |
| How controlling for pretreatment covariates can introduce bias | Covariate adjustment | All | Post-treatment variable conditioning creates collider bias. Only control for pre-treatment covariates. |
| With great power comes great responsibility | Power analysis | All | Overpowered designs can detect trivially small effects. Consider the minimum effect size of substantive interest, not just statistical significance. |
| A journal of null results is a flawed fix for a significance filter | Publication bias | All | Publishing null results doesn't fix the significance filter. Pre-registration and design diagnosis are better solutions. |
| Use change scores or control for pre-treatment outcomes? | Pre-post designs | Pre-post experiments | Change scores vs. ANCOVA depends on the true DGP. ANCOVA is generally preferred unless the treatment effect is proportional to baseline. Diagnose with DeclareDesign. |
| Get me a random assignment YESTERDAY | Randomization | All experiments | Practical guide to implementing random assignment quickly using `randomizr`. |
| What does a p-value tell you about the probability a hypothesis is true? | Inference | All | A p-value is not the probability the null is true. Bayesian posterior probability depends on the prior. |
| How post-hoc power calculation is like a shit sandwich | Power analysis | All | Post-hoc power calculations are uninformative — they are a monotonic function of the p-value. Only pre-study power analysis is useful. |
| Should a pilot study change your study design decisions? | Piloting | All experiments | Pilot data are noisy for effect size estimation. Use pilots for logistics and implementation, not for updating power calculations. |
| Some designs have badly posed questions and design diagnosis can alert you | Design diagnosis | All | Some estimands are undefined or ill-posed for certain designs. `diagnose_design()` catches this by revealing extreme bias or zero power. |
| An instrument does not have to be exogenous to be consistent | IV designs | Instrumental variables | Under certain conditions (e.g., measurement error in the instrument), 2SLS can be consistent even with a non-exogenous instrument. Nuanced — read carefully before applying. |
| What can you learn from simulating qualitative inference strategies? | Qualitative methods | Process tracing, case studies | DeclareDesign can declare and diagnose qualitative designs too. Useful for mixed-methods researchers. |

---

## Priority Reading by Design Phase

| Phase | Most Relevant Posts |
|-------|-------------------|
| **Designing** | "Sometimes blocking can reduce your precision", "Improve power using your answer strategy" |
| **Power analysis** | "How post-hoc power calculation is like a shit sandwich", "With great power comes great responsibility", "Should a pilot study change your study design decisions?" |
| **Estimation** | "Randomization does not justify t-tests", "Common estimators of uncertainty overestimate uncertainty", "Use change scores or control for pre-treatment outcomes?" |
| **Clustering** | "How misleading are clustered SEs in designs with few clusters?", "Sometimes you need to cluster standard errors above the level of treatment" |
| **Covariate adjustment** | "How controlling for pretreatment covariates can introduce bias", "The trouble with 'controlling for blocks'" |
| **Diagnosis** | "Some designs have badly posed questions", "A journal of null results is a flawed fix" |
