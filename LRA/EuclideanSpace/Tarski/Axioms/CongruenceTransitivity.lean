import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

                                                                        
                  
axiom CongruenceTransitivity (x y z w u v : TarskiPoint)
    (xyCongZw : TarskiCongruent x y z w) (xyCongUv : TarskiCongruent x y u v) :
    TarskiCongruent z w u v

end LRA.EuclideanSpace
