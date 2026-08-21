import Mathlib.Data.Real.Basic
import LRA.Analysis.Bounds.Extrema.SupremaInfima

/-!
The least-upper-bound property and completeness of the real line.
-/

namespace LRA.Analysis.Completeness

open LRA.Analysis.Bounds.Extrema
open LRA.Analysis.Bounds

/-- A preorder has the least-upper-bound property when every nonempty bounded-above set has a supremum.

Logical form:

```lean
def HasLeastUpperBoundProperty (S : Type*) [Preorder S] : Prop :=
  ∀ A : Set S, A.Nonempty → (∃ u, IsUpperBound u A) → ∃ s, IsSupremum s A
```
-/
def HasLeastUpperBoundProperty (S : Type*) [Preorder S] : Prop :=
  ∀ A : Set S, A.Nonempty → (∃ u, IsUpperBound u A) → ∃ s, IsSupremum s A

/--
The axiom of completeness for the real line.

Volume III treats this as an analysis-facing axiom. Volume II contains
construction-specific real-number models where analogous completeness
properties are proved for their constructed carriers.


Logical form:

```lean
axiom AxiomOfCompleteness : HasLeastUpperBoundProperty ℝ
```
-/
axiom AxiomOfCompleteness : HasLeastUpperBoundProperty ℝ

/-- Let `A : Set ℝ`. If `nonemptyHypothesis : A.Nonempty` and `boundedAboveHypothesis : ∃ u,
IsUpperBound u A`. Then `∃ s, IsSupremum s A`.

Logical form:

```lean
theorem CompletenessGivesRealSupremum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedAboveHypothesis : ∃ u, IsUpperBound u A) :
    ∃ s, IsSupremum s A
```
-/
theorem CompletenessGivesRealSupremum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedAboveHypothesis : ∃ u, IsUpperBound u A) :
    ∃ s, IsSupremum s A := by
  sorry

end LRA.Analysis.Completeness
