import LRA.VolumeI.Order.OrderedSets.Preorder.Examples
import LRA.VolumeI.Order.OrderedSets.Preorder.Relationships
import LRA.VolumeI.Order.Relations.StrictPart.Definition

namespace LRA.VolumeI.Order.OrderedSets.Preorder

universe u

/--
`FailsPreorder relation` says that an endorelation does not satisfy the
preorder laws.

Logical form:

```lean
Not (LRA.VolumeI.Order.Preorder relation)
```
-/
def FailsPreorder
    {Carrier : Type u}
    (relation : LRA.VolumeI.Order.OrderedSets.OrderRelation Carrier) :
    Prop :=
  Not (LRA.VolumeI.Order.Preorder relation)

/-- The immediate-successor-or-equality relation on natural numbers. -/
def ImmediateSuccessorOrEqualRelation :
    LRA.VolumeI.Relations.Endorelation Nat :=
  fun left right => left = right \/ right = left + 1

/-- A reflexive but non-transitive relation witnesses failure of preorder. -/
theorem ImmediateSuccessorOrEqualFailsPreorder :
    LRA.VolumeI.Relations.Reflexive ImmediateSuccessorOrEqualRelation /\
      Not (LRA.VolumeI.Relations.Transitive
        ImmediateSuccessorOrEqualRelation) /\
      FailsPreorder ImmediateSuccessorOrEqualRelation := by
  sorry

/-- The natural strict order is transitive but non-reflexive. -/
theorem NatStrictOrderFailsPreorder :
    LRA.VolumeI.Relations.Transitive (fun left right : Nat => left < right) /\
      Not (LRA.VolumeI.Relations.Reflexive
        (fun left right : Nat => left < right)) /\
      FailsPreorder (fun left right : Nat => left < right) := by
  sorry

/--
The inequality-based strict part and the non-converse strict part differ for
preorders without antisymmetry, witnessed by the universal Boolean preorder.
-/
theorem StrictPartConstructionsDifferOnUniversalPreorder :
    LRA.VolumeI.Order.StrictPart BooleanUniversalPreorder.relation ≠
      StrictPartByNotConverse BooleanUniversalPreorder := by
  sorry

end LRA.VolumeI.Order.OrderedSets.Preorder
