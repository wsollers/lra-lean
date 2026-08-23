import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

                                                                    
                                                                     
                                                                         
axiom FiveSegment (x y z x' y' z' u u' : TarskiPoint)
    (xNeY : x ≠ y)
    (bxyz : TarskiBetween x y z) (bxyz' : TarskiBetween x' y' z')
    (xyCongXy' : TarskiCongruent x y x' y')
    (yzCongYz' : TarskiCongruent y z y' z')
    (xuCongXu' : TarskiCongruent x u x' u')
    (yuCongYu' : TarskiCongruent y u y' u') :
    TarskiCongruent z u z' u'

end LRA.EuclideanSpace
