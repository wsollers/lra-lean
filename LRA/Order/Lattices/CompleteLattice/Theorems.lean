import LRA.Set.Interface.Membership
import LRA.Order.Lattices.CompleteLattice.Definition
import LRA.Order.Lattices.Lattice.Definition

namespace LRA.Order

open LRA.Set

universe u v

                                                                                                   
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

                                                                               
theorem AllInfimaImplyCompleteLattice
    {Element : Type u}
    {SetObject : Type v}
    [Membership Element SetObject]
    [HasSeparation Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject]
    [SeparationLaws Element SetObject]
    [UniversalMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsPartialOrder : PartialOrder relation)
    (everySubsetHasInfimum :
      forall subset : SetObject,
        exists infimum, Infimum relation subset infimum) :
    CompleteLattice SetObject relation := by
  sorry

                                                                            
theorem CompleteLatticeIsLattice
    {Element : Type u}
    {SetObject : Type v}
    [Membership Element SetObject]
    [HasSeparation Element SetObject] [HasUniversal SetObject]
    [HasComplement SetObject]
    [SeparationLaws Element SetObject]
    [UniversalMembershipLaws Element SetObject]
    {relation : LRA.Relation.Endorelation Element}
    (relationIsCompleteLattice : CompleteLattice SetObject relation) :
    Lattice relation := by
  sorry

end LRA.Order
