import LRA.VolumeI.Map.Image.All
import LRA.VolumeI.Order.Bounds.Infimum.Definition
import LRA.VolumeI.Order.Bounds.LowerBound.Definition
import LRA.VolumeI.Order.Bounds.Supremum.Definition
import LRA.VolumeI.Order.Bounds.UpperBound.Definition
import LRA.VolumeI.Order.Lattices.Join.Definition
import LRA.VolumeI.Order.Lattices.Meet.Definition
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

/-- Order isomorphisms preserve every existing binary join. -/
theorem OrderIsomorphismPreservesJoin
    {Alpha : Type u} {Beta : Type v}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {forward : Alpha -> Beta} {inverse : Beta -> Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation forward inverse)
    {left right join : Alpha}
    (joinIsJoin : Join sourceRelation left right join) :
    Join targetRelation (forward left) (forward right) (forward join) := by
  sorry

/-- Order isomorphisms preserve every existing binary meet. -/
theorem OrderIsomorphismPreservesMeet
    {Alpha : Type u} {Beta : Type v}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {forward : Alpha -> Beta} {inverse : Beta -> Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation forward inverse)
    {left right meet : Alpha}
    (meetIsMeet : Meet sourceRelation left right meet) :
    Meet targetRelation (forward left) (forward right) (forward meet) := by
  sorry

/-- Swapping the maps of an order isomorphism gives its inverse isomorphism. -/
theorem OrderIsomorphismInverse
    {Alpha : Type u} {Beta : Type v}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {targetRelation : LRA.Relation.Endorelation Beta}
    {forward : Alpha -> Beta} {inverse : Beta -> Alpha}
    (mapsAreIsomorphism :
      OrderIsomorphism sourceRelation targetRelation forward inverse) :
    OrderIsomorphism targetRelation sourceRelation inverse forward := by
  sorry

/-- Order isomorphisms compose. -/
theorem OrderIsomorphismComp
    {Alpha : Type u} {Beta : Type v} {Gamma : Type w}
    {sourceRelation : LRA.Relation.Endorelation Alpha}
    {middleRelation : LRA.Relation.Endorelation Beta}
    {targetRelation : LRA.Relation.Endorelation Gamma}
    {firstForward : Alpha -> Beta} {firstInverse : Beta -> Alpha}
    {secondForward : Beta -> Gamma} {secondInverse : Gamma -> Beta}
    (firstMapsAreIsomorphism :
      OrderIsomorphism sourceRelation middleRelation
        firstForward firstInverse)
    (secondMapsAreIsomorphism :
      OrderIsomorphism middleRelation targetRelation
        secondForward secondInverse) :
    OrderIsomorphism sourceRelation targetRelation
      (fun element => secondForward (firstForward element))
      (fun element => firstInverse (secondInverse element)) := by
  sorry

end LRA.Order
