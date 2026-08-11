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

/-- Nested closed bounded intervals have nonempty total intersection.

Logical form:

```lean
def NestedIntervalProperty [Preorder F] : Prop :=
  ∀ a b : ℕ → F, Monotone a → Antitone b → (∀ n, a n ≤ b n) →
    ∃ x, ∀ n, a n ≤ x ∧ x ≤ b n
```
-/
def NestedIntervalProperty [Preorder F] : Prop :=
  ∀ a b : ℕ → F, Monotone a → Antitone b → (∀ n, a n ≤ b n) →
    ∃ x, ∀ n, a n ≤ x ∧ x ≤ b n

variable (a b : ℕ → ℝ)

/-- A family of real closed intervals is nested when endpoints are ordered and each successor interval is contained in the previous one.

Logical form:

```lean
def IsNestedClosedIntervalFamily : Prop :=
  (∀ n, a n ≤ b n) ∧
    (∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
```
-/
def IsNestedClosedIntervalFamily : Prop :=
  (∀ n, a n ≤ b n) ∧
    (∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))

/-- Let `m n : ℕ`. If `orderedEndpointHypothesis : ∀ n, a n ≤ b n`, `nestedHypothesis : ∀ n, Set.Icc
(a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)`, and `indexOrderHypothesis : n ≤ m`. Then `a n ≤
a m ∧ a m ≤ b m ∧ b m ≤ b n`.

Logical form:

```lean
theorem NestedClosedIntervalsHaveOrderedEndpoints
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {m n : ℕ}
    (indexOrderHypothesis : n ≤ m) :
    a n ≤ a m ∧ a m ≤ b m ∧ b m ≤ b n
```
-/
theorem NestedClosedIntervalsHaveOrderedEndpoints
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {m n : ℕ}
    (indexOrderHypothesis : n ≤ m) :
    a n ≤ a m ∧ a m ≤ b m ∧ b m ≤ b n := by
  sorry

/-- If `orderedEndpointHypothesis : ∀ n, a n ≤ b n` and `nestedHypothesis : ∀ n, Set.Icc (a (n + 1))
(b (n + 1)) ⊆ Set.Icc (a n) (b n)`. Then `∀ n, a n ≤ a (n + 1)`.

Logical form:

```lean
theorem LeftEndpointsOfNestedIntervalsIncrease
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ n, a n ≤ a (n + 1)
```
-/
theorem LeftEndpointsOfNestedIntervalsIncrease
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ n, a n ≤ a (n + 1) := by
  sorry

/-- If `orderedEndpointHypothesis : ∀ n, a n ≤ b n` and `nestedHypothesis : ∀ n, Set.Icc (a (n + 1))
(b (n + 1)) ⊆ Set.Icc (a n) (b n)`. Then `∀ n, b (n + 1) ≤ b n`.

Logical form:

```lean
theorem RightEndpointsOfNestedIntervalsDecrease
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ n, b (n + 1) ≤ b n
```
-/
theorem RightEndpointsOfNestedIntervalsDecrease
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ n, b (n + 1) ≤ b n := by
  sorry

/-- If `orderedEndpointHypothesis : ∀ n, a n ≤ b n` and `nestedHypothesis : ∀ n, Set.Icc (a (n + 1))
(b (n + 1)) ⊆ Set.Icc (a n) (b n)`. Then `∀ m n, a n ≤ b m`.

Logical form:

```lean
theorem LeftEndpointsAreBoundedAboveByRightEndpoints
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ m n, a n ≤ b m
```
-/
theorem LeftEndpointsAreBoundedAboveByRightEndpoints
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)) :
    ∀ m n, a n ≤ b m := by
  sorry

/-- Let `leftEndpointLimit rightEndpointLimit : ℝ`. If `orderedEndpointHypothesis : ∀ n, a n ≤ b n`,
`nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)`,
`leftSupremumHypothesis : IsSupremum leftEndpointLimit (Set.range a)`, and
`rightInfimumHypothesis : IsInfimum rightEndpointLimit (Set.range b)`. Then `leftEndpointLimit ≤
rightEndpointLimit`.

Logical form:

```lean
theorem EndpointSupremumLeEndpointInfimum
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {leftEndpointLimit rightEndpointLimit : ℝ}
    (leftSupremumHypothesis : IsSupremum leftEndpointLimit (Set.range a))
    (rightInfimumHypothesis : IsInfimum rightEndpointLimit (Set.range b)) :
    leftEndpointLimit ≤ rightEndpointLimit
```
-/
theorem EndpointSupremumLeEndpointInfimum
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {leftEndpointLimit rightEndpointLimit : ℝ}
    (leftSupremumHypothesis : IsSupremum leftEndpointLimit (Set.range a))
    (rightInfimumHypothesis : IsInfimum rightEndpointLimit (Set.range b)) :
    leftEndpointLimit ≤ rightEndpointLimit := by
  sorry

/-- Let `leftEndpointLimit rightEndpointLimit : ℝ`. If `orderedEndpointHypothesis : ∀ n, a n ≤ b n`,
`nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)`,
`leftSupremumHypothesis : IsSupremum leftEndpointLimit (Set.range a)`, and
`rightInfimumHypothesis : IsInfimum rightEndpointLimit (Set.range b)`. Then `leftEndpointLimit ≤
rightEndpointLimit ∧ (⋂ n, Set.Icc (a n) (b n)).Nonempty ∧ ∃ x : ℝ, ∀ n, a n ≤ x ∧ x ≤ b n`.

Logical form:

```lean
theorem NestedIntervalTheorem
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {leftEndpointLimit rightEndpointLimit : ℝ}
    (leftSupremumHypothesis : IsSupremum leftEndpointLimit (Set.range a))
    (rightInfimumHypothesis : IsInfimum rightEndpointLimit (Set.range b)) :
    leftEndpointLimit ≤ rightEndpointLimit ∧
      (⋂ n, Set.Icc (a n) (b n)).Nonempty ∧
        ∃ x : ℝ, ∀ n, a n ≤ x ∧ x ≤ b n
```
-/
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

/-- Let `leftEndpointLimit : ℝ`. If `orderedEndpointHypothesis : ∀ n, a n ≤ b n`, `nestedHypothesis
: ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)`, and `leftSupremumHypothesis :
IsSupremum leftEndpointLimit (Set.range a)`. Then `(∀ n, a n ≤ leftEndpointLimit ∧
leftEndpointLimit ≤ b n) ∧ leftEndpointLimit ∈ ⋂ n, Set.Icc (a n) (b n)`.

Logical form:

```lean
theorem NestedIntervalIntersectionContainsEndpointSupremum
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {leftEndpointLimit : ℝ}
    (leftSupremumHypothesis : IsSupremum leftEndpointLimit (Set.range a)) :
    (∀ n, a n ≤ leftEndpointLimit ∧ leftEndpointLimit ≤ b n) ∧
      leftEndpointLimit ∈ ⋂ n, Set.Icc (a n) (b n)
```
-/
theorem NestedIntervalIntersectionContainsEndpointSupremum
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {leftEndpointLimit : ℝ}
    (leftSupremumHypothesis : IsSupremum leftEndpointLimit (Set.range a)) :
    (∀ n, a n ≤ leftEndpointLimit ∧ leftEndpointLimit ≤ b n) ∧
      leftEndpointLimit ∈ ⋂ n, Set.Icc (a n) (b n) := by
  sorry

/-- Let `rightEndpointLimit : ℝ`. If `orderedEndpointHypothesis : ∀ n, a n ≤ b n`, `nestedHypothesis
: ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)`, and `rightInfimumHypothesis :
IsInfimum rightEndpointLimit (Set.range b)`. Then `(∀ n, a n ≤ rightEndpointLimit ∧
rightEndpointLimit ≤ b n) ∧ rightEndpointLimit ∈ ⋂ n, Set.Icc (a n) (b n)`.

Logical form:

```lean
theorem NestedIntervalIntersectionContainsEndpointInfimum
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {rightEndpointLimit : ℝ}
    (rightInfimumHypothesis : IsInfimum rightEndpointLimit (Set.range b)) :
    (∀ n, a n ≤ rightEndpointLimit ∧ rightEndpointLimit ≤ b n) ∧
      rightEndpointLimit ∈ ⋂ n, Set.Icc (a n) (b n)
```
-/
theorem NestedIntervalIntersectionContainsEndpointInfimum
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {rightEndpointLimit : ℝ}
    (rightInfimumHypothesis : IsInfimum rightEndpointLimit (Set.range b)) :
    (∀ n, a n ≤ rightEndpointLimit ∧ rightEndpointLimit ≤ b n) ∧
      rightEndpointLimit ∈ ⋂ n, Set.Icc (a n) (b n) := by
  sorry

/-- If `orderedEndpointHypothesis : ∀ n, a n ≤ b n`, `nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b
(n + 1)) ⊆ Set.Icc (a n) (b n)`, and `vanishingLengthHypothesis : ∀ ε > 0, ∃ N, ∀ n ≥ N, 0 ≤ b n
- a n ∧ b n - a n < ε`. Then `∃! x : ℝ, (∀ n, a n ≤ x ∧ x ≤ b n) ∧ IsSupremum x (Set.range a) ∧
IsInfimum x (Set.range b)`.

Logical form:

```lean
theorem NestedIntervalsWithVanishingLengthHaveUniquePoint
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    (vanishingLengthHypothesis :
      ∀ ε > 0, ∃ N, ∀ n ≥ N, 0 ≤ b n - a n ∧ b n - a n < ε) :
    ∃! x : ℝ, (∀ n, a n ≤ x ∧ x ≤ b n) ∧
      IsSupremum x (Set.range a) ∧ IsInfimum x (Set.range b)
```
-/
theorem NestedIntervalsWithVanishingLengthHaveUniquePoint
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    (vanishingLengthHypothesis :
      ∀ ε > 0, ∃ N, ∀ n ≥ N, 0 ≤ b n - a n ∧ b n - a n < ε) :
    ∃! x : ℝ, (∀ n, a n ≤ x ∧ x ≤ b n) ∧
      IsSupremum x (Set.range a) ∧ IsInfimum x (Set.range b) := by
  sorry

/-- If `orderedEndpointHypothesis : ∀ n, a n ≤ b n`, `nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b
(n + 1)) ⊆ Set.Icc (a n) (b n)`, and `vanishingLengthHypothesis : ∀ ε > 0, ∃ N, ∀ n ≥ N, b n - a
n < ε`. Then `∃ x : ℝ, Filter.Tendsto a Filter.atTop (nhds x) ∧ Filter.Tendsto b Filter.atTop
(nhds x)`.

Logical form:

```lean
theorem NestedIntervalsWithVanishingLengthHaveEqualEndpointLimits
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    (vanishingLengthHypothesis : ∀ ε > 0, ∃ N, ∀ n ≥ N, b n - a n < ε) :
    ∃ x : ℝ, Filter.Tendsto a Filter.atTop (nhds x) ∧
      Filter.Tendsto b Filter.atTop (nhds x)
```
-/
theorem NestedIntervalsWithVanishingLengthHaveEqualEndpointLimits
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    (vanishingLengthHypothesis : ∀ ε > 0, ∃ N, ∀ n ≥ N, b n - a n < ε) :
    ∃ x : ℝ, Filter.Tendsto a Filter.atTop (nhds x) ∧
      Filter.Tendsto b Filter.atTop (nhds x) := by
  sorry

/-- Let `x : ℝ`. If `orderedEndpointHypothesis : ∀ n, a n ≤ b n`, `nestedHypothesis : ∀ n, Set.Icc
(a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n)`, and `singletonIntersectionHypothesis : (⋂ n,
Set.Icc (a n) (b n)) = {x}`. Then `Filter.Tendsto a Filter.atTop (nhds x) ∧ Filter.Tendsto b
Filter.atTop (nhds x)`.

Logical form:

```lean
theorem UniquePointInNestedIntervalsIsEndpointLimit
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {x : ℝ}
    (singletonIntersectionHypothesis : (⋂ n, Set.Icc (a n) (b n)) = {x}) :
    Filter.Tendsto a Filter.atTop (nhds x) ∧
      Filter.Tendsto b Filter.atTop (nhds x)
```
-/
theorem UniquePointInNestedIntervalsIsEndpointLimit
    (orderedEndpointHypothesis : ∀ n, a n ≤ b n)
    (nestedHypothesis : ∀ n, Set.Icc (a (n + 1)) (b (n + 1)) ⊆ Set.Icc (a n) (b n))
    {x : ℝ}
    (singletonIntersectionHypothesis : (⋂ n, Set.Icc (a n) (b n)) = {x}) :
    Filter.Tendsto a Filter.atTop (nhds x) ∧
      Filter.Tendsto b Filter.atTop (nhds x) := by
  sorry

/-- The theorem asserts `∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧ (∀ n, Set.Ioo (a (n + 1)) (b (n + 1)) ⊆
Set.Ioo (a n) (b n)) ∧ (⋂ n, Set.Ioo (a n) (b n)) = ∅`.

Logical form:

```lean
theorem OpenNestedIntervalsNeedNotHaveNonemptyIntersection :
    ∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧
      (∀ n, Set.Ioo (a (n + 1)) (b (n + 1)) ⊆ Set.Ioo (a n) (b n)) ∧
        (⋂ n, Set.Ioo (a n) (b n)) = ∅
```
-/
theorem OpenNestedIntervalsNeedNotHaveNonemptyIntersection :
    ∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧
      (∀ n, Set.Ioo (a (n + 1)) (b (n + 1)) ⊆ Set.Ioo (a n) (b n)) ∧
        (⋂ n, Set.Ioo (a n) (b n)) = ∅ := by
  sorry

/-- The theorem asserts `∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧ (∀ n, Set.Ioc (a (n + 1)) (b (n + 1)) ⊆
Set.Ioc (a n) (b n)) ∧ (⋂ n, Set.Ioc (a n) (b n)) = ∅`.

Logical form:

```lean
theorem ClosednessIsNecessaryInNestedIntervalTheorem :
    ∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧
      (∀ n, Set.Ioc (a (n + 1)) (b (n + 1)) ⊆ Set.Ioc (a n) (b n)) ∧
        (⋂ n, Set.Ioc (a n) (b n)) = ∅
```
-/
theorem ClosednessIsNecessaryInNestedIntervalTheorem :
    ∃ a b : ℕ → ℝ, (∀ n, a n < b n) ∧
      (∀ n, Set.Ioc (a (n + 1)) (b (n + 1)) ⊆ Set.Ioc (a n) (b n)) ∧
        (⋂ n, Set.Ioc (a n) (b n)) = ∅ := by
  sorry

/-- The theorem asserts `∃ a : ℕ → ℝ, (∀ n, Set.Ici (a (n + 1)) ⊆ Set.Ici (a n)) ∧ (⋂ n, Set.Ici (a
n)) = ∅`.

Logical form:

```lean
theorem BoundednessIsNecessaryInNestedIntervalTheorem :
    ∃ a : ℕ → ℝ, (∀ n, Set.Ici (a (n + 1)) ⊆ Set.Ici (a n)) ∧
      (⋂ n, Set.Ici (a n)) = ∅
```
-/
theorem BoundednessIsNecessaryInNestedIntervalTheorem :
    ∃ a : ℕ → ℝ, (∀ n, Set.Ici (a (n + 1)) ⊆ Set.Ici (a n)) ∧
      (⋂ n, Set.Ici (a n)) = ∅ := by
  sorry

end LRA.VolumeIII.Analysis.Completeness
