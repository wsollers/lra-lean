import LRA.Order.Morphisms.OrderIsomorphism.Theorems
import LRA.VolumeI.Map.Image.All
import LRA.Order.Bounds.Infimum.Definition
import LRA.Order.Bounds.LowerBound.Definition
import LRA.Order.Bounds.Supremum.Definition
import LRA.Order.Bounds.UpperBound.Definition
import LRA.Relation.Operations.Converse.Definition

namespace LRA.Order

open LRA.Set

universe u v w x

/-- Order isomorphisms carry suprema to suprema of generic direct images. -/
theorem OrderIsomorphismPreservesSupremum
    {Alpha : Type u} {Beta : Type v}
    {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement TargetSet]
    [SeparationLaws Beta TargetSet]
    [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {forward : Alpha -> Beta} {inverse : Beta -> Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation forward inverse)
    {subset : SourceSet} {supremum : Alpha}
    (supremumIsSupremum : Supremum sourceRelation subset supremum) :
    Supremum targetRelation
      (LRA.Map.Image.Image forward subset : TargetSet)
      (forward supremum) := by
  sorry

/-- Order isomorphisms carry upper bounds to upper bounds of direct images. -/
theorem OrderIsomorphismPreservesUpperBound
    {Alpha : Type u} {Beta : Type v}
    {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement TargetSet]
    [SeparationLaws Beta TargetSet]
    [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {forward : Alpha -> Beta} {inverse : Beta -> Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation forward inverse)
    {subset : SourceSet} {bound : Alpha}
    (boundIsUpperBound : UpperBound sourceRelation subset bound) :
    UpperBound targetRelation
      (LRA.Map.Image.Image forward subset : TargetSet)
      (forward bound) := by
  sorry

/-- Order isomorphisms carry lower bounds to lower bounds of direct images. -/
theorem OrderIsomorphismPreservesLowerBound
    {Alpha : Type u} {Beta : Type v}
    {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement TargetSet]
    [SeparationLaws Beta TargetSet]
    [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {forward : Alpha -> Beta} {inverse : Beta -> Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation forward inverse)
    {subset : SourceSet} {bound : Alpha}
    (boundIsLowerBound : LowerBound sourceRelation subset bound) :
    LowerBound targetRelation
      (LRA.Map.Image.Image forward subset : TargetSet)
      (forward bound) := by
  sorry

/-- Order isomorphisms carry infima to infima of generic direct images. -/
theorem OrderIsomorphismPreservesInfimum
    {Alpha : Type u} {Beta : Type v}
    {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement TargetSet]
    [SeparationLaws Beta TargetSet]
    [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {forward : Alpha -> Beta} {inverse : Beta -> Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation forward inverse)
    {subset : SourceSet} {infimum : Alpha}
    (infimumIsInfimum : Infimum sourceRelation subset infimum) :
    Infimum targetRelation
      (LRA.Map.Image.Image forward subset : TargetSet)
      (forward infimum) := by
  sorry

/-- An isomorphism into the converse order carries suprema to infima. -/
theorem OrderIsomorphismToConverseSendsSupremumToInfimum
    {Alpha : Type u} {Beta : Type v}
    {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement TargetSet]
    [SeparationLaws Beta TargetSet]
    [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {forward : Alpha -> Beta} {inverse : Beta -> Alpha}
    (mapsAreReversingIsomorphism :
      OrderIsomorphism sourceRelation
        (LRA.Relation.Converse targetRelation) forward inverse)
    {subset : SourceSet} {supremum : Alpha}
    (supremumIsSupremum : Supremum sourceRelation subset supremum) :
    Infimum targetRelation
      (LRA.Map.Image.Image forward subset : TargetSet)
      (forward supremum) := by
  sorry

/-- An isomorphism into the converse order carries infima to suprema. -/
theorem OrderIsomorphismToConverseSendsInfimumToSupremum
    {Alpha : Type u} {Beta : Type v}
    {SourceSet : Type w} {TargetSet : Type x}
    [Membership Alpha SourceSet] [Membership Beta TargetSet]
    [HasSeparation Beta TargetSet] [HasUniversal TargetSet]
    [HasComplement TargetSet]
    [SeparationLaws Beta TargetSet]
    [UniversalMembershipLaws Beta TargetSet]
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {forward : Alpha -> Beta} {inverse : Beta -> Alpha}
    (mapsAreReversingIsomorphism :
      OrderIsomorphism sourceRelation
        (LRA.Relation.Converse targetRelation) forward inverse)
    {subset : SourceSet} {infimum : Alpha}
    (infimumIsInfimum : Infimum sourceRelation subset infimum) :
    Supremum targetRelation
      (LRA.Map.Image.Image forward subset : TargetSet)
      (forward infimum) := by
  sorry

end LRA.Order
