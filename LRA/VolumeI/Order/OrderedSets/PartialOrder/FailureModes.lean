import LRA.VolumeI.Order.OrderedSets.PartialOrder.Examples
import LRA.VolumeI.Order.OrderedSets.Preorder.FailureModes

namespace LRA.Order.OrderedSets.PartialOrder

universe u

/--
`FailsNonStrictPartialOrder`

Statement: An endorelation does not satisfy the non-strict partial-order laws.

Logical form:

```lean
Not (LRA.Order.PartialOrder relation)
```
-/
def FailsNonStrictPartialOrder
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Order.PartialOrder relation)

/--
`FailsTransitivity`

Statement: An endorelation is not transitive.

Logical form:

```lean
Not (LRA.Relation.Transitive relation)
```
-/
def FailsTransitivity
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Relation.Transitive relation)

/--
`ImmediateSuccessorOrEqualFailsTransitivity`

Statement: The immediate-successor-or-equality relation is reflexive and antisymmetric
but fails transitivity.

Logical form:

```lean
FailsTransitivity ImmediateSuccessorOrEqualRelation
```
-/
theorem ImmediateSuccessorOrEqualFailsTransitivity :
    LRA.Relation.Reflexive
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation /\
      LRA.Relation.Antisymmetric
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation /\
      FailsTransitivity
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation /\
      FailsNonStrictPartialOrder
        LRA.Order.OrderedSets.Preorder.ImmediateSuccessorOrEqualRelation := by
  sorry

/--
`NatStrictOrderFailsNonStrictPartialOrder`

Statement: The usual strict order on natural numbers is not a non-strict partial order,
because it is not reflexive.

Logical form:

```lean
FailsNonStrictPartialOrder (fun left right : Nat => left < right)
```
-/
theorem NatStrictOrderFailsNonStrictPartialOrder :
    Not (LRA.Relation.Reflexive
        (fun left right : Nat => left < right)) /\
      LRA.Relation.Antisymmetric
        (fun left right : Nat => left < right) /\
      LRA.Relation.Transitive
        (fun left right : Nat => left < right) /\
      FailsNonStrictPartialOrder (fun left right : Nat => left < right) := by
  sorry

/--
`BooleanUniversalRelationFailsNonStrictPartialOrder`

Statement: The universal relation on booleans is not a non-strict partial order, because
it is not antisymmetric.

Logical form:

```lean
FailsNonStrictPartialOrder (fun _ _ : Bool => True)
```
-/
theorem BooleanUniversalRelationFailsNonStrictPartialOrder :
    LRA.Relation.Reflexive (fun _ _ : Bool => True) /\
      Not (LRA.Relation.Antisymmetric
        (fun _ _ : Bool => True)) /\
      LRA.Relation.Transitive (fun _ _ : Bool => True) /\
      FailsNonStrictPartialOrder (fun _ _ : Bool => True) := by
  sorry

/--
`IntegerDivisibilityIsPreorderButNotPartialOrder`

Statement: Integer divisibility is a preorder but not a partial order: `3` and
`-3` divide one another without being equal.

Logical form: `LRA.Order.Preorder (fun left right : Int => left ∣ right) ∧ FailsNonStrictPartialOrder (fun left right : Int => left ∣ right)`.
-/
theorem IntegerDivisibilityIsPreorderButNotPartialOrder :
    LRA.Order.Preorder (fun left right : Int => left ∣ right) /\
      FailsNonStrictPartialOrder
        (fun left right : Int => left ∣ right) := by
  sorry

end LRA.Order.OrderedSets.PartialOrder
