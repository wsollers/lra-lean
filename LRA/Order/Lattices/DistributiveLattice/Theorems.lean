import LRA.Order.Lattices.DistributiveLattice.Definition

namespace LRA.Order

universe u

                                               
theorem DistributiveLatticeIsLattice
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsDistributiveLattice : DistributiveLattice relation) :
    Lattice relation := by
  sorry

                                                            
theorem JoinDistributesOverMeet
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsDistributiveLattice : DistributiveLattice relation)
    {a b c bMeetC leftSide aJoinB aJoinC rightSide : Alpha}
    (bMeetCIsMeet : Meet relation b c bMeetC)
    (leftSideIsJoin : Join relation a bMeetC leftSide)
    (aJoinBIsJoin : Join relation a b aJoinB)
    (aJoinCIsJoin : Join relation a c aJoinC)
    (rightSideIsMeet : Meet relation aJoinB aJoinC rightSide) :
    leftSide = rightSide := by
  sorry

                                                            
theorem MeetDistributesOverJoin
    {Alpha : Type u}
    {relation : LRA.Relation.Endorelation Alpha}
    (relationIsDistributiveLattice : DistributiveLattice relation)
    {a b c bJoinC leftSide aMeetB aMeetC rightSide : Alpha}
    (bJoinCIsJoin : Join relation b c bJoinC)
    (leftSideIsMeet : Meet relation a bJoinC leftSide)
    (aMeetBIsMeet : Meet relation a b aMeetB)
    (aMeetCIsMeet : Meet relation a c aMeetC)
    (rightSideIsJoin : Join relation aMeetB aMeetC rightSide) :
    leftSide = rightSide := by
  sorry

end LRA.Order
