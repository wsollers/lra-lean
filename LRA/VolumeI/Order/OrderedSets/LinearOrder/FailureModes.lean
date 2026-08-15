import LRA.VolumeI.Order.OrderedSets.PartialOrder.Examples
import LRA.VolumeI.Order.OrderedSets.LinearOrder.Definition

namespace LRA.Order.OrderedSets.LinearOrder

universe u

/-- An endorelation fails totality when some pair is incomparable. -/
def FailsTotality
    {Carrier : Type u}
    (relation : LRA.Relation.Endorelation Carrier) : Prop :=
  Not (LRA.Relation.Total relation)

/-- Equality on booleans is a partial order but not a linear order. -/
theorem BooleanEqualityPartialOrderFailsTotality :
    FailsTotality
      LRA.Order.OrderedSets.PartialOrder.BooleanEqualityNonStrictPartialOrder.relation := by
  sorry

/-- Natural-number divisibility is not linear because, for example, `2` and
`3` are incomparable. -/
theorem NaturalDivisibilityIsNotLinearOrder :
    Not (LRA.Order.LinearOrder
      (fun left right : Nat => left ∣ right)) := by
  sorry

end LRA.Order.OrderedSets.LinearOrder
