import LRA.UniversalAlgebra.KernelCongruence.KernelRelation.Definition
import LRA.UniversalAlgebra.Quotient.Definition
import LRA.UniversalAlgebra.Isomorphism.Definition

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u v

   
                                                   
                                                  
                                                                    
                           

                                                                   
                                                        
                                                                 
                                                                 
                                                         
                                     
  

                                                                      
                                

             

       
                                    
                                       
                                                          
                                    
                                                   
                                                                             
                                                
                                                                       
           
            
                   
   
  
def kernelCongruence {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N) : Congruence M where
  rel := kernelRelation homomorphism
  iseqv := kernelRelationIsEquivalence homomorphism
  compatible := fun functionSymbol leftArguments rightArguments related => by
    show homomorphism.map _ = homomorphism.map _
    rw [homomorphism.preservesFunction, homomorphism.preservesFunction]
    congr 1
    funext i
    exact related i

                                                             
                                                                  

             

       
                                               
                                       
                                     
                 
                                                                        
                                                                
   
  
theorem firstIsomorphismTheorem {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N)
    (surjective :
      ∀ target : N.Domain, ∃ source, homomorphism.map source = target) :
    Isomorphic (quotientModel (kernelCongruence homomorphism)) N := by
  sorry

end LRA.UniversalAlgebra
