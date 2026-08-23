import LRA.Order.Lattices.Lattice.Definition

namespace LRA.Order

universe u

                                                                                                               
def DistributiveLattice
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) : Prop :=
  Lattice relation /\
    (forall a b c bMeetC leftSide aJoinB aJoinC rightSide,
      Meet relation b c bMeetC ->
        Join relation a bMeetC leftSide ->
          Join relation a b aJoinB ->
            Join relation a c aJoinC ->
              Meet relation aJoinB aJoinC rightSide ->
                leftSide = rightSide) /\
      (forall a b c bJoinC leftSide aMeetB aMeetC rightSide,
        Join relation b c bJoinC ->
          Meet relation a bJoinC leftSide ->
            Meet relation a b aMeetB ->
              Meet relation a c aMeetC ->
                Join relation aMeetB aMeetC rightSide ->
                  leftSide = rightSide)

end LRA.Order
