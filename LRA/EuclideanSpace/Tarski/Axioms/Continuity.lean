import LRA.EuclideanSpace.Tarski.Primitives

namespace LRA.EuclideanSpace

   
                                                                     
                                                                            
                                                                     
                                                                    
                                                                       
                                                                      
                                                                        
                                                                     
                                                                       
                                                                       
                                           
  

                                                                        
                                                                       
                                                                   
axiom Continuity (φ ψ : TarskiPoint → Prop) :
    (∃ a : TarskiPoint, ∀ x y : TarskiPoint, φ x → ψ y → TarskiBetween a x y) →
    ∃ b : TarskiPoint, ∀ x y : TarskiPoint, φ x → ψ y → TarskiBetween x b y

end LRA.EuclideanSpace
