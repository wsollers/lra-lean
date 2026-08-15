import LRA.VolumeI.Order.Density.DenseOrder.Definition

namespace LRA.Order

universe u

/--
The rejected non-strict formulation is vacuous: every reflexive relation
satisfies the raw density predicate by choosing the left endpoint as middle.
-/
theorem ReflexiveRelationIsRawDense
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsReflexive : LRA.Relation.Reflexive relation) :
    LRA.Relation.Dense relation := by
  intro left right leftRelatedToRight
  exact ⟨left, relationIsReflexive left, leftRelatedToRight⟩

end LRA.Order
