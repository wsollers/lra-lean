import Mathlib.Algebra.Order.Archimedean.Basic
import Mathlib.Algebra.Order.Field.Basic
import Mathlib.Order.Filter.AtTopBot.Basic
import Mathlib.Topology.Instances.Real.Lemmas

namespace LRA.Analysis.Completeness

/--
`ArchimedeanProperty` TODO

Predicate logic:

  ∀ {x y : Real}, (GT.gt x 0 ∧ GT.gt y 0) → Exists fun n => GT.gt (instHMul.hMul n.cast x) y

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    x y : ℝ
    positiveScaleHypothesis : x > 0
    positiveTargetHypothesis : y > 0
  Prove
    (Real.instLT.lt 0 x ∧ Real.instLT.lt 0 y) → Exists fun n => Real.instLT.lt y ({ hMul := fun a b => Real.instMul.mul a b }.hMul (Real.instNatCast.1 n) x)

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
