import LRA.Pilot.OrderBoundsTheorems
import Mathlib.Analysis.Real.Sqrt
import Mathlib.NumberTheory.Real.Irrational
import Mathlib.Tactic

/-!
# Upper-bound counterexamples

The rational numbers with square below two form the standard test separating
boundedness from the existence of a greatest element.
-/

namespace LRA.Pilot.OrderBounds.Counterexamples

open LRA.Pilot.OrderBounds

/-- The rational numbers whose squares are strictly less than two.

Logical form:

```lean
{rational : Rat | rational ^ 2 < 2}
```
-/
def RationalSquareBelowTwo : Set Rat :=
  {rational | rational ^ 2 < 2}

/-- Two is an upper bound of the rationals whose squares are below two.

Logical form:

```lean
FromPartialOrder.UpperBound RationalSquareBelowTwo (2 : Rat)
```
-/
theorem RationalSquareBelowTwoHasUpperBoundTwo :
    FromPartialOrder.UpperBound RationalSquareBelowTwo (2 : Rat) := by
  intro rational rationalInSubset
  change rational ^ 2 < 2 at rationalInSubset
  nlinarith [sq_nonneg rational]

/-- Every rational whose square is below two has a strictly larger rational
whose square is still below two.

Logical form:

```lean
∀ rational ∈ RationalSquareBelowTwo,
  ∃ larger ∈ RationalSquareBelowTwo, rational < larger
```
-/
theorem RationalSquareBelowTwoCanAlwaysIncrease
    (rational : Rat)
    (rationalInSubset : rational ∈ RationalSquareBelowTwo) :
    ∃ larger : Rat,
      larger ∈ RationalSquareBelowTwo ∧ rational < larger := by
  change rational ^ 2 < 2 at rationalInSubset
  have rationalSquareReal : (rational : Real) ^ 2 < 2 := by
    exact_mod_cast rationalInSubset
  have rationalLtSqrtTwo : (rational : Real) < Real.sqrt 2 :=
    Real.lt_sqrt_of_sq_lt rationalSquareReal
  obtain ⟨larger, rationalLtLarger, largerLtSqrtTwo⟩ :=
    exists_rat_btwn rationalLtSqrtTwo
  refine ⟨larger, ?_, by exact_mod_cast rationalLtLarger⟩
  change larger ^ 2 < 2
  have negSqrtTwoLtRational : -Real.sqrt 2 < (rational : Real) :=
    Real.neg_sqrt_lt_of_sq_lt rationalSquareReal
  have largerSquareReal : (larger : Real) ^ 2 < 2 :=
    Real.sq_lt.mpr
      ⟨negSqrtTwoLtRational.trans rationalLtLarger, largerLtSqrtTwo⟩
  exact_mod_cast largerSquareReal

/-- The rationals whose squares are below two have no greatest element.

Logical form:

```lean
¬ ∃ maximum : Rat,
  FromPartialOrder.GreatestElement RationalSquareBelowTwo maximum
```
-/
theorem RationalSquareBelowTwoHasNoGreatestElement :
    ¬ ∃ maximum : Rat,
      FromPartialOrder.GreatestElement RationalSquareBelowTwo maximum := by
  rintro ⟨maximum, maximumInSubset, maximumIsUpperBound⟩
  obtain ⟨larger, largerInSubset, maximumLtLarger⟩ :=
    RationalSquareBelowTwoCanAlwaysIncrease maximum maximumInSubset
  have largerLeMaximum := maximumIsUpperBound larger largerInSubset
  exact (not_lt_of_ge largerLeMaximum) maximumLtLarger

/-- Every rational strictly above `√2` is an upper bound of the rationals
whose squares are below two.

Logical form:

```lean
Real.sqrt 2 < (candidate : Real) →
  FromPartialOrder.UpperBound RationalSquareBelowTwo candidate
```
-/
theorem RationalAboveSqrtTwoIsUpperBound
    (candidate : Rat)
    (sqrtTwoLtCandidate : Real.sqrt 2 < (candidate : Real)) :
    FromPartialOrder.UpperBound RationalSquareBelowTwo candidate := by
  intro rational rationalInSubset
  change rational ^ 2 < 2 at rationalInSubset
  have rationalSquareReal : (rational : Real) ^ 2 < 2 := by
    exact_mod_cast rationalInSubset
  have rationalLtCandidateReal : (rational : Real) < (candidate : Real) :=
    (Real.lt_sqrt_of_sq_lt rationalSquareReal).trans sqrtTwoLtCandidate
  exact_mod_cast rationalLtCandidateReal.le

/-- The rationals whose squares are below two have no rational least upper
bound: any proposed rational supremum would have to equal the irrational
number `√2`.

Logical form:

```lean
¬ ∃ supremum : Rat,
  FromPartialOrder.LeastUpperBound RationalSquareBelowTwo supremum
```
-/
theorem RationalSquareBelowTwoHasNoLeastUpperBound :
    ¬ ∃ supremum : Rat,
      FromPartialOrder.LeastUpperBound RationalSquareBelowTwo supremum := by
  rintro ⟨supremum, supremumIsUpperBound, supremumIsLeast⟩
  have zeroInSubset : (0 : Rat) ∈ RationalSquareBelowTwo := by
    change (0 : Rat) ^ 2 < 2
    norm_num
  have zeroLeSupremum : (0 : Rat) ≤ supremum :=
    supremumIsUpperBound 0 zeroInSubset
  have sqrtTwoLeSupremum : Real.sqrt 2 ≤ (supremum : Real) := by
    by_contra sqrtTwoNotLeSupremum
    have supremumLtSqrtTwo : (supremum : Real) < Real.sqrt 2 :=
      lt_of_not_ge sqrtTwoNotLeSupremum
    obtain ⟨larger, supremumLtLarger, largerLtSqrtTwo⟩ :=
      exists_rat_btwn supremumLtSqrtTwo
    have zeroLeLargerReal : (0 : Real) ≤ (larger : Real) := by
      have zeroLeSupremumReal : (0 : Real) ≤ (supremum : Real) := by
        exact_mod_cast zeroLeSupremum
      exact zeroLeSupremumReal.trans supremumLtLarger.le
    have largerSquareReal : (larger : Real) ^ 2 < 2 :=
      (Real.lt_sqrt zeroLeLargerReal).mp largerLtSqrtTwo
    have largerInSubset : larger ∈ RationalSquareBelowTwo := by
      change larger ^ 2 < 2
      exact_mod_cast largerSquareReal
    have largerLeSupremum : larger ≤ supremum :=
      supremumIsUpperBound larger largerInSubset
    have largerLeSupremumReal : (larger : Real) ≤ (supremum : Real) := by
      exact_mod_cast largerLeSupremum
    exact (not_lt_of_ge largerLeSupremumReal) supremumLtLarger
  have supremumLeSqrtTwo : (supremum : Real) ≤ Real.sqrt 2 := by
    by_contra supremumNotLeSqrtTwo
    have sqrtTwoLtSupremum : Real.sqrt 2 < (supremum : Real) :=
      lt_of_not_ge supremumNotLeSqrtTwo
    obtain ⟨smallerUpperBound, sqrtTwoLtSmaller, smallerLtSupremum⟩ :=
      exists_rat_btwn sqrtTwoLtSupremum
    have smallerIsUpperBound :=
      RationalAboveSqrtTwoIsUpperBound smallerUpperBound sqrtTwoLtSmaller
    have supremumLeSmaller : supremum ≤ smallerUpperBound :=
      supremumIsLeast smallerUpperBound smallerIsUpperBound
    have supremumLeSmallerReal :
        (supremum : Real) ≤ (smallerUpperBound : Real) := by
      exact_mod_cast supremumLeSmaller
    exact (not_lt_of_ge supremumLeSmallerReal) smallerLtSupremum
  have supremumEqualsSqrtTwo : (supremum : Real) = Real.sqrt 2 :=
    le_antisymm supremumLeSqrtTwo sqrtTwoLeSupremum
  exact irrational_sqrt_two.ne_rat supremum supremumEqualsSqrtTwo.symm

/-- Being bounded above does not imply having a greatest element, witnessed
inside the rational numbers by the cut at `√2`.

Logical form:

```lean
FromPartialOrder.BoundedAbove RationalSquareBelowTwo ∧
  ¬ ∃ maximum : Rat,
    FromPartialOrder.GreatestElement RationalSquareBelowTwo maximum
```
-/
theorem BoundedAboveDoesNotImplyGreatestElement :
    FromPartialOrder.BoundedAbove RationalSquareBelowTwo ∧
      ¬ ∃ maximum : Rat,
        FromPartialOrder.GreatestElement RationalSquareBelowTwo maximum := by
  exact ⟨⟨2, RationalSquareBelowTwoHasUpperBoundTwo⟩,
    RationalSquareBelowTwoHasNoGreatestElement⟩

/-- Being bounded above does not imply possessing a least upper bound inside
an arbitrary poset, witnessed by the rational cut at `√2`.

Logical form:

```lean
FromPartialOrder.BoundedAbove RationalSquareBelowTwo ∧
  ¬ ∃ supremum : Rat,
    FromPartialOrder.LeastUpperBound RationalSquareBelowTwo supremum
```
-/
theorem BoundedAboveDoesNotImplyLeastUpperBound :
    FromPartialOrder.BoundedAbove RationalSquareBelowTwo ∧
      ¬ ∃ supremum : Rat,
        FromPartialOrder.LeastUpperBound RationalSquareBelowTwo supremum := by
  exact ⟨⟨2, RationalSquareBelowTwoHasUpperBoundTwo⟩,
    RationalSquareBelowTwoHasNoLeastUpperBound⟩

end LRA.Pilot.OrderBounds.Counterexamples
