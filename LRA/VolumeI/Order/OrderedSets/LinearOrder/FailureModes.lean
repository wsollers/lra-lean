import LRA.VolumeI.Order.OrderedSets.PartialOrder.Examples
import LRA.VolumeI.Order.OrderedSets.LinearOrder.Definition

namespace LRA.VolumeI.Order.OrderedSets.LinearOrder

universe u

/-- An endorelation fails totality when some pair is incomparable. -/
def FailsTotality
    {Carrier : Type u}
    (relation : LRA.VolumeI.Relations.Endorelation Carrier) : Prop :=
  Not (LRA.VolumeI.Relations.Total relation)

/-- Equality on booleans is a partial order but not a linear order. -/
theorem BooleanEqualityPartialOrderFailsTotality :
    FailsTotality
      LRA.VolumeI.Order.OrderedSets.PartialOrder.BooleanEqualityNonStrictPartialOrder.relation := by
  sorry

/-- Natural-number divisibility is not linear because, for example, `2` and
`3` are incomparable. -/
theorem NaturalDivisibilityIsNotLinearOrder :
    Not (LRA.VolumeI.Order.LinearOrder
      (fun left right : Nat => left ∣ right)) := by
  sorry

end LRA.VolumeI.Order.OrderedSets.LinearOrder
