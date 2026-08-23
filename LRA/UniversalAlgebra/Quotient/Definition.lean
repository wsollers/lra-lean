import LRA.UniversalAlgebra.Homomorphism.Definition

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u

   
                                          
                                                   
                                                                 
             

                                                                 
                                                                   
                                                              
                                                            
                                                                    
                                                   
                                                                     
                                                                     
                                                              
  

                                                                  
                     

             

       
                                                            
                                  
                         
              
                                         
                                     
                                                         
                                                       
                                                              
                                                             
   
  
structure Congruence {S : Signature} (M : Model.{u} S) where
  rel : M.Domain → M.Domain → Prop
  iseqv : Equivalence rel
  compatible :
    ∀ (functionSymbol : S.FunctionSymbol)
      (leftArguments rightArguments :
        Fin (S.functionArity functionSymbol) → M.Domain),
      (∀ i, rel (leftArguments i) (rightArguments i)) →
        rel (M.interpretFunction functionSymbol leftArguments)
          (M.interpretFunction functionSymbol rightArguments)

                                                                      
                                                                      
                                                            
         

             

       
                                                                 
                                                   
                               
                                                              
                                                      
                                                 
                                                                  
                                                      
                                      
                                                                 
                                            
                                                  
   
  
noncomputable def quotientModel {S : Signature} {M : Model.{u} S}
    (congruence : Congruence M) : Model.{u} S where
  Domain := Quot congruence.rel
  domainNonempty := ⟨Quot.mk _ (Classical.arbitrary M.Domain)⟩
  interpretFunction := fun functionSymbol arguments =>
    Quot.mk _ (M.interpretFunction functionSymbol
      (fun i => Classical.choose (Quot.exists_rep (arguments i))))
  interpretRelation := fun relationSymbol arguments =>
    M.interpretRelation relationSymbol
      (fun i => Classical.choose (Quot.exists_rep (arguments i)))
  interpretConstant := fun constantSymbol =>
    Quot.mk _ (M.interpretConstant constantSymbol)

                                                                  
                                                          
              

             

       
                                                        
                                                   
                                                             
                                                           
   
  
theorem quotientProjectionIsHomomorphism {S : Signature}
    {M : Model.{u} S} (congruence : Congruence M) :
    ∃ projection : Homomorphism M (quotientModel congruence),
      ∀ element, projection.map element = Quot.mk _ element := by
  sorry

end LRA.UniversalAlgebra
