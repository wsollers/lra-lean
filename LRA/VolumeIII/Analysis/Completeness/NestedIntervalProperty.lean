import Mathlib.Data.Real.Basic
import Mathlib.Data.Set.Basic
import Mathlib.Topology.Instances.Real.Lemmas
import LRA.VolumeIII.Analysis.Bounding.ExtremalBounds.SupremaInfima

/-!
Nested closed interval properties over the real line.
-/

namespace LRA.VolumeIII.Analysis.Completeness

open LRA.VolumeIII.Analysis.Bounding.ExtremalBounds

variable (F : Type*)

/-- Nested closed bounded intervals have nonempty total intersection. -/
def NestedIntervalProperty [Preorder F] : Prop :=
  ∀ a b : ℕ → F, Monotone a → Antitone b → (∀ n, a n ≤ b n) →
    ∃ x, ∀ n, a n ≤ x ∧ x ≤ b n

variable (a b : ℕ → ℝ)

/-- A family of real closed intervals is nested when endpoints are ordered and each successor interval is contained in the previous one. -/
def IsNestedClosedIntervalFamily : Prop :=
  (∀ n, a n ≤ b n) ∧
    (∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))

/-- Nested closed intervals have ordered endpoints across every later index. -/
theorem NestedClosedIntervalsHaveOrderedEndpoints
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {m n : ℕ}
    (indexOrderHypothesis : n ≤ m) :
    a n ≤ a m ∧ a m ≤ b m ∧ b m ≤ b n := by
  sorry

/-- The left endpoints of nested closed intervals are increasing. -/
theorem LeftEndpointsOfNestedIntervalsIncrease
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ n, a n ≤ a (n + 1) := by
  sorry

/-- The right endpoints of nested closed intervals are decreasing. -/
theorem RightEndpointsOfNestedIntervalsDecrease
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ n, b (n + 1) ≤ b n := by
  sorry

/-- Every left endpoint lies below every right endpoint in a nested closed interval family. -/
theorem LeftEndpointsAreBoundedAboveByRightEndpoints
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ m n, a n ≤ b m := by
  sorry

/-- The supremum of the left endpoints is below the infimum of the right endpoints. -/
theorem EndpointSupremumLeEndpointInfimum
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {leftEndpointLimit rightEndpointLimit : ℝ}
    (leftSupremumHypothesis : IsSupremum leftEndpointLimit (Set.range a))
    (rightInfimumHypothesis : IsInfimum rightEndpointLimit (Set.range b)) :
    leftEndpointLimit ≤ rightEndpointLimit := by
  sorry

/-- Nested closed intervals have nonempty intersection. -/
theorem NestedIntervalTheorem
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {leftEndpointLimit rightEndpointLimit : ℝ}
    (leftSupremumHypothesis : IsSupremum leftEndpointLimit (Set.range a))
    (rightInfimumHypothesis : IsInfimum rightEndpointLimit (Set.range b)) :
    leftEndpointLimit ≤ rightEndpointLimit ∧
      (⋂ n, Set.Icc (a n) (b n)).Nonempty ∧
        ∃ x : ℝ, ∀ n, a n ≤ x ∧ x ≤ b n := by
  sorry

/-- The endpoint supremum belongs to every interval in the nested family. -/
theorem NestedIntervalIntersectionContainsEndpointSupremum
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {leftEndpointLimit : ℝ}
    (leftSupremumHypothesis : IsSupremum leftEndpointLimit (Set.range a)) :
    (∀ n, a n ≤ leftEndpointLimit ∧ leftEndpointLimit ≤ b n) ∧
      leftEndpointLimit ∈ ⋂ n, Set.Icc (a n) (b n) := by
  sorry

/-- The endpoint infimum belongs to every interval in the nested family. -/
theorem NestedIntervalIntersectionContainsEndpointInfimum
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {rightEndpointLimit : ℝ}
    (rightInfimumHypothesis : IsInfimum rightEndpointLimit (Set.range b)) :
    (∀ n, a n ≤ rightEndpointLimit ∧ rightEndpointLimit ≤ b n) ∧
      rightEndpointLimit ∈ ⋂ n, Set.Icc (a n) (b n) := by
  sorry

/-- Nested intervals with vanishing length have a unique intersection point. -/
theorem NestedIntervalsWithVanishingLengthHaveUniquePoint
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    (vanishingLengthHypothesis :
      ∀ ε > 0, ∃ N, ∀ n ≥ N, 0 ≤ b n - a n ∧ b n - a n < ε) :
    ∃! x : ℝ, (∀ n, a n ≤ x ∧ x ≤ b n) ∧
      IsSupremum x (Set.range a) ∧ IsInfimum x (Set.range b) := by
  sorry

/-- Nested intervals with vanishing length have equal endpoint limits. -/
theorem NestedIntervalsWithVanishingLengthHaveEqualEndpointLimits
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    (vanishingLengthHypothesis : ∀ ε > 0, ∃ N, ∀ n ≥ N, b n - a n < ε) :
    ∃ x : ℝ, Filter.Tendsto a Filter.atTop (nhds x) ∧
      Filter.Tendsto b Filter.atTop (nhds x) := by
  sorry

/-- A singleton nested-interval intersection is the common endpoint limit. -/
theorem UniquePointInNestedIntervalsIsEndpointLimit
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {x : ℝ}
    (singletonIntersectionHypothesis : (⋂ n, Set.Icc (a n) (b n)) = {x}) :
    Filter.Tendsto a Filter.atTop (nhds x) ∧
      Filter.Tendsto b Filter.atTop (nhds x) := by
  sorry

/-- Open nested intervals need not have nonempty intersection. -/
theorem OpenNestedIntervalsNeedNotHaveNonemptyIntersection :
    ∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧
      (∀ n, Set.Ioo (a (n + 1)) (b (n + 1)) ⊆ Set.Ioo (a n) (b n)) ∧
        (⋂ n, Set.Ioo (a n) (b n)) = ∅ := by
  sorry

/-- Closedness is necessary in the nested interval theorem. -/
theorem ClosednessIsNecessaryInNestedIntervalTheorem :
    ∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧
      (∀ n, Set.Ioc (a (n + 1)) (b (n + 1)) ⊆ Set.Ioc (a n) (b n)) ∧
        (⋂ n, Set.Ioc (a n) (b n)) = ∅ := by
  sorry

/-- Boundedness is necessary in the nested interval theorem. -/
theorem BoundednessIsNecessaryInNestedIntervalTheorem :
    ∃ a : ℕ → ℝ, (∀ n, Set.Ici (a (n + 1)) ⊆ Set.Ici (a n)) ∧
      (⋂ n, Set.Ici (a n)) = ∅ := by
  sorry

end LRA.VolumeIII.Analysis.Completeness
