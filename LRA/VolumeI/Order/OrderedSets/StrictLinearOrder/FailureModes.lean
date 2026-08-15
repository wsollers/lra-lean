import LRA.VolumeI.Order.OrderedSets.StrictLinearOrder.Definition

namespace LRA.Order

universe u

/--
`FailsStrictLinearOrder`

Statement: A relation fails the strict-linear-order laws.

Logical form: `Not (StrictLinearOrder relation)`.
-/
def FailsStrictLinearOrder
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  Not (StrictLinearOrder relation)

section Booleans

/--
`BooleanEqualityFailsStrictLinearOrder`

Statement: Equality is reflexive, so it cannot be a strict linear order.

Logical form: `FailsStrictLinearOrder (fun left right : Bool => left = right)`.
-/
theorem BooleanEqualityFailsStrictLinearOrder :
    FailsStrictLinearOrder (fun left right : Bool => left = right) := by
  sorry

end Booleans

end LRA.Order
