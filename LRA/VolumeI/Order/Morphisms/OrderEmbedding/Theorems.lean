import LRA.VolumeI.Order.Morphisms.OrderEmbedding.Definition
import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition

namespace LRA.VolumeI.Order

universe u v

/-- An embedding between partial orders is injective. -/
theorem OrderEmbeddingInjective
    {Alpha : Type u} {Beta : Type v}
    {sourceRelation : LRA.VolumeI.Relations.Endorelation Alpha}
    {targetRelation : LRA.VolumeI.Relations.Endorelation Beta}
    {map : Alpha -> Beta}
    (sourceIsAntisymmetric :
      LRA.VolumeI.Relations.Antisymmetric sourceRelation)
    (targetIsReflexive : LRA.VolumeI.Relations.Reflexive targetRelation)
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map) :
    Function.Injective map := by
  sorry

end LRA.VolumeI.Order
