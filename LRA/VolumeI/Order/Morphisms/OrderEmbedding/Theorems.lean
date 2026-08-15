import LRA.VolumeI.Order.Morphisms.OrderEmbedding.Definition
import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition

namespace LRA.Order

universe u v w

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

/-- Order embeddings compose. -/
theorem OrderEmbeddingComp
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsEmbedding :
      OrderEmbedding sourceRelation middleRelation firstMap)
    (secondMapIsEmbedding :
      OrderEmbedding middleRelation targetRelation secondMap) :
    OrderEmbedding sourceRelation targetRelation
      (fun element => secondMap (firstMap element)) := by
  sorry

end LRA.Order
