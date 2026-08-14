import LRA.VolumeI.Order.OrderedSets.PartialOrder.Examples
import LRA.VolumeI.Order.OrderedSets.PartialOrder.FailureModes

namespace LRA.VolumeI.Order.OrderedSets.PartialOrder

/--
The immediate-successor-or-equality relation on natural numbers.

Logical form:

```lean
fun left right : Nat => left = right \/ right = left + 1
```
-/
def ImmediateSuccessorOrEqualRelation : Relation Nat :=
  fun left right => left = right \/ right = left + 1

/--
The usual strict order on natural numbers is not a non-strict partial order,
because it is not reflexive.

Logical form:

```lean
FailsNonStrictPartialOrder (fun left right : Nat => left < right)
```
-/
theorem NatStrictOrderFailsNonStrictPartialOrder :
    FailsNonStrictPartialOrder (fun left right : Nat => left < right) := by
  sorry

/--
The usual non-strict order on natural numbers is not a strict partial order,
because it is not irreflexive.

Logical form:

```lean
FailsStrictPartialOrder (fun left right : Nat => left <= right)
```
-/
theorem NatNonStrictOrderFailsStrictPartialOrder :
    FailsStrictPartialOrder (fun left right : Nat => left <= right) := by
  sorry

/--
The immediate-successor-or-equality relation is not transitive.

Logical form:

```lean
FailsTransitivity ImmediateSuccessorOrEqualRelation
```
-/
theorem ImmediateSuccessorOrEqualFailsTransitivity :
    FailsTransitivity ImmediateSuccessorOrEqualRelation := by
  sorry

/--
The universal relation on booleans is not a non-strict partial order, because
it is not antisymmetric.

Logical form:

```lean
FailsNonStrictPartialOrder (fun _ _ : Bool => True)
```
-/
theorem BooleanUniversalRelationFailsNonStrictPartialOrder :
    FailsNonStrictPartialOrder (fun _ _ : Bool => True) := by
  sorry

/--
Equality on booleans is a partial order but not a total order.

Logical form:

```lean
FailsTotality BooleanEqualityNonStrictPartialOrder.relation
```
-/
theorem BooleanEqualityPartialOrderFailsTotality :
    FailsTotality BooleanEqualityNonStrictPartialOrder.relation := by
  sorry

end LRA.VolumeI.Order.OrderedSets.PartialOrder
