import LRA.EuclideanSpace.Tarski.Primitives
import LRA.EuclideanSpace.Interface.Laws

namespace LRA.EuclideanSpace

                                                                    
                                                             
                                                                     
                                                                        
                                
axiom UpperDimension (n : Nat) (p : TarskiPoint) (points : Fin (n + 1) → TarskiPoint)
    (independent : AffinelyIndependent TarskiPoint n points) :
    CoincidesOrDeterminedByDistances TarskiPoint n p points

end LRA.EuclideanSpace
