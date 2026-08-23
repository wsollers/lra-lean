import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

                                                                    
                                                                     
                                                                  
                                                                      
                                                                     
                                      
axiom Playfair (a b c d t : TarskiPoint)
    (badt : TarskiBetween a d t) (bbdc : TarskiBetween b d c)
    (aNeD : a ≠ d) :
    ∃ x y : TarskiPoint,
      TarskiBetween a b x ∧ TarskiBetween a c y ∧ TarskiBetween x t y

end LRA.EuclideanSpace
