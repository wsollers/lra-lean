import LRA.VolumeI.Order.Morphisms.OrderEmbedding.Definition
import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u v

/-- An embedding between partial orders is injective. -/
theorem OrderEmbeddingInjective
    {Alpha : Type u} {Beta : Type v}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {map : Alpha -> Beta}
    (sourceIsAntisymmetric :
      LRA.Relation.Antisymmetric sourceRelation)
    (targetIsReflexive : LRA.Relation.Reflexive targetRelation)
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map) :
    Function.Injective map := by
  sorry

end LRA.Order
