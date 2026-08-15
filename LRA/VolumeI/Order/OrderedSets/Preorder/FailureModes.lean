import LRA.VolumeI.Order.OrderedSets.Preorder.Examples
import LRA.VolumeI.Order.OrderedSets.Preorder.Relationships
import LRA.VolumeI.Order.Relations.StrictPart.Definition

namespace LRA.Order.OrderedSets.Preorder

universe u

/--
`FailsPreorder`

Statement: An endorelation fails to satisfy the preorder laws.

Logical form:

```lean
Not (LRA.Order.Preorder relation)
```
-/
def FailsPreorder
    {Carrier : Type u}
    (relation : LRA.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.Order.Preorder relation)

/--
`StrictPartConstructionsFailToAgree`

Statement: The two standard strict-part constructions fail to agree on a preorder.

Logical form: `LRA.Order.StrictPart preorder.relation ≠ StrictPartByNotConverse preorder`.
-/
def StrictPartConstructionsFailToAgree
    {Carrier : Type u}
    (preorder : PreorderRelation Carrier) : Prop :=
  LRA.Order.StrictPart preorder.relation ≠
    StrictPartByNotConverse preorder

/--
`ImmediateSuccessorOrEqualRelation`

Statement: Natural numbers are related when they are equal or the right value
is the immediate successor of the left.

Logical form: `left = right ∨ right = left + 1`.
-/
def ImmediateSuccessorOrEqualRelation :
    LRA.Relation.Endorelation Nat :=
  fun left right => left = right \/ right = left + 1

/--
`ImmediateSuccessorOrEqualFailsPreorder`

Statement: The immediate-successor-or-equality relation is reflexive but not
transitive, so it fails to be a preorder.

Logical form: reflexivity holds, transitivity fails, and
`FailsPreorder ImmediateSuccessorOrEqualRelation` holds.
-/
theorem ImmediateSuccessorOrEqualFailsPreorder :
    LRA.Relation.Reflexive ImmediateSuccessorOrEqualRelation /\
      Not (LRA.Relation.Transitive
        ImmediateSuccessorOrEqualRelation) /\
      FailsPreorder ImmediateSuccessorOrEqualRelation := by
  sorry

/--
`NatStrictOrderFailsPreorder`

Statement: The natural strict order is transitive but non-reflexive, so it
fails to be a preorder.

Logical form: transitivity holds, reflexivity fails, and
`FailsPreorder (fun left right : Nat => left < right)` holds.
-/
theorem NatStrictOrderFailsPreorder :
    LRA.Relation.Transitive (fun left right : Nat => left < right) /\
      Not (LRA.Relation.Reflexive
        (fun left right : Nat => left < right)) /\
      FailsPreorder (fun left right : Nat => left < right) := by
  sorry

/--
`StrictPartConstructionsDifferOnUniversalPreorder`

Statement: The inequality-based strict part and the non-converse strict part
differ for preorders without antisymmetry, witnessed by the universal Boolean
preorder.

Logical form: `StrictPartConstructionsFailToAgree BooleanUniversalPreorder`.
-/
theorem StrictPartConstructionsDifferOnUniversalPreorder :
    StrictPartConstructionsFailToAgree BooleanUniversalPreorder := by
  sorry

end LRA.Order.OrderedSets.Preorder
