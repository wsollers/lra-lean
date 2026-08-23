import LRA.EuclideanSpace.Interface.Relations

namespace LRA.EuclideanSpace

   
                                                                     
                                                                     
                                                                      
                                                                       
                                                                     
                                                                      
                                                

                                                                 
                                                                      
                                                                    
                                                                       
                                                                 
                                                 
  

                                                                  
                      
axiom TarskiPoint : Type

                                                                         
                                   
axiom TarskiBetween : TarskiPoint → TarskiPoint → TarskiPoint → Prop

                                                                         
                                                       
axiom TarskiCongruent : TarskiPoint → TarskiPoint → TarskiPoint → TarskiPoint → Prop

instance : Between TarskiPoint := ⟨TarskiBetween⟩
instance : Congruent TarskiPoint := ⟨TarskiCongruent⟩

end LRA.EuclideanSpace
