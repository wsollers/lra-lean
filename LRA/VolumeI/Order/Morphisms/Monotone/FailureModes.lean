import LRA.VolumeI.Order.Morphisms.Monotone.Definition

namespace LRA.Order

universe u v

/--
`FailsMonotone`

Statement: A map fails to preserve the displayed relations.

Logical form: `Not (Monotone sourceRelation targetRelation map)`.
-/
def FailsMonotone
    {Source : Type u} {Target : Type v}
    (sourceRelation : LRA.Relation.Endorelation Source)
    (targetRelation : LRA.Relation.Endorelation Target)
    (map : Source -> Target) : Prop :=
  Not (Monotone sourceRelation targetRelation map)

section Integers

/--
`IntegerNegationFailsMonotone`

Statement: Negation reverses, rather than preserves, the usual integer order.

Logical form: `FailsMonotone (fun left right : Int => left ≤ right) (fun left right : Int => left ≤ right) (fun value => -value)`.
-/
theorem IntegerNegationFailsMonotone :
    FailsMonotone
      (fun left right : Int => left ≤ right)
      (fun left right : Int => left ≤ right)
      (fun value => -value) := by
  sorry

end Integers

end LRA.Order
