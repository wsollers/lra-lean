import LRA.VolumeI.Set.Implementations.LRASet.LRASet

namespace LRA.VolumeI.Set.Implementations.LRASet.Laws

open LRA.VolumeI.Set
open LRA.VolumeI.Set.Implementations.LRASet.LRASet

/-- Set equality is equivalent to pointwise membership equivalence. -/
theorem SetExtensionalityIff {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Left = Right ↔ ∀ element, Member element Left ↔ Member element Right := by
  sorry

/-- Set equality is equivalent to mutual subset inclusion. -/
theorem SetEqualityIffMutualSubset {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Left = Right ↔ Subset Left Right ∧ Subset Right Left := by
  sorry

/-- Inclusion can be tested by union absorption: `A ⊆ B` iff `A ∪ B = B`. -/
theorem SubsetIffUnionEqRight {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Subset Left Right ↔ Union Left Right = Right := by
  sorry

/-- Inclusion can be tested by intersection absorption:
`A ⊆ B` iff `A ∩ B = A`. -/
theorem SubsetIffIntersectionEqLeft {Alpha : LRACarrier}
    (Left Right : LRASet Alpha) :
    Subset Left Right ↔ Intersection Left Right = Left := by
  sorry

end LRA.VolumeI.Set.Implementations.LRASet.Laws
