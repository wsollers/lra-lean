import LRA.VolumeI.Functions.Images
import LRA.VolumeI.Order.Bounds.Supremum.Definition
import LRA.VolumeI.Order.Morphisms.OrderIsomorphism.Definition

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
      (LRA.Function.Image forward subset : TargetSet)
      (forward supremum) := by
  sorry

end LRA.Order
