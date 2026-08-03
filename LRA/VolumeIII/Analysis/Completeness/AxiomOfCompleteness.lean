import Mathlib.Data.Real.Basic
import LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.SupremaInfima

/-!
The least-upper-bound property and completeness of the real line.
-/

namespace LRA.VolumeIII.Analysis.Completeness

open LRA.VolumeIII.Analysis.Bounding.ExtremalBounds

/-- A preorder has the least-upper-bound property when every nonempty bounded-above set has a supremum. -/
def HasLeastUpperBoundProperty (S : Type*) [Preorder S] : Prop :=
  ∀ A : Set S, A.Nonempty → (∃ u, IsUpperBound u A) → ∃ s, IsSupremum s A

/--
The axiom of completeness for the real line.

Volume III treats this as an analysis-facing axiom. Volume II contains
construction-specific real-number models where analogous completeness
properties are proved for their constructed carriers.
-/
axiom AxiomOfCompleteness : HasLeastUpperBoundProperty ℝ

/-- Let `A : Set ℝ`. If `nonemptyHypothesis : A.Nonempty` and `boundedAboveHypothesis : ∃ u,
IsUpperBound u A`. Then `∃ s, IsSupremum s A`. -/
theorem CompletenessGivesRealSupremum {A : Set ℝ}
    (nonemptyHypothesis : A.Nonempty)
    (boundedAboveHypothesis : ∃ u, IsUpperBound u A) :
    ∃ s, IsSupremum s A :=
  AxiomOfCompleteness A nonemptyHypothesis boundedAboveHypothesis

end LRA.VolumeIII.Analysis.Completeness
