import LRA.UniversalAlgebra.Homomorphism.Definition
import LRA.Relation.Structures

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u v

   
                                                 
                                                
                                       

                                                               
                                                                   
                                                             
                                   
  

                                                                
    

             

       
                                  
                                       
                                       
                                 
                                                                      
   
  
def kernelRelation {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N) :
    M.Domain → M.Domain → Prop :=
  fun first second => homomorphism.map first = homomorphism.map second

                                                                

             

       
                                                   
                                       
                                       
                                             
   
  
theorem kernelRelationIsEquivalence {S : Signature}
    {M : Model.{u} S} {N : Model.{v} S}
    (homomorphism : Homomorphism M N) :
    Equivalence (kernelRelation homomorphism) := by
  sorry

end LRA.UniversalAlgebra
