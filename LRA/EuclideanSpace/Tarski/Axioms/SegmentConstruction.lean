import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

                                                                     
                                                                    
                                                                    
axiom SegmentConstruction (x y a b : TarskiPoint) :
    ∃ z : TarskiPoint, TarskiBetween x y z ∧ TarskiCongruent y z a b

end LRA.EuclideanSpace
