import LRA.VolumeI.Order.Morphisms.Monotone.Definition
import LRA.VolumeI.Function.Image.All
import LRA.VolumeI.Function.Preimage.All
import LRA.VolumeI.Order.Bounds.BoundSets.Theorems

namespace LRA.Order

open LRA.Set

universe u v w x

/-- The identity map is monotone. -/
theorem MonotoneIdentity
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    Monotone relation relation (fun element => element) := by
  sorry

/-- Monotone maps compose. -/
theorem MonotoneComp
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsMonotone : Monotone sourceRelation middleRelation firstMap)
    (secondMapIsMonotone : Monotone middleRelation targetRelation secondMap) :
    Monotone sourceRelation targetRelation (fun x => secondMap (firstMap x)) := by
  sorry

/-- `MonotoneSendsUpperBoundToImageUpperBound`

Statement: A monotone map sends an upper bound to an upper bound of the direct image.

Logical form: `Monotone r s f → UpperBound r A b → UpperBound s (Image f A) (f b)`. -/
theorem MonotoneSendsUpperBoundToImageUpperBound
    {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement TargetSet] [SeparationLaws Beta TargetSet]
    [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha -> Beta}
    (mapIsMonotone : Monotone sourceRelation targetRelation map)
    {subset : SourceSet} {bound : Alpha}
    (boundIsUpper : UpperBound sourceRelation subset bound) :
    UpperBound targetRelation (LRA.Function.Image.Image map subset : TargetSet) (map bound) := by
  sorry

/-- `MonotoneSendsLowerBoundToImageLowerBound`

Statement: A monotone map sends a lower bound to a lower bound of the direct image.

Logical form: `Monotone r s f → LowerBound r A b → LowerBound s (Image f A) (f b)`. -/
theorem MonotoneSendsLowerBoundToImageLowerBound
    {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement TargetSet] [SeparationLaws Beta TargetSet]
    [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha -> Beta}
    (mapIsMonotone : Monotone sourceRelation targetRelation map)
    {subset : SourceSet} {bound : Alpha}
    (boundIsLower : LowerBound sourceRelation subset bound) :
    LowerBound targetRelation (LRA.Function.Image.Image map subset : TargetSet) (map bound) := by
  sorry

/-- `MonotoneImageUpperBoundsContainment`

Statement: The image of the source upper-bound family lies in the image-set upper-bound family.

Logical form: `Image f (UpperBounds r A) ⊆ UpperBounds s (Image f A)`. -/
theorem MonotoneImageUpperBoundsContainment
    {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Alpha SourceSet] [HasUniversal SourceSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement SourceSet] [HasComplement TargetSet]
    [SeparationLaws Alpha SourceSet] [UniversalMembershipLaws Alpha SourceSet]
    [SeparationLaws Beta TargetSet] [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha -> Beta}
    (mapIsMonotone : Monotone sourceRelation targetRelation map)
    (subset : SourceSet) (output : Beta)
    (outputIsImageOfUpperBound :
      output ∈ (LRA.Function.Image.Image map
        (UpperBounds sourceRelation subset : SourceSet) : TargetSet)) :
    output ∈ UpperBounds targetRelation
      (LRA.Function.Image.Image map subset : TargetSet) := by
  sorry

/-- `MonotoneUpperBoundsPreimageContainment`

Statement: Source upper bounds lie in the preimage of the image-set upper-bound family.

Logical form: `UpperBounds r A ⊆ Preimage f (UpperBounds s (Image f A))`. -/
theorem MonotoneUpperBoundsPreimageContainment
    {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Alpha SourceSet] [HasUniversal SourceSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement SourceSet] [HasComplement TargetSet]
    [SeparationLaws Alpha SourceSet] [UniversalMembershipLaws Alpha SourceSet]
    [SeparationLaws Beta TargetSet] [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha -> Beta}
    (mapIsMonotone : Monotone sourceRelation targetRelation map)
    (subset : SourceSet) (bound : Alpha)
    (boundIsSourceUpperBound : bound ∈ UpperBounds sourceRelation subset) :
    bound ∈ (LRA.Function.Preimage.Preimage map
      (UpperBounds targetRelation
        (LRA.Function.Image.Image map subset : TargetSet) : TargetSet) : SourceSet) := by
  sorry

/-- `MonotoneImageLowerBoundsContainment`

Statement: The image of the source lower-bound family lies in the image-set lower-bound family.

Logical form: `Image f (LowerBounds r A) ⊆ LowerBounds s (Image f A)`. -/
theorem MonotoneImageLowerBoundsContainment
    {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Alpha SourceSet] [HasUniversal SourceSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement SourceSet] [HasComplement TargetSet]
    [SeparationLaws Alpha SourceSet] [UniversalMembershipLaws Alpha SourceSet]
    [SeparationLaws Beta TargetSet] [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha -> Beta}
    (mapIsMonotone : Monotone sourceRelation targetRelation map)
    (subset : SourceSet) (output : Beta)
    (outputIsImageOfLowerBound : output ∈ (LRA.Function.Image.Image map
      (LowerBounds sourceRelation subset : SourceSet) : TargetSet)) :
    output ∈ LowerBounds targetRelation
      (LRA.Function.Image.Image map subset : TargetSet) := by
  sorry

/-- `MonotoneLowerBoundsPreimageContainment`

Statement: Source lower bounds lie in the preimage of the image-set lower-bound family.

Logical form: `LowerBounds r A ⊆ Preimage f (LowerBounds s (Image f A))`. -/
theorem MonotoneLowerBoundsPreimageContainment
    {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Alpha SourceSet] [HasUniversal SourceSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement SourceSet] [HasComplement TargetSet]
    [SeparationLaws Alpha SourceSet] [UniversalMembershipLaws Alpha SourceSet]
    [SeparationLaws Beta TargetSet] [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha -> Beta}
    (mapIsMonotone : Monotone sourceRelation targetRelation map)
    (subset : SourceSet) (bound : Alpha)
    (boundIsSourceLowerBound : bound ∈ LowerBounds sourceRelation subset) :
    bound ∈ (LRA.Function.Preimage.Preimage map
      (LowerBounds targetRelation
        (LRA.Function.Image.Image map subset : TargetSet) : TargetSet) : SourceSet) := by
  sorry

end LRA.Order
