import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

                                                                      
                                                                      
                                                                       
                                                                        
           
axiom InnerPasch (u v p q z : TarskiPoint)
    (bupv : TarskiBetween u p v) (bpqz : TarskiBetween p q z) :
    ∃ x : TarskiPoint, TarskiBetween u x z ∧ TarskiBetween q x v

end LRA.EuclideanSpace
