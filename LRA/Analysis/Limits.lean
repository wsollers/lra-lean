import LRA.Analysis.Limits.Definition
import LRA.Analysis.Limits.Theorems

/-!
Aggregate import for function-limit modules: limits at a point (one-sided
limits, algebra of limits, the sequential criterion) and limits at
infinity. Promoted out of `Continuity` — its algebra depends on
`Functions`' pointwise-operation algebra to even state (`lim (f+g) = lim f
+ lim g` needs `f+g` defined), and `Differentiation` depends on it
directly (the derivative is a limit of a difference quotient), not through
`Continuity`'s own `ContinuousAtPoint`. Curricular order:
`Sequences → Functions → Limits → Continuity → Differentiation`.
-/
