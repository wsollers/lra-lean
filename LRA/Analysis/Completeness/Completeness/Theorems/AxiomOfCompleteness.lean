import Mathlib.Data.Real.Basic
import LRA.Analysis.Bounds.Extrema.SupremaInfima
import LRA.Analysis.Completeness.Completeness.Definition

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

/--
`CompletenessGivesRealSupremum` TODO

Predicate logic:

  ∀ {A : Set Real}, (A.Nonempty ∧ Exists fun u => LRA.Analysis.Bounds.IsUpperBound u A) → Exists fun s => LRA.Analysis.Bounds.IsSupremum s A

Predicate logic (unfolded):

  Ambient
    (ℝ)
  Objects
    A : Set ℝ
    nonemptyHypothesis : A.Nonempty
  Prove
    (Exists fun x => x ∈ A ∧ (Exists fun u => ∀ (x : Real), x ∈ A → Real.instLE.le x u)) → Exists fun s => ((∀ (x : Real), x ∈ A → Real.instPreorder.1.le x s) ∧ (∀ (u : Real), (∀ (x : Real), x ∈ A → Real.instPreorder.1.le x u) → Real.instPreorder.1.le s u))

Logical form (Lean):

```lean
theorem CompletenessGivesRealSupremum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedAboveHypothesis : ∃ u, IsUpperBound u A) :
    ∃ s, IsSupremum s A
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
theorem CompletenessGivesRealSupremum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedAboveHypothesis : ∃ u, IsUpperBound u A) :
    ∃ s, IsSupremum s A := by
  sorry
end LRA.Analysis.Completeness
