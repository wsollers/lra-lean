import LRA.Pilot.Supremum.SupremumNegation

/-!
# Supremum theorems

The core consequences of the supremum definition over an arbitrary poset:
projections, uniqueness under antisymmetry, the exact relationship with the
greatest element, monotonicity along subset inclusion, and the empty-set
behavior.  Uniqueness is what licenses the definite article in "the supremum"
and the equational notation `s = sup A`.

The empty-set theorems make the vacuity behavior a named, checked fact rather
than a documentation remark: every element is an upper bound of the empty set,
so a least upper bound of the empty set is exactly a least element of the
whole carrier.
-/

namespace LRA.Pilot.OrderBounds

open LRA.VolumeI.Relations.Order

universe u v

/-- A least upper bound is an upper bound.

Logical form:

```lean
LeastUpperBound poset subset candidate →
  UpperBound poset subset candidate
```
-/
theorem LeastUpperBoundIsUpperBound
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (candidate : poset.Carrier)
    (candidateIsLeastUpperBound : LeastUpperBound poset subset candidate) :
    UpperBound poset subset candidate :=
  candidateIsLeastUpperBound.1

/-- A least upper bound is below every upper bound.

Logical form:

```lean
LeastUpperBound poset subset candidate →
  UpperBound poset subset otherCandidate →
  poset.NonStrictOrder candidate otherCandidate
```
-/
theorem LeastUpperBoundIsBelowUpperBounds
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (candidate otherCandidate : poset.Carrier)
    (candidateIsLeastUpperBound : LeastUpperBound poset subset candidate)
    (otherIsUpperBound : UpperBound poset subset otherCandidate) :
    poset.NonStrictOrder candidate otherCandidate :=
  candidateIsLeastUpperBound.2 otherCandidate otherIsUpperBound

/-- The least upper bound is unique: two least upper bounds of the same subset
are equal, by antisymmetry applied to the two leastness comparisons.

Logical form:

```lean
LeastUpperBound poset subset first →
  LeastUpperBound poset subset second →
  first = second
```
-/
theorem LeastUpperBoundUnique
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (first second : poset.Carrier)
    (firstIsLeastUpperBound : LeastUpperBound poset subset first)
    (secondIsLeastUpperBound : LeastUpperBound poset subset second) :
    first = second :=
  poset.NonStrictOrderIsPartialOrder.2.1 first second
    (firstIsLeastUpperBound.2 second secondIsLeastUpperBound.1)
    (secondIsLeastUpperBound.2 first firstIsLeastUpperBound.1)

/-- A greatest element is the least upper bound: it is an upper bound, and it
sits below every other upper bound because it belongs to the subset.

Logical form:

```lean
GreatestElement poset subset maximum →
  LeastUpperBound poset subset maximum
```
-/
theorem GreatestElementIsLeastUpperBound
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (maximum : poset.Carrier)
    (maximumIsGreatest : GreatestElement poset subset maximum) :
    LeastUpperBound poset subset maximum :=
  ⟨maximumIsGreatest.2,
    fun _otherCandidate otherIsUpperBound =>
      otherIsUpperBound maximum maximumIsGreatest.1⟩

/-- A least upper bound that belongs to the subset is its greatest element.
This is the exact converse boundary: the supremum is a maximum precisely when
it is attained.

Logical form:

```lean
LeastUpperBound poset subset candidate →
  candidate ∈ subset →
  GreatestElement poset subset candidate
```
-/
theorem LeastUpperBoundMemberIsGreatestElement
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (subset : SetObject)
    (candidate : poset.Carrier)
    (candidateIsLeastUpperBound : LeastUpperBound poset subset candidate)
    (candidateInSubset : candidate ∈ subset) :
    GreatestElement poset subset candidate :=
  ⟨candidateInSubset, candidateIsLeastUpperBound.1⟩

/-- Least upper bounds are ordered along subset inclusion: if every member of
the smaller subset belongs to the larger one, the supremum of the smaller
subset is below the supremum of the larger, because the larger supremum is in
particular an upper bound of the smaller subset.

Logical form:

```lean
(∀ element, element ∈ smaller → element ∈ larger) →
  LeastUpperBound poset smaller smallerSupremum →
  LeastUpperBound poset larger largerSupremum →
  poset.NonStrictOrder smallerSupremum largerSupremum
```
-/
theorem SubsetLeastUpperBoundsOrdered
    (poset : Poset)
    {SetObject : Type v}
    [Membership poset.Carrier SetObject]
    (smaller larger : SetObject)
    (smallerSupremum largerSupremum : poset.Carrier)
    (inclusion : ∀ element : poset.Carrier,
      element ∈ smaller → element ∈ larger)
    (smallerHasLeastUpperBound :
      LeastUpperBound poset smaller smallerSupremum)
    (largerHasLeastUpperBound :
      LeastUpperBound poset larger largerSupremum) :
    poset.NonStrictOrder smallerSupremum largerSupremum :=
  smallerHasLeastUpperBound.2 largerSupremum
    (fun element elementInSmaller =>
      largerHasLeastUpperBound.1 element (inclusion element elementInSmaller))

/-- Every element is an upper bound of the empty set, vacuously: there is no
member to dominate.

Logical form:

```lean
UpperBound poset (∅ : Set poset.Carrier) candidate
```
-/
theorem EmptySetUpperBound
    (poset : Poset)
    (candidate : poset.Carrier) :
    UpperBound poset (∅ : Set poset.Carrier) candidate :=
  fun _ elementInEmpty => elementInEmpty.elim

/-- A least upper bound of the empty set is exactly a least element of the
whole carrier: since every element is vacuously an upper bound of the empty
set, being least among upper bounds means being below everything.

Logical form:

```lean
LeastUpperBound poset (∅ : Set poset.Carrier) candidate ↔
  ∀ other : poset.Carrier, poset.NonStrictOrder candidate other
```
-/
theorem EmptySetLeastUpperBoundIffBottom
    (poset : Poset)
    (candidate : poset.Carrier) :
    LeastUpperBound poset (∅ : Set poset.Carrier) candidate ↔
      ∀ other : poset.Carrier, poset.NonStrictOrder candidate other := by
  constructor
  · intro candidateIsLeastUpperBound other
    exact candidateIsLeastUpperBound.2 other (EmptySetUpperBound poset other)
  · intro candidateIsBottom
    exact ⟨EmptySetUpperBound poset candidate,
      fun other _ => candidateIsBottom other⟩

end LRA.Pilot.OrderBounds
