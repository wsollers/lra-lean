import LRA.VolumeI.Order.OrderedSets.PartialOrder.Examples

namespace LRA.VolumeI.Order.OrderedSets.PartialOrder

universe u

/--
`FailsNonStrictPartialOrder relation` says that an endorelation does not
satisfy the non-strict partial-order laws.

Logical form:

```lean
Not (LRA.VolumeI.Order.PartialOrder relation)
```
-/
def FailsNonStrictPartialOrder
    {Carrier : Type u}
    (relation : Relation Carrier) : Prop :=
  Not (LRA.VolumeI.Order.PartialOrder relation)

/--
`FailsTransitivity relation` says that an endorelation is not transitive.

Logical form:

```lean
Not (LRA.VolumeI.Relations.Transitive relation)
```
-/
def FailsTransitivity
    {Carrier : Type u}
    (relation : Relation Carrier) : Prop :=
  Not (LRA.VolumeI.Relations.Transitive relation)

/--
`FailsTotality relation` says that an endorelation is not total.

Logical form:

```lean
Not (LRA.VolumeI.Relations.Total relation)
```
-/
def FailsTotality
    {Carrier : Type u}
    (relation : Relation Carrier) : Prop :=
  Not (LRA.VolumeI.Relations.Total relation)

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
