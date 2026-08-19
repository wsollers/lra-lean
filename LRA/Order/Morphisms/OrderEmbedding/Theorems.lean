import LRA.Order.Morphisms.OrderEmbedding.Definition
import LRA.Relation.Properties.Definition
import LRA.Order.Bounds.BoundSets.Theorems
import LRA.Order.Bounds.GreatestElement.Definition
import LRA.Order.Bounds.LeastElement.Definition
import LRA.Order.Bounds.Supremum.Definition
import LRA.Order.Bounds.Infimum.Definition
import LRA.Order.Bounds.UpperBound.Definition
import LRA.Order.Bounds.LowerBound.Definition
import LRA.Function.Calculus.Classes.Definition
import LRA.Set.SetClass.Representation
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Order

universe u v w

/-- An embedding between partial orders is injective. -/
theorem OrderEmbeddingInjective
    {Alpha : Type u} {Beta : Type v}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {map : Alpha -> Beta}
    (sourceIsAntisymmetric : LRA.Relation.Antisymmetric sourceRelation)
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
    (firstMapIsEmbedding : OrderEmbedding sourceRelation middleRelation firstMap)
    (secondMapIsEmbedding : OrderEmbedding middleRelation targetRelation secondMap) :
    OrderEmbedding sourceRelation targetRelation
      (fun element => secondMap (firstMap element)) := by
  sorry

open LRA.Set



variable {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
variable [Membership Alpha SourceSet] [Membership Beta TargetSet]
variable {sourceRelation : LRA.Relation.Endorelation Alpha}
variable {targetRelation : LRA.Relation.Endorelation Beta}
variable {map : Alpha → Beta}

/-- An order embedding sends an upper bound to an upper bound of the image. -/
theorem OrderEmbeddingSendsUpperBoundToImageUpperBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    {bound : Alpha}
    (boundIsUpper : UpperBound sourceRelation subset bound)
    : UpperBound targetRelation imageSet (map bound) := by
  sorry

/-- An order embedding sends a lower bound to a lower bound of the image. -/
theorem OrderEmbeddingSendsLowerBoundToImageLowerBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    {bound : Alpha}
    (boundIsLower : LowerBound sourceRelation subset bound)
    : LowerBound targetRelation imageSet (map bound) := by
  sorry

/-- For an order embedding, being a source upper bound is exactly lying in the preimage of the image upper bounds. -/
theorem OrderEmbeddingUpperBoundsPreimageIff
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    (bound : Alpha)
    : UpperBound sourceRelation subset bound ↔
      LRA.Function.PreimageClass map
        (fun output => UpperBound targetRelation imageSet output) bound := by
  sorry

/-- For an order embedding, being a source lower bound is exactly lying in the preimage of the image lower bounds. -/
theorem OrderEmbeddingLowerBoundsPreimageIff
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    (bound : Alpha)
    : LowerBound sourceRelation subset bound ↔
      LRA.Function.PreimageClass map
        (fun output => LowerBound targetRelation imageSet output) bound := by
  sorry

/-- An order embedding carries a greatest element to a greatest element of the image. -/
theorem OrderEmbeddingPreservesGreatestElement
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    {greatest : Alpha}
    (greatestIsGreatest : GreatestElement sourceRelation subset greatest)
    : GreatestElement targetRelation imageSet (map greatest) := by
  sorry

/-- An order embedding carries a least element to a least element of the image. -/
theorem OrderEmbeddingPreservesLeastElement
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    {least : Alpha}
    (leastIsLeast : LeastElement sourceRelation subset least)
    : LeastElement targetRelation imageSet (map least) := by
  sorry

end LRA.Order
