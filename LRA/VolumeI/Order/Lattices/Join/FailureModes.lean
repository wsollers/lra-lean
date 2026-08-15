import LRA.VolumeI.Order.Lattices.Join.Definition

namespace LRA.Order

universe u

/--
`FailsJoin`

Statement: A candidate fails when it is not the join of the displayed pair.

Logical form: `Not (Join relation left right candidate)`.
-/
def FailsJoin
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element)
    (left right candidate : Element) : Prop :=
  Not (Join relation left right candidate)

section NaturalNumbers

/--
`TwoFailsJoinOfTwoAndThree`

Statement: Two fails as the join of two and three under the usual order.

Logical form: `FailsJoin (fun left right : Nat => left ≤ right) 2 3 2`.
-/
theorem TwoFailsJoinOfTwoAndThree :
    FailsJoin (fun left right : Nat => left ≤ right) 2 3 2 := by
  sorry

end NaturalNumbers

end LRA.Order
