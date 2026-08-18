import LRA.VolumeI.Order.Morphisms.Antitone.Definition
import LRA.VolumeI.Order.Morphisms.Monotone.Definition
import LRA.VolumeI.Function.Image.All
import LRA.VolumeI.Function.Preimage.All
import LRA.VolumeI.Order.Bounds.BoundSets.Theorems

namespace LRA.Order

open LRA.Set

universe u v w x

/-- Composing two antitone maps produces a monotone map. -/
theorem AntitoneCompAntitoneIsMonotone
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsAntitone : Antitone sourceRelation middleRelation firstMap)
    (secondMapIsAntitone : Antitone middleRelation targetRelation secondMap) :
    Monotone sourceRelation targetRelation
      (fun element => secondMap (firstMap element)) := by
  sorry

/-- An antitone map followed by a monotone map is antitone. -/
theorem AntitoneThenMonotoneIsAntitone
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsAntitone : Antitone sourceRelation middleRelation firstMap)
    (secondMapIsMonotone : Monotone middleRelation targetRelation secondMap) :
    Antitone sourceRelation targetRelation
      (fun element => secondMap (firstMap element)) := by
  sorry

/-- A monotone map followed by an antitone map is antitone. -/
theorem MonotoneThenAntitoneIsAntitone
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstMap : Alpha -> Beta} {secondMap : Beta -> Gamma}
    (firstMapIsMonotone : Monotone sourceRelation middleRelation firstMap)
    (secondMapIsAntitone : Antitone middleRelation targetRelation secondMap) :
    Antitone sourceRelation targetRelation
      (fun element => secondMap (firstMap element)) := by
  sorry

/-- `AntitoneSendsUpperBoundToImageLowerBound`

Statement: An antitone map sends an upper bound to a lower bound of the direct image.

Logical form: `Antitone r s f → UpperBound r A b → LowerBound s (Image f A) (f b)`. -/
theorem AntitoneSendsUpperBoundToImageLowerBound
    {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement TargetSet] [SeparationLaws Beta TargetSet]
    [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha -> Beta}
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    {subset : SourceSet} {bound : Alpha}
    (boundIsUpper : UpperBound sourceRelation subset bound) :
    LowerBound targetRelation (LRA.Function.Image.Image map subset : TargetSet) (map bound) := by
  sorry

/-- `AntitoneSendsLowerBoundToImageUpperBound`

Statement: An antitone map sends a lower bound to an upper bound of the direct image.

Logical form: `Antitone r s f → LowerBound r A b → UpperBound s (Image f A) (f b)`. -/
theorem AntitoneSendsLowerBoundToImageUpperBound
    {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement TargetSet] [SeparationLaws Beta TargetSet]
    [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha -> Beta}
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    {subset : SourceSet} {bound : Alpha}
    (boundIsLower : LowerBound sourceRelation subset bound) :
    UpperBound targetRelation (LRA.Function.Image.Image map subset : TargetSet) (map bound) := by
  sorry

/-- `AntitoneImageUpperBoundsIntoLowerBounds`

Statement: The image of source upper bounds lies in the lower bounds of the image.

Logical form: `Image f (UpperBounds r A) ⊆ LowerBounds s (Image f A)`. -/
theorem AntitoneImageUpperBoundsIntoLowerBounds
    {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Alpha SourceSet] [HasUniversal SourceSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement SourceSet] [HasComplement TargetSet]
    [SeparationLaws Alpha SourceSet] [UniversalMembershipLaws Alpha SourceSet]
    [SeparationLaws Beta TargetSet] [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha -> Beta}
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    (subset : SourceSet) (output : Beta)
    (outputIsImageOfUpperBound : output ∈ (LRA.Function.Image.Image map
      (UpperBounds sourceRelation subset : SourceSet) : TargetSet)) :
    output ∈ LowerBounds targetRelation
      (LRA.Function.Image.Image map subset : TargetSet) := by
  sorry

/-- `AntitoneUpperBoundsPreimageLowerBoundsContainment`

Statement: Source upper bounds lie in the preimage of the image's lower bounds.

Logical form: `UpperBounds r A ⊆ Preimage f (LowerBounds s (Image f A))`. -/
theorem AntitoneUpperBoundsPreimageLowerBoundsContainment
    {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Alpha SourceSet] [HasUniversal SourceSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement SourceSet] [HasComplement TargetSet]
    [SeparationLaws Alpha SourceSet] [UniversalMembershipLaws Alpha SourceSet]
    [SeparationLaws Beta TargetSet] [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha -> Beta}
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    (subset : SourceSet) (bound : Alpha)
    (boundIsSourceUpperBound : bound ∈ UpperBounds sourceRelation subset) :
    bound ∈ (LRA.Function.Preimage.Preimage map
      (LowerBounds targetRelation
        (LRA.Function.Image.Image map subset : TargetSet) : TargetSet) : SourceSet) := by
  sorry

/-- `AntitoneImageLowerBoundsIntoUpperBounds`

Statement: The image of source lower bounds lies in the upper bounds of the image.

Logical form: `Image f (LowerBounds r A) ⊆ UpperBounds s (Image f A)`. -/
theorem AntitoneImageLowerBoundsIntoUpperBounds
    {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Alpha SourceSet] [HasUniversal SourceSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement SourceSet] [HasComplement TargetSet]
    [SeparationLaws Alpha SourceSet] [UniversalMembershipLaws Alpha SourceSet]
    [SeparationLaws Beta TargetSet] [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha -> Beta}
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    (subset : SourceSet) (output : Beta)
    (outputIsImageOfLowerBound : output ∈ (LRA.Function.Image.Image map
      (LowerBounds sourceRelation subset : SourceSet) : TargetSet)) :
    output ∈ UpperBounds targetRelation
      (LRA.Function.Image.Image map subset : TargetSet) := by
  sorry

/-- `AntitoneLowerBoundsPreimageUpperBoundsContainment`

Statement: Source lower bounds lie in the preimage of the image's upper bounds.

Logical form: `LowerBounds r A ⊆ Preimage f (UpperBounds s (Image f A))`. -/
theorem AntitoneLowerBoundsPreimageUpperBoundsContainment
    {Alpha : Type u} {Beta : Type v} {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Alpha SourceSet] [HasUniversal SourceSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement SourceSet] [HasComplement TargetSet]
    [SeparationLaws Alpha SourceSet] [UniversalMembershipLaws Alpha SourceSet]
    [SeparationLaws Beta TargetSet] [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta} {map : Alpha -> Beta}
    (mapIsAntitone : Antitone sourceRelation targetRelation map)
    (subset : SourceSet) (bound : Alpha)
    (boundIsSourceLowerBound : bound ∈ LowerBounds sourceRelation subset) :
    bound ∈ (LRA.Function.Preimage.Preimage map
      (UpperBounds targetRelation
        (LRA.Function.Image.Image map subset : TargetSet) : TargetSet) : SourceSet) := by
  sorry

end LRA.Order
