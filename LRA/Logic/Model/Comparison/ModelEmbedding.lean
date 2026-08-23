import Mathlib.Logic.Function.Basic
import LRA.Logic.Model.Model

namespace LRA.Logic.FirstOrder

   
                 

                                                                       
                                                                        
                                                                     
                                                                        
                                                                          
                                       

                                                                        
                                                                         
                                                                         
                                                                       
                                                                 
                                         

                                                                           
                                                                          
                                                                       
                                                                          
                                                                      
                                                                         
  

                                                                         
                                                                          
                                     

             

       
                                                                
                                
                                      
                     
                                                                           
                                           
                                                        
                     
                                                                
                     
                                                                           
                                   
                                                        
   
  
structure ModelEmbedding {S : Signature} (M₁ M₂ : Model S) where
  toFun : M₁.Domain -> M₂.Domain
  injective : Function.Injective toFun
  preservesFunction :
    ∀ (f : S.FunctionSymbol) (args : Fin (S.functionArity f) -> M₁.Domain),
      toFun (M₁.interpretFunction f args) =
        M₂.interpretFunction f (fun i => toFun (args i))
  preservesConstant :
    ∀ c, toFun (M₁.interpretConstant c) = M₂.interpretConstant c
  preservesRelation :
    ∀ (r : S.RelationSymbol) (args : Fin (S.relationArity r) -> M₁.Domain),
      M₁.interpretRelation r args ↔
        M₂.interpretRelation r (fun i => toFun (args i))

end LRA.Logic.FirstOrder
