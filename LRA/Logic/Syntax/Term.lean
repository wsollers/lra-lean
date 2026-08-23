import LRA.Logic.Language.FirstOrder.Signature

namespace LRA.Logic.FirstOrder

   
      

                                                          
                                                                         
                                                                         
                                         

                                                                
                      

               
                                
                                                                      
                                                                       
                                                                     

                                                                          
                                                                     
                                                                         
                                                                  
                                                                         
                                                                   

                                                                           
                                                                           
                                                                          
                                                                          
                                                                         
                                                                

                                                                           
                                                                       
                                                           
                                                                     
                                                                        
                                                        
  

   
                                                           

             

       
                                                      
                                     
                                          
           
                               
                                                     
                     
   
  
inductive Term (S : Signature) (Variable : Type) where
  | var : Variable -> Term S Variable
  | const : S.Constants -> Term S Variable
  | apply :
      (f : S.FunctionSymbol) ->
      (Fin (S.functionArity f) -> Term S Variable) ->
      Term S Variable

end LRA.Logic.FirstOrder
