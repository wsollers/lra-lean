import LRA.Analysis.Limits.Definition
import LRA.Analysis.Limits.Theorems
import LRA.Analysis.Limits.Algebra
import LRA.Analysis.Limits.Order
import LRA.Analysis.Limits.Equivalence
import LRA.Analysis.Limits.LimitsAtInfinity
import LRA.Analysis.Limits.Divergence
import LRA.Analysis.Limits.Asymptotes
import LRA.Analysis.Limits.IndeterminateForms

/-!
Aggregate import for function-limit modules. `Definition`/`Theorems` hold
the ε-δ definition, one-sided limits, and basic properties (uniqueness,
composition); `Algebra` holds compatibility with `ℝ`'s ring operations and
the squeeze theorem; `Order` holds `≤`-preservation, local boundedness,
and sign persistence; `Equivalence` holds the one-sided/sequential/
neighborhood characterizations and their TFAE; `LimitsAtInfinity` holds
limits as `x → ±∞`; `Divergence` holds the ways a limit can fail to exist;
`Asymptotes` holds horizontal/vertical/oblique asymptotes;
`IndeterminateForms` holds the seven classic forms, resolved algebraically
(no derivatives, no Taylor expansion) and shown genuinely indeterminate.

Promoted out of `Continuity` — its algebra depends on `Functions`'
pointwise-operation algebra to even state (`lim (f+g) = lim f + lim g`
needs `f+g` defined), and `Differentiation` depends on it directly (the
derivative is a limit of a difference quotient), not through `Continuity`'s
own `ContinuousAtPoint`. Curricular order:
`Sequences → Functions → Limits → Continuity → Differentiation`.
-/
