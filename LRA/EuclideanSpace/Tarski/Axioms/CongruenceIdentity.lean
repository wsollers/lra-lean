import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

                                                                      
                                                                         
axiom CongruenceIdentity (x y z : TarskiPoint)
    (xyCongZz : TarskiCongruent x y z z) : x = y

end LRA.EuclideanSpace
