import LRA.Relation.Operations.Converse.Definition
import LRA.Order.Lattices.Join.Relationships
import LRA.Order.Lattices.Meet.Relationships
import LRA.Order.Lattices.JoinSemilattice.Definition
import LRA.Order.Lattices.Lattice.Definition
import LRA.Order.Lattices.MeetSemilattice.Definition
import LRA.Order.OrderedSets.PartialOrder.Relationships

namespace LRA.Order

universe u

                                                                           
theorem LatticeIffJoinAndMeetSemilattice
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    Lattice relation ↔ JoinSemilattice relation /\ MeetSemilattice relation := by
  sorry

                                                          
theorem ConverseIsLatticeIff
    {Alpha : Type u}
    (relation : LRA.Relation.Endorelation Alpha) :
    Lattice (LRA.Relation.Converse relation) ↔ Lattice relation := by
  sorry

                                                                        
                                           

                                                                   
                                                                 
                                                                        
theorem JoinIffMeetOfDual
    {Carrier : Type u}
    (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier)
    (left right value : Carrier) :
    Join order.relation left right value ↔
      Meet (LRA.Order.OrderedSets.PartialOrder.Dual order).relation
        left right value := by
  sorry

                                                                        
                                              
theorem MeetIffJoinOfDual
    {Carrier : Type u}
    (order : LRA.Order.OrderedSets.PartialOrder.NonStrictPartialOrder Carrier)
    (left right value : Carrier) :
    Meet order.relation left right value ↔
      Join (LRA.Order.OrderedSets.PartialOrder.Dual order).relation
        left right value := by
  sorry

end LRA.Order
