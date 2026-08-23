import LRA.UniversalAlgebra.Embedding.Definition

namespace LRA.UniversalAlgebra

open LRA.Logic
open LRA.Logic.FirstOrder

universe u

   
                                              
                                              
                                                                
                      

                                                                    
                                                                    
                                                                
                                                                    
                                                                    
                                
  

                                                                    
              

             

       
                                                             
                           
                        
                                         
                                                                    
                                    
                                                              
                     
                                        
                                                  
   
  
structure Subuniverse {S : Signature} (M : Model.{u} S) where
  carrier : M.Domain → Prop
  closedUnderFunctions :
    ∀ (functionSymbol : S.FunctionSymbol)
      (arguments : Fin (S.functionArity functionSymbol) → M.Domain),
      (∀ i, carrier (arguments i)) →
        carrier (M.interpretFunction functionSymbol arguments)
  containsConstants :
    ∀ constantSymbol : S.ConstantSymbol,
      carrier (M.interpretConstant constantSymbol)

                                      

             

       
                                                                           
                          
                                              
                                       
   
  
def Subuniverse.top {S : Signature} (M : Model.{u} S) : Subuniverse M where
  carrier := fun _ => True
  closedUnderFunctions := fun _ _ _ => trivial
  containsConstants := fun _ => trivial

                                                                     
                                                                  
                                       

             

       
                                                              
                                                                              
                     
                                          
                            
                                                      
                                                                     
                                                                               
                                                      
                                                                   
                                            
                                                                            
   
  
def Subuniverse.inducedModel {S : Signature} {M : Model.{u} S}
    (U : Subuniverse M) (nonempty : Nonempty {element // U.carrier element}) :
    Model.{u} S where
  Domain := {element // U.carrier element}
  domainNonempty := nonempty
  interpretFunction := fun functionSymbol arguments =>
    ⟨M.interpretFunction functionSymbol (fun i => (arguments i).val),
     U.closedUnderFunctions functionSymbol _ (fun i => (arguments i).property)⟩
  interpretRelation := fun relationSymbol arguments =>
    M.interpretRelation relationSymbol (fun i => (arguments i).val)
  interpretConstant := fun constantSymbol =>
    ⟨M.interpretConstant constantSymbol, U.containsConstants constantSymbol⟩

                                                           

             

       
                                                           
                                                                              
                                               
                    
                                     
                                   
                                             
                                                       
                                            
   
  
def Subuniverse.inclusion {S : Signature} {M : Model.{u} S}
    (U : Subuniverse M) (nonempty : Nonempty {element // U.carrier element}) :
    Embedding (U.inducedModel nonempty) M where
  map := Subtype.val
  preservesFunction := fun _ _ => rfl
  preservesConstant := fun _ => rfl
  preservesRelation := fun _ _ holds => holds
  injective := fun _ _ equality => Subtype.ext equality
  reflectsRelation := fun _ _ holds => holds

end LRA.UniversalAlgebra
