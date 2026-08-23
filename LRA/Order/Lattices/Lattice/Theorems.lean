import LRA.Order.Lattices.Lattice.Definition

namespace LRA.Order

universe u

                                          
theorem LatticeHasJoin
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLattice : Lattice relation)
    (left right : Alpha) :
    exists join, Join relation left right join := by
  sorry

                                          
theorem LatticeHasMeet
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsLattice : Lattice relation)
    (left right : Alpha) :
    exists meet, Meet relation left right meet := by
  sorry

                                                                                               
theorem JoinEqualsRightIffRelated
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    (left right : Alpha) :
    Join relation left right right ↔ relation left right := by
  sorry

                                       
theorem MeetEqualsLeftIffRelated
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    (left right : Alpha) :
    Meet relation left right left ↔ relation left right := by
  sorry

                                                                               
theorem MeetWithJoinAbsorbs
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {left right join meet : Alpha}
    (joinIsJoin : Join relation left right join)
    (meetIsMeet : Meet relation left join meet) :
    meet = left := by
  sorry

                                       
theorem JoinWithMeetAbsorbs
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {left right meet join : Alpha}
    (meetIsMeet : Meet relation left right meet)
    (joinIsJoin : Join relation left meet join) :
    join = left := by
  sorry

                                                          
theorem JoinOfMeetsRelatedToMeetWithJoin
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {a b c bJoinC aMeetBJoinC aMeetB aMeetC joinOfMeets : Alpha}
    (bJoinCIsJoin : Join relation b c bJoinC)
    (aMeetBJoinCIsMeet : Meet relation a bJoinC aMeetBJoinC)
    (aMeetBIsMeet : Meet relation a b aMeetB)
    (aMeetCIsMeet : Meet relation a c aMeetC)
    (joinOfMeetsIsJoin : Join relation aMeetB aMeetC joinOfMeets) :
    relation joinOfMeets aMeetBJoinC := by
  sorry

                                                               
theorem JoinWithMeetRelatedToMeetOfJoins
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsPartialOrder : PartialOrder relation)
    {a b c bMeetC aJoinBMeetC aJoinB aJoinC meetOfJoins : Alpha}
    (bMeetCIsMeet : Meet relation b c bMeetC)
    (aJoinBMeetCIsJoin : Join relation a bMeetC aJoinBMeetC)
    (aJoinBIsJoin : Join relation a b aJoinB)
    (aJoinCIsJoin : Join relation a c aJoinC)
    (meetOfJoinsIsMeet : Meet relation aJoinB aJoinC meetOfJoins) :
    relation aJoinBMeetC meetOfJoins := by
  sorry

end LRA.Order
