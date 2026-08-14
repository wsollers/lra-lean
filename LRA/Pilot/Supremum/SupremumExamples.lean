import LRA.Pilot.Supremum.SupremumTheorems
import Mathlib.Data.Real.Basic
import Mathlib.Order.Interval.Set.Basic
import Mathlib.Tactic

/-!
# Supremum examples

Named, checked examples over the real numbers separating the concepts that the
supremum vocabulary must keep apart:

* an attained supremum (`Set.Iic`), where the supremum is a maximum;
* a non-attained supremum (`Set.Iio`), where the supremum exists, lies outside
  the set, and the set has no greatest element;
* one named witness for each supremum failure mode, exercising the certified
  decomposition from `LRA.Pilot.Supremum.SupremumNegation` in the forward
  direction.

Every example is a named theorem so that extraction can give it a stable
identity and link it to the concept it exemplifies.
-/

namespace LRA.Pilot.OrderBounds.Examples

open LRA.Pilot.OrderBounds

/-- The empty set has `0` as a least upper bound in the natural-number poset.
This is the positive boundary witness showing that subset nonemptiness is not
part of the generic `LeastUpperBound` predicate: the empty set has a supremum
whenever the ambient poset has a least element.

Logical form:

```lean
LeastUpperBound
  (PosetFromPartialOrder Nat) (∅ : Set Nat) 0
```
-/
theorem EmptySetHasLeastUpperBoundInNat :
    LeastUpperBound
      (PosetFromPartialOrder Nat) (∅ : Set Nat) 0 :=
  (EmptySetLeastUpperBoundIffBottom
    (PosetFromPartialOrder Nat) 0).mpr Nat.zero_le

/-- The closed ray `(-∞, bound]` has `bound` as its least upper bound: every
member is below `bound` by membership, and every upper bound dominates the
member `bound` itself.

Logical form:

```lean
LeastUpperBound (PosetFromPartialOrder Real) (Set.Iic bound) bound
```
-/
theorem IicLeastUpperBound (bound : Real) :
    LeastUpperBound (PosetFromPartialOrder Real) (Set.Iic bound) bound := by
  constructor
  · intro element elementInSet
    exact Set.mem_Iic.mp elementInSet
  · intro otherCandidate otherIsUpperBound
    exact otherIsUpperBound bound (Set.mem_Iic.mpr (le_refl bound))

/-- The closed ray `(-∞, bound]` attains its supremum: `bound` is its greatest
element, so this supremum is a maximum.

Logical form:

```lean
GreatestElement (PosetFromPartialOrder Real) (Set.Iic bound) bound
```
-/
theorem IicGreatestElement (bound : Real) :
    GreatestElement (PosetFromPartialOrder Real) (Set.Iic bound) bound :=
  ⟨Set.mem_Iic.mpr (le_refl bound),
    fun _ elementInSet => Set.mem_Iic.mp elementInSet⟩

/-- The open ray `(-∞, bound)` has `bound` as its least upper bound: members
are below `bound` because they are strictly below it, and any upper bound
strictly below `bound` would be exceeded by a midpoint still inside the set.

Logical form:

```lean
LeastUpperBound (PosetFromPartialOrder Real) (Set.Iio bound) bound
```
-/
theorem IioLeastUpperBound (bound : Real) :
    LeastUpperBound (PosetFromPartialOrder Real) (Set.Iio bound) bound := by
  constructor
  · intro element elementInSet
    exact le_of_lt (Set.mem_Iio.mp elementInSet)
  · intro otherCandidate otherIsUpperBound
    by_contra boundNotBelow
    have otherBelowBound : otherCandidate < bound := not_le.mp boundNotBelow
    have middleInSet : (otherCandidate + bound) / 2 ∈ Set.Iio bound :=
      Set.mem_Iio.mpr (by linarith)
    have middleBelowCandidate : (otherCandidate + bound) / 2 ≤ otherCandidate :=
      otherIsUpperBound ((otherCandidate + bound) / 2) middleInSet
    linarith

/-- The supremum of the open ray `(-∞, bound)` lies outside the set: `bound`
is not a member of `Set.Iio bound`.  Together with `IioLeastUpperBound` this
separates having a supremum from attaining it.

Logical form:

```lean
bound ∉ Set.Iio bound
```
-/
theorem IioLeastUpperBoundNotMember (bound : Real) :
    bound ∉ Set.Iio bound :=
  fun boundInSet => lt_irrefl bound (Set.mem_Iio.mp boundInSet)

/-- The open ray `(-∞, bound)` has no greatest element: any member is strictly
below `bound`, and the midpoint between it and `bound` is a larger member.
Together with `IioLeastUpperBound` this shows a set can have a supremum while
having no maximum.

Logical form:

```lean
¬ ∃ maximum : Real,
  GreatestElement (PosetFromPartialOrder Real) (Set.Iio bound) maximum
```
-/
theorem IioHasNoGreatestElement (bound : Real) :
    ¬ ∃ maximum : Real,
      GreatestElement (PosetFromPartialOrder Real) (Set.Iio bound) maximum := by
  rintro ⟨maximum, maximumInSet, maximumIsUpperBound⟩
  have maximumBelowBound : maximum < bound := Set.mem_Iio.mp maximumInSet
  have middleInSet : (maximum + bound) / 2 ∈ Set.Iio bound :=
    Set.mem_Iio.mpr (by linarith)
  have middleBelowMaximum : (maximum + bound) / 2 ≤ maximum :=
    maximumIsUpperBound ((maximum + bound) / 2) middleInSet
  linarith

/-- Zero witnesses the upper-bound failure mode for `Set.Iic 1`: the member
`1` belongs to the set and is not below `0`.

Logical form:

```lean
UpperBoundFailure (PosetFromPartialOrder Real) (Set.Iic (1 : Real)) 0
```
-/
theorem ZeroWitnessesUpperBoundFailureForIicOne :
    UpperBoundFailure (PosetFromPartialOrder Real) (Set.Iic (1 : Real)) 0 := by
  refine ⟨1, Set.mem_Iic.mpr (le_refl 1), ?_⟩
  norm_num

/-- Two witnesses the sharpness failure mode for `Set.Iic 1`: the competitor
`1` is an upper bound of the set, and `2` is not below it.

Logical form:

```lean
SharpnessFailure (PosetFromPartialOrder Real) (Set.Iic (1 : Real)) 2
```
-/
theorem TwoWitnessesSharpnessFailureForIicOne :
    SharpnessFailure (PosetFromPartialOrder Real) (Set.Iic (1 : Real)) 2 := by
  refine ⟨1, ?_, ?_⟩
  · intro element elementInSet
    exact Set.mem_Iic.mp elementInSet
  · norm_num

/-- The certified failure decomposition applied forward: because `2` witnesses
a sharpness failure for `Set.Iic 1`, it is not the least upper bound.

Logical form:

```lean
¬ LeastUpperBound (PosetFromPartialOrder Real) (Set.Iic (1 : Real)) 2
```
-/
theorem TwoIsNotLeastUpperBoundOfIicOne :
    ¬ LeastUpperBound (PosetFromPartialOrder Real) (Set.Iic (1 : Real)) 2 :=
  (NotLeastUpperBoundIffFailure
    (PosetFromPartialOrder Real) (Set.Iic (1 : Real)) 2).mpr
    (Or.inr TwoWitnessesSharpnessFailureForIicOne)

end LRA.Pilot.OrderBounds.Examples
