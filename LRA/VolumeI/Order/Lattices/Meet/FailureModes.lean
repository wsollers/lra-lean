import LRA.VolumeI.Order.Lattices.Meet.Definition

namespace LRA.Order

universe u

/--
`FailsMeet`

Statement: A candidate fails when it is not the meet of the displayed pair.

Logical form: `Not (Meet relation left right candidate)`.
-/
def FailsMeet
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element)
    (left right candidate : Element) : Prop :=
  Not (Meet relation left right candidate)

section NaturalNumbers

/--
`ThreeFailsMeetOfTwoAndThree`

Statement: Three fails as the meet of two and three under the usual order.

Logical form: `FailsMeet (fun left right : Nat => left ≤ right) 2 3 3`.
-/
theorem ThreeFailsMeetOfTwoAndThree :
    FailsMeet (fun left right : Nat => left ≤ right) 2 3 3 := by
  sorry

end NaturalNumbers

end LRA.Order
