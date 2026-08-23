import LRA.UniversalAlgebra.Homomorphism.Definition

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u v

   
                                           
                                           
                                        

                                                             
                                                                     
                                                                     
                                                                  
                                                                   
                                                            
  

                                                                 

             

       
                                   
                                                                      
             
                                                                      
                    
                                         
                                                                    
                                                                       
                                                    
   
  
structure Embedding {S : Signature}
    (M : Model.{u} S) (N : Model.{v} S) extends Homomorphism M N where
  injective :
    ∀ first second : M.Domain, map first = map second → first = second
  reflectsRelation :
    ∀ (relationSymbol : S.RelationSymbol)
      (arguments : Fin (S.relationArity relationSymbol) → M.Domain),
      N.interpretRelation relationSymbol (fun i => map (arguments i)) →
        M.interpretRelation relationSymbol arguments

                           

             

       
                                                                        
                                     
                                           
                                            
   
  
def Embedding.id {S : Signature} (M : Model.{u} S) : Embedding M M where
  toHomomorphism := Homomorphism.id M
  injective := fun _ _ equality => equality
  reflectsRelation := fun _ _ holds => holds

end LRA.UniversalAlgebra
