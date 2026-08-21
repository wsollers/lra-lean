import LRA.Analysis.Limits.Definition
import LRA.Analysis.Limits.Theorems
import LRA.Analysis.Limits.Algebra
import LRA.Analysis.Limits.Equivalence
import LRA.Analysis.Limits.LimitsAtInfinity

/-!
Aggregate import for function-limit modules. `Definition`/`Theorems` hold
the ε-δ definition, one-sided limits, and basic properties (uniqueness,
composition); `Algebra` holds compatibility with `ℝ`'s ring operations and
the squeeze theorem; `Equivalence` holds the one-sided/sequential/
neighborhood characterizations and their TFAE; `LimitsAtInfinity` holds
limits as `x → ±∞`. `Order`, `Divergence`, `Asymptotes`, and
`IndeterminateForms` are still to come.

Promoted out of `Continuity` — its algebra depends on `Functions`'
pointwise-operation algebra to even state (`lim (f+g) = lim f + lim g`
needs `f+g` defined), and `Differentiation` depends on it directly (the
derivative is a limit of a difference quotient), not through `Continuity`'s
own `ContinuousAtPoint`. Curricular order:
`Sequences → Functions → Limits → Continuity → Differentiation`.
-/
