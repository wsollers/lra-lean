import LRA.Logic.Syntax.Term
import LRA.Logic.Model.Model

namespace LRA.Logic.FirstOrder

   
                

                                                                
                                       

                                                                     
                                                                  
                                   

                                                                
                                                               
                                                                    
                                                      

                                                                          
                                                                      
                                                                    
                                                                   
                                                                         
                                                            
                                                             
  

                                                                         
                             

             

       
                
                                                                                         
                               
                          
                                     
                                                                                        
   
  
def evaluateTerm
    {S : Signature} {Variable : Type} (M : Model S) (assignment : Variable -> M.Domain) :
    Term S Variable -> M.Domain
  | .var v => assignment v
  | .const c => M.interpretConstant c
  | .apply f args => M.interpretFunction f (fun i => evaluateTerm M assignment (args i))

end LRA.Logic.FirstOrder
