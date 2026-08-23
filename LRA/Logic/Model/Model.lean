import LRA.Logic.Language.FirstOrder.Signature

namespace LRA.Logic.FirstOrder

universe u

   
                                   

                                                          
                                                                         
                                                                          
                                                               
                                          

                                                                     
                                                                         
                                                                        
                                                                     
                                                                            
                                                                      
                                                                              
            

                                                                        
                                                                             
                                                          

                                                                         
                                                                      
                                                                       
                                                                     
                                                                      
                                                                       
                                                                        
                                                                   
                                                                     
                                                                 

                                                                      
                                                                          
                                                                       
  

                                                                          
                                                                           
                                                                             
                                                                         

                                                                            
                                                                           
                                                                         
                                                                         
                                                                  
                                         

             

       
                                     
                 
                                  
                                              
   
  
structure Model (S : Signature) where
  Domain : Type u
  domainNonempty : Nonempty Domain
  interpretEquality : Domain -> Domain -> Prop := fun left right => left = right
  equalityIsDiagonal :
    ∀ left right, interpretEquality left right ↔ left = right := by
      intro left right
      rfl
  interpretFunction :
    (f : S.FunctionSymbol) -> (Fin (S.functionArity f) -> Domain) -> Domain
  interpretRelation :
    (r : S.RelationSymbol) -> (Fin (S.relationArity r) -> Domain) -> Prop
  interpretConstant :
    S.Constants -> Domain

                                                                           
                                                                 
                                                                             
                                  
instance {S : Signature} (M : Model S) : Nonempty M.Domain :=
  M.domainNonempty

end LRA.Logic.FirstOrder
