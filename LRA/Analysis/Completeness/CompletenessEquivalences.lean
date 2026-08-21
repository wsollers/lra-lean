import LRA.Analysis.Completeness.Completeness.Definition.CompletenessEquivalences
import LRA.Analysis.Completeness.Completeness.Theorems.CompletenessEquivalences
import LRA.Analysis.Completeness.Equivalence

/-!
Aggregate import for the completeness-equivalence material. `HasGreatestLowerBoundProperty`,
`CauchySequencesConverge`, and `BolzanoWeierstrassProperty` live in
`Completeness/Completeness/Definition/CompletenessEquivalences.lean`; the
directional process-convergence implications live in
`Completeness/Completeness/Theorems/CompletenessEquivalences.lean`; the
"following are equivalent" TFAE capstones
(`LubPropertyEquivalentToMonotoneProcessConvergence`,
`LubPropertyEquivalentToNestedIntervalProperty`,
`StandardCompletenessEquivalences`) moved to `Equivalence/`, alongside the
hub-and-spoke iff lemmas they're built from.
-/
