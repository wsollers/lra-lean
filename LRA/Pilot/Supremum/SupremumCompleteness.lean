import LRA.Pilot.Supremum.SupremumTheorems
import LRA.VolumeI.AlgebraicStructures.Completeness
import LRA.VolumeI.AlgebraicStructures.MathlibBridge
import Mathlib.Data.Real.Basic

/-!
# Supremum existence under completeness

The predicate `LeastUpperBound poset subset candidate` is defined over an
arbitrary poset and carries no existence assumptions.  This module keeps the
three distinct nonemptiness/completeness facts in separate declarations and
binders:

* `Nonempty R` concerns the ambient carrier;
* `subset.Nonempty`, or `∃ element, element ∈ subset`, concerns one subset;
* `OrderCompletenessLaws R SetObject` is the ambient capability saying every
  nonempty bounded-above represented subset has a least upper bound.

An ordered-field carrier is already inhabited by `0`; no additional
`[Nonempty R]` premise belongs on a complete-ordered-field supremum theorem.
-/

namespace LRA.Pilot.OrderBounds

open LRA.VolumeI.AlgebraicStructures

universe u v

/-- Backend-relative order completeness yields a least upper bound for one
nonempty bounded-above subset.  The subset assumptions are explicit binders;
carrier nonemptiness is neither assumed nor confused with them.

Logical form:

```lean
[OrderCompletenessLaws R SetObject] →
  (∃ element, element ∈ subset) →
  FromPartialOrder.BoundedAbove subset →
  ∃ supremum, FromPartialOrder.LeastUpperBound subset supremum
```
-/
theorem ExistsLeastUpperBoundOfOrderComplete
    {R : Type u}
    [partialOrder : _root_.PartialOrder R]
    {SetObject : Type v}
    [Membership R SetObject]
    [OrderCompletenessLaws R SetObject]
    (subset : SetObject)
    (subsetIsNonempty : ∃ element : R, element ∈ subset)
    (subsetIsBoundedAbove : FromPartialOrder.BoundedAbove subset) :
    ∃ supremum : R,
      FromPartialOrder.LeastUpperBound subset supremum :=
  OrderCompletenessLaws.Completeness subset
    subsetIsNonempty subsetIsBoundedAbove

/-- In a complete ordered field, every nonempty bounded-above classical set
has a least upper bound.  Ordered-field structure and order completeness are
separate capabilities, and the theorem deliberately has no `[Nonempty R]`
binder: `0 : R` already inhabits the carrier.

Logical form:

```lean
[OrderedFieldLaws R] →
  [OrderCompletenessLaws R (Set R)] →
  subset.Nonempty →
  FromPartialOrder.BoundedAbove subset →
  ∃ supremum, FromPartialOrder.LeastUpperBound subset supremum
```
-/
theorem ExistsLeastUpperBoundOfCompleteOrderedField
    {R : Type u}
    [Add R] [Mul R] [Neg R] [Inv R]
    [OfNat R 0] [OfNat R 1]
    [partialOrder : _root_.PartialOrder R]
    [OrderedFieldLaws R]
    [OrderCompletenessLaws R (Set R)]
    (subset : Set R)
    (subsetIsNonempty : subset.Nonempty)
    (subsetIsBoundedAbove : FromPartialOrder.BoundedAbove subset) :
    ∃ supremum : R,
      FromPartialOrder.LeastUpperBound subset supremum :=
  ExistsLeastUpperBoundOfOrderComplete subset
    subsetIsNonempty subsetIsBoundedAbove

/-- The real-analysis specialization: a nonempty bounded-above set of real
numbers has a real least upper bound.  Completeness is discharged by the
checked `Real` instance; the statement retains the two subset-level
hypotheses and does not insert them into the definition of supremum.

Logical form:

```lean
subset.Nonempty →
  FromPartialOrder.BoundedAbove subset →
  ∃ supremum : Real,
    FromPartialOrder.LeastUpperBound subset supremum
```
-/
theorem NonemptyBoundedAboveRealSetHasLeastUpperBound
    (subset : Set Real)
    (subsetIsNonempty : subset.Nonempty)
    (subsetIsBoundedAbove : FromPartialOrder.BoundedAbove subset) :
    ∃ supremum : Real,
      FromPartialOrder.LeastUpperBound subset supremum :=
  ExistsLeastUpperBoundOfOrderComplete subset
    subsetIsNonempty subsetIsBoundedAbove

/-- An ordered-field carrier is inhabited independently of any subset-level
nonemptiness hypothesis.  This named witness lets extraction validate that an
extra `[Nonempty R]` premise would be redundant in the ordered-field context.

Logical form:

```lean
[OrderedFieldLaws R] → Nonempty R
```
-/
theorem OrderedFieldCarrierIsNonempty
    {R : Type u}
    [Add R] [Mul R] [Neg R] [Inv R]
    [OfNat R 0] [OfNat R 1] [LE R]
    [OrderedFieldLaws R] :
    Nonempty R :=
  ⟨0⟩

end LRA.Pilot.OrderBounds
