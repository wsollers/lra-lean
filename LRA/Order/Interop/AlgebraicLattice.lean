import LRA.AlgebraicStructures.Lattice.Laws.Definition
import LRA.Order.Lattices.Lattice.Definition

namespace LRA.Order.Interop.AlgebraicLattice

universe u

   
                                                                    

                                                                    
                                                                           
                                                                       
                                                           

                                                                               
                                                                  
                          
  

                                                        
def OrderFromJoin {Carrier : Type u}
    (join : LRA.Operation.BinaryEndoOperation Carrier) :
    LRA.Relation.Endorelation Carrier :=
  fun left right => join left right = right

                                                        
def OrderFromMeet {Carrier : Type u}
    (meet : LRA.Operation.BinaryEndoOperation Carrier) :
    LRA.Relation.Endorelation Carrier :=
  fun left right => meet left right = left

   
                                                                        
      
  
theorem AlgebraicLatticeJoinOrderIsOrderLattice
    {Carrier : Type u}
    {join meet : LRA.Operation.BinaryEndoOperation Carrier}
    (laws : LRA.AlgebraicStructures.LatticeLaws join meet) :
    LRA.Order.Lattice (OrderFromJoin join) := by
  sorry

   
                                                                        
      
  
theorem AlgebraicLatticeMeetOrderIsOrderLattice
    {Carrier : Type u}
    {join meet : LRA.Operation.BinaryEndoOperation Carrier}
    (laws : LRA.AlgebraicStructures.LatticeLaws join meet) :
    LRA.Order.Lattice (OrderFromMeet meet) := by
  sorry

   
                                                                      
                  
  
theorem OrderLatticeOperationsAreAlgebraic
    {Carrier : Type u}
    {relation : LRA.Relation.Endorelation Carrier}
    {join meet : LRA.Operation.BinaryEndoOperation Carrier}
    (orderLattice : LRA.Order.Lattice relation)
    (joinSpec :
      forall left right : Carrier, LRA.Order.Join relation left right (join left right))
    (meetSpec :
      forall left right : Carrier, LRA.Order.Meet relation left right (meet left right)) :
    LRA.AlgebraicStructures.LatticeLaws join meet := by
  sorry

end LRA.Order.Interop.AlgebraicLattice
