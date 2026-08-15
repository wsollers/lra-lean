import LRA.VolumeI.Order.Density.DenseOrder.Definition

namespace LRA.Order

universe u

/--
`ReflexivityMakesRawDensityVacuous`

Statement: The raw density predicate fails to exclude endpoint witnesses on
reflexive relations.

Logical form: `LRA.Relation.Reflexive relation → LRA.Relation.Dense relation`.
-/
def ReflexivityMakesRawDensityVacuous
    {Element : Type u}
    (relation : LRA.Relation.Endorelation Element) : Prop :=
  LRA.Relation.Reflexive relation -> LRA.Relation.Dense relation

/--
`ReflexiveRelationIsRawDense`

Statement: Every reflexive relation satisfies the raw density predicate by
choosing the left endpoint as the middle witness.

Logical form: `ReflexivityMakesRawDensityVacuous relation`.
-/
theorem ReflexiveRelationIsRawDense
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha} :
    ReflexivityMakesRawDensityVacuous relation := by
  intro relationIsReflexive
  intro left right leftRelatedToRight
  exact ⟨left, relationIsReflexive left, leftRelatedToRight⟩

end LRA.Order
