import LRA.VolumeI.Order.Morphisms.OrderEmbedding.Definition
import LRA.VolumeI.Order.OrderedSets.PartialOrder.Definition
import LRA.VolumeI.Map.Image.All
import LRA.VolumeI.Map.Preimage.All
import LRA.VolumeI.Order.Bounds.BoundSets.Theorems
import LRA.VolumeI.Order.Bounds.GreatestElement.Definition
import LRA.VolumeI.Order.Bounds.LeastElement.Definition

namespace LRA.Order

open LRA.Set

universe u v w x

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

/-- `OrderEmbeddingSendsUpperBoundToImageUpperBound`

Statement: An order embedding transports upper bounds to upper bounds of direct images.

Logical form: `OrderEmbedding r s f → UpperBound r A b → UpperBound s (Image f A) (f b)`. -/
theorem OrderEmbeddingSendsUpperBoundToImageUpperBound
    {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement TargetSet] [SeparationLaws Beta TargetSet]
    [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha -> Beta}
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    {subset : SourceSet} {bound : Alpha}
    (boundIsUpper : UpperBound sourceRelation subset bound) :
    UpperBound targetRelation (LRA.Map.Image.Image map subset : TargetSet) (map bound) := by
  sorry

/-- `OrderEmbeddingSendsLowerBoundToImageLowerBound`

Statement: An order embedding transports lower bounds to lower bounds of direct images.

Logical form: `OrderEmbedding r s f → LowerBound r A b → LowerBound s (Image f A) (f b)`. -/
theorem OrderEmbeddingSendsLowerBoundToImageLowerBound
    {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement TargetSet] [SeparationLaws Beta TargetSet]
    [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha -> Beta}
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    {subset : SourceSet} {bound : Alpha}
    (boundIsLower : LowerBound sourceRelation subset bound) :
    LowerBound targetRelation (LRA.Map.Image.Image map subset : TargetSet) (map bound) := by
  sorry

/-- `OrderEmbeddingUpperBoundsPreimageIff`

Statement: An embedding characterizes source upper bounds by a preimage of target upper bounds.

Logical form: `b ∈ UpperBounds r A ↔ b ∈ Preimage f (UpperBounds s (Image f A))`. -/
theorem OrderEmbeddingUpperBoundsPreimageIff
    {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Alpha SourceSet] [HasUniversal SourceSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement SourceSet] [HasComplement TargetSet]
    [SeparationLaws Alpha SourceSet] [UniversalMembershipLaws Alpha SourceSet]
    [SeparationLaws Beta TargetSet] [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha -> Beta}
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    (subset : SourceSet) (bound : Alpha) :
    bound ∈ UpperBounds sourceRelation subset ↔
      bound ∈ (LRA.Map.Preimage.Preimage map
        (UpperBounds targetRelation
          (LRA.Map.Image.Image map subset : TargetSet) : TargetSet) : SourceSet) := by
  sorry

/-- `OrderEmbeddingLowerBoundsPreimageIff`

Statement: An embedding characterizes source lower bounds by a preimage of target lower bounds.

Logical form: `b ∈ LowerBounds r A ↔ b ∈ Preimage f (LowerBounds s (Image f A))`. -/
theorem OrderEmbeddingLowerBoundsPreimageIff
    {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Alpha SourceSet] [HasUniversal SourceSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement SourceSet] [HasComplement TargetSet]
    [SeparationLaws Alpha SourceSet] [UniversalMembershipLaws Alpha SourceSet]
    [SeparationLaws Beta TargetSet] [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha -> Beta}
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    (subset : SourceSet) (bound : Alpha) :
    bound ∈ LowerBounds sourceRelation subset ↔
      bound ∈ (LRA.Map.Preimage.Preimage map
        (LowerBounds targetRelation
          (LRA.Map.Image.Image map subset : TargetSet) : TargetSet) : SourceSet) := by
  sorry

/-- `OrderEmbeddingPreservesGreatestElement`

Statement: An order embedding transports greatest elements to greatest elements of images.

Logical form: `OrderEmbedding r s f → GreatestElement r A g → GreatestElement s (Image f A) (f g)`. -/
theorem OrderEmbeddingPreservesGreatestElement
    {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement TargetSet] [SeparationLaws Beta TargetSet]
    [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha -> Beta}
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    {subset : SourceSet} {greatest : Alpha}
    (greatestIsGreatest : GreatestElement sourceRelation subset greatest) :
    GreatestElement targetRelation
      (LRA.Map.Image.Image map subset : TargetSet) (map greatest) := by
  sorry

/-- `OrderEmbeddingPreservesLeastElement`

Statement: An order embedding transports least elements to least elements of images.

Logical form: `OrderEmbedding r s f → LeastElement r A l → LeastElement s (Image f A) (f l)`. -/
theorem OrderEmbeddingPreservesLeastElement
    {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement TargetSet] [SeparationLaws Beta TargetSet]
    [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha -> Beta}
    (mapIsEmbedding : OrderEmbedding sourceRelation targetRelation map)
    {subset : SourceSet} {least : Alpha}
    (leastIsLeast : LeastElement sourceRelation subset least) :
    LeastElement targetRelation
      (LRA.Map.Image.Image map subset : TargetSet) (map least) := by
  sorry

end LRA.Order
