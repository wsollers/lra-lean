import Mathlib.Algebra.Order.Archimedean.Basic
import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Instances.Real.Lemmas

namespace LRA.Analysis.Completeness

/--
`ArchimedeanProperty` TODO

Predicate logic:

  ∃ n ∈ ℕ, n ∈ ℝ * x > y

Predicate logic (unfolded):

  ∀ {x y : Real}, (Real.instLT.1 Zero.toOfNat0.1 x ∧ Real.instLT.1 Zero.toOfNat0.1 y) → Exists fun n => Real.instLT.1 y (instHMul.1 (Real.instNatCast.1 n) x)

Logical form (Lean):

```lean
theorem ArchimedeanProperty {x y : ℝ}
    (positiveScaleHypothesis : x > 0)
    (positiveTargetHypothesis : y > 0) :
    ∃ n : ℕ, (n : ℝ) * x > y
```

Type-theoretic form:

  TODO

Proof use:

  TODO

After unfold / common proof state:

  TODO

Common confusions:

  TODO

Related proof moves: use, rcases

-/
theorem ArchimedeanProperty {x y : ℝ}
    (positiveScaleHypothesis : x > 0)
    (positiveTargetHypothesis : y > 0) :
    ∃ n : ℕ, (n : ℝ) * x > y := by
  sorry

end LRA.Analysis.Completeness
