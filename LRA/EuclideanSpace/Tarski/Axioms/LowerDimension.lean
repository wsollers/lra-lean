import LRA.EuclideanSpace.Tarski.Primitives
import LRA.EuclideanSpace.Interface.Laws

namespace LRA.EuclideanSpace

                                                                        
                                                                    
                                                               
                                                         
                                                                     
                                                                
axiom LowerDimension (n : Nat) :
    ∃ points : Fin (n + 1) → TarskiPoint,
      AffinelyIndependent TarskiPoint n points

end LRA.EuclideanSpace
