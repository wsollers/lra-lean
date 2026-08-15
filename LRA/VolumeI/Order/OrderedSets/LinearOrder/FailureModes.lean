import LRA.VolumeI.Order.OrderedSets.PartialOrder.Examples
import LRA.VolumeI.Order.OrderedSets.LinearOrder.Definition

namespace LRA.Order.OrderedSets.LinearOrder

universe u

/--
`FailsTotality`

Statement: An endorelation fails totality when some pair is incomparable.

Logical form: `Not (LRA.Relation.Total relation)`.
-/
def FailsTotality
    {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier) : Prop :=
  Not (LRA.Relation.Total relation)

/--
`BooleanEqualityPartialOrderFailsTotality`

Statement: Equality on booleans is a partial order but not a linear order.

Logical form: `FailsTotality BooleanEqualityNonStrictPartialOrder.relation`.
-/
theorem BooleanEqualityPartialOrderFailsTotality :
    FailsTotality
      LRA.Order.OrderedSets.PartialOrder.BooleanEqualityNonStrictPartialOrder.relation := by
  sorry

/--
`NaturalDivisibilityIsNotLinearOrder`

Statement: Natural-number divisibility is not linear because, for example,
`2` and `3` are incomparable.

Logical form: `FailsTotality (fun left right : Nat => left ∣ right)`.
-/
theorem NaturalDivisibilityIsNotLinearOrder :
    FailsTotality (fun left right : Nat => left ∣ right) := by
  sorry

end LRA.Order.OrderedSets.LinearOrder
