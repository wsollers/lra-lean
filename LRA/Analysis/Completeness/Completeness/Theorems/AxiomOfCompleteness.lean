import Mathlib.Data.Real.Basic
import LRA.Analysis.Bounds.Extrema.SupremaInfima
import LRA.Analysis.Completeness.Completeness.Definition

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

/--
`CompletenessGivesRealSupremum` TODO

Predicate logic:

  (∀ nonemptyHypothesis ∈ A.Nonempty), (∃ u, IsUpperBound u A) → ∃ s, IsSupremum s A

Predicate logic (unfolded):

  ∀ {A : Real → Prop}, (Exists fun x => Set.instMembership.1 A x ∧ Exists fun u => ∀ (x : Real), Set.instMembership.1 A x → Real.instLE.1 x u) → Exists fun s => (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x s ∧ ∀ (u : Real), (∀ (x : Real), Set.instMembership.1 A x → Real.instPreorder.toLE.1 x u) → Real.instPreorder.toLE.1 s u)

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
