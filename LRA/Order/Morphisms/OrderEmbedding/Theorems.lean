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

                                                                              
theorem OrderEmbeddingSendsUpperBoundToImageUpperBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    {bound : Alpha}
    (boundIsUpper : UpperBound sourceRelation subset bound)
    : UpperBound targetRelation imageSet (map bound) := by
  sorry

                                                                            
theorem OrderEmbeddingSendsLowerBoundToImageLowerBound
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    {bound : Alpha}
    (boundIsLower : LowerBound sourceRelation subset bound)
    : LowerBound targetRelation imageSet (map bound) := by
  sorry

                                                                                                                     
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

                                                                                        
theorem OrderEmbeddingPreservesGreatestElement
    (subset : SourceSet) (imageSet : TargetSet)
    (representsImage :
      Represents imageSet (LRA.Function.ImageClass map (ClassOfSet subset)))
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    {greatest : Alpha}
    (greatestIsGreatest : GreatestElement sourceRelation subset greatest)
    : GreatestElement targetRelation imageSet (map greatest) := by
  sorry

                                                                                  
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
