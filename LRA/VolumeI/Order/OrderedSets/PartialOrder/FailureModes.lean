import LRA.VolumeI.Order.OrderedSets.PartialOrder.Examples
import LRA.VolumeI.Order.OrderedSets.Preorder.FailureModes

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
    (relation : LRA.VolumeI.Order.OrderedSets.OrderRelation.Relation Carrier) :
    Prop :=
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
    (relation : LRA.VolumeI.Order.OrderedSets.OrderRelation.Relation Carrier) :
    Prop :=
  Not (LRA.VolumeI.Relations.Transitive relation)

/--
The immediate-successor-or-equality relation is reflexive and antisymmetric
but fails transitivity.

Logical form:

```lean
FailsTransitivity ImmediateSuccessorOrEqualRelation
```
-/
theorem ImmediateSuccessorOrEqualFailsTransitivity :
    LRA.VolumeI.Relations.Reflexive
        LRA.VolumeI.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation /\
      LRA.VolumeI.Relations.Antisymmetric
        LRA.VolumeI.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation /\
      FailsTransitivity
        LRA.VolumeI.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation /\
      FailsNonStrictPartialOrder
        LRA.VolumeI.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation := by
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
    Not (LRA.VolumeI.Relations.Reflexive
        (fun left right : Nat => left < right)) /\
      LRA.VolumeI.Relations.Antisymmetric
        (fun left right : Nat => left < right) /\
      LRA.VolumeI.Relations.Transitive
        (fun left right : Nat => left < right) /\
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
    LRA.VolumeI.Relations.Reflexive (fun _ _ : Bool => True) /\
      Not (LRA.VolumeI.Relations.Antisymmetric
        (fun _ _ : Bool => True)) /\
      LRA.VolumeI.Relations.Transitive (fun _ _ : Bool => True) /\
      FailsNonStrictPartialOrder (fun _ _ : Bool => True) := by
  sorry

end LRA.VolumeI.Order.OrderedSets.PartialOrder
