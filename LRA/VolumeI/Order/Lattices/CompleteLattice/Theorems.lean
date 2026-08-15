import LRA.VolumeI.Set.Interface.Membership
import LRA.VolumeI.Order.Lattices.CompleteLattice.Definition

namespace LRA.Order

open LRA.Set

universe u v

/-- A complete lattice over a generic set backend with an empty set has bottom and top elements. -/
theorem CompleteLatticeHasBottomAndTop
    {Element : Type u}
    {SetObject : Type v}
    [Membership Element SetObject]
    [Union SetObject] [Inter SetObject] [SDiff SetObject]
    [EmptyCollection SetObject] [HasSubset SetObject]
    [MembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsCompleteLattice : CompleteLattice SetObject relation) :
    (exists bottom, forall element, relation bottom element) /\
      (exists top, forall element, relation element top) := by
  sorry

/--
For a generic set backend with universal-set and separation capabilities, a
partial order with suprema for all represented subsets is a complete lattice;
infima arise as suprema of represented sets of lower bounds.
-/
theorem AllSupremaImplyCompleteLattice
    {Element : Type u}
    {SetObject : Type v}
    [Membership Element SetObject]
    [HasSeparation Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject]
    [SeparationLaws Element SetObject]
    [UniversalMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (everySubsetHasSupremum :
      forall subset : SetObject,
        exists supremum, Supremum relation subset supremum) :
    CompleteLattice SetObject relation := by
  sorry

end LRA.Order
