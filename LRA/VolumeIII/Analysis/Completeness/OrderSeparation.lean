import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.MaximaMinima
import LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.SupremaInfima

/-!
Order separation consequences of completeness.
-/

namespace LRA.VolumeIII.Analysis.Completeness

open LRA.VolumeIII.Analysis.Bounding.ExtremalBounds

/-- Two nonempty separated sets admit a supremum separator. -/
theorem OrderSeparationBySupremum {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    (separationHypothesis : ∀ a ∈ A, ∀ b ∈ B, a ≤ b) :
    (∃ u, IsUpperBound u A) ∧ (∃ l, IsLowerBound l B) ∧
      ∃ c : ℝ, IsSupremum c A ∧ (∀ a ∈ A, ∀ b ∈ B, a ≤ c ∧ c ≤ b) := by
  sorry

/-- If every element of `A` is below every element of `B`, then `sup A ≤ inf B`. -/
theorem SupremumLeInfimumOfOrderSeparatedSets {A B : Set ℝ}
    (leftNonemptyHypothesis : A.Nonempty)
    (rightNonemptyHypothesis : B.Nonempty)
    (separationHypothesis : ∀ a ∈ A, ∀ b ∈ B, a ≤ b)
    {s i : ℝ}
    (supremumHypothesis : IsSupremum s A)
    (infimumHypothesis : IsInfimum i B) :
    s ≤ i := by
  sorry

/-- A Dedekind cut of the real line has a boundary point on one side. -/
theorem DedekindCutProperty {L U : Set ℝ}
    (lowerSetNonemptyHypothesis : L.Nonempty)
    (upperSetNonemptyHypothesis : U.Nonempty)
    (disjointHypothesis : L ∩ U = ∅)
    (coverHypothesis : L ∪ U = Set.univ)
    (strictSeparationHypothesis : ∀ l ∈ L, ∀ u ∈ U, l < u) :
    (∃ m, IsMaximum m L) ∨ (∃ n, IsMinimum n U) := by
  sorry

/-- There are no Dedekind gaps in the real line. -/
theorem NoGapsInReals {L U : Set ℝ}
    (lowerSetNonemptyHypothesis : L.Nonempty)
    (upperSetNonemptyHypothesis : U.Nonempty)
    (disjointHypothesis : L ∩ U = ∅)
    (coverHypothesis : L ∪ U = Set.univ)
    (strictSeparationHypothesis : ∀ l ∈ L, ∀ u ∈ U, l < u) :
    ∃! c : ℝ, (L = {x : ℝ | x < c} ∧ U = {x : ℝ | c ≤ x}) ∨
      (L = {x : ℝ | x ≤ c} ∧ U = {x : ℝ | c < x}) := by
  sorry

end LRA.VolumeIII.Analysis.Completeness
