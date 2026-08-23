import LRA.Logic.Language.FirstOrder.Signature

namespace LRA.Logic

   
                     

                                                                      
                                                                        
                                                                         
                                                                         
                                                                           
                                                                       
                                                                         
                                    

                                                                       
                                                                     
                                                                          
                                                                          
                                                                        
          

                                                                   
                                                                         
                                                                          
                                                                        
                                                                        
                                                                          
                                                                    
                                                                     
                                                                          
                            
  

                                                                           
                                                                           
                                                                  

             

       
                                                     
                                                       
                                                       
                                             

                          
                                                               
                          
                                                               

                                                                        
                          
                                                                 
                                                                        
                          
                                                                 
                                                                        
                   
                                                       

                                                                          
                                                                         
                             
                                  
                                                    
                                                                           
                                  
                                                    
                                                                      
                                  
                                                    

                                                                       
                                                                     
                                                                            
                                                                        
                                                                  
                                                                        
                                                                            
                                                                 
                       
                                     
                                                                
                                                    
                                         
                                     
                                                                
   
  
structure SignatureEmbedding (S S' : Signature) where
  embedFunction : S.FunctionSymbol -> S'.FunctionSymbol
  embedRelation : S.RelationSymbol -> S'.RelationSymbol
  embedConstant : S.Constants -> S'.Constants

  functionArityPreserved :
    ∀ f, S'.functionArity (embedFunction f) = S.functionArity f
  relationArityPreserved :
    ∀ r, S'.relationArity (embedRelation r) = S.relationArity r

                                                                        
                          
  functionPreimage : S'.FunctionSymbol -> Option S.FunctionSymbol
                                                                        
                          
  relationPreimage : S'.RelationSymbol -> Option S.RelationSymbol
                                                                        
                   
  constantPreimage : S'.Constants -> Option S.Constants

                                                                          
                                                                         
                             
  functionPreimage_embedFunction :
    ∀ f, functionPreimage (embedFunction f) = some f
                                                                           
  relationPreimage_embedRelation :
    ∀ r, relationPreimage (embedRelation r) = some r
                                                                      
  constantPreimage_embedConstant :
    ∀ c, constantPreimage (embedConstant c) = some c

                                                                       
                                                                     
                                                                            
                                                                        
                                                                  
                                                                        
                                                                            
                                                                 
                       
  functionEmbedFunction_of_preimage :
    ∀ f' f, functionPreimage f' = some f -> embedFunction f = f'
                                                    
                                         
  relationEmbedRelation_of_preimage :
    ∀ r' r, relationPreimage r' = some r -> embedRelation r = r'

end LRA.Logic
