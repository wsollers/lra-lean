import LRA.VolumeI.Order.Density.DenseOrder.Definition

namespace LRA.VolumeI.Order

universe u

/--
The rejected non-strict formulation is vacuous: every reflexive relation
satisfies the raw density predicate by choosing the left endpoint as middle.
-/
theorem ReflexiveRelationIsRawDense
    {Alpha : Type u}
    {relation : LRA.VolumeI.Relations.Endorelation Alpha}
    (relationIsReflexive : LRA.VolumeI.Relations.Reflexive relation) :
    LRA.VolumeI.Relations.Dense relation := by
  intro left right leftRelatedToRight
  exact ⟨left, relationIsReflexive left, leftRelatedToRight⟩

end LRA.VolumeI.Order
