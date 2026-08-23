import LRA.Logic.Syntax.Term

namespace LRA.Logic.FirstOrder

   
                        

                                                                   
                                                                        
                                                                         
                                                      
  

                                                         

             

       
                    
                                                            
                                                                             
                                             
                            
                                                                          
   
  
def substituteInTerm
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (x : Variable) (t : Term S Variable) : Term S Variable -> Term S Variable
  | .var v => if v = x then t else Term.var v
  | .const c => Term.const c
  | .apply f args => Term.apply f (fun i => substituteInTerm x t (args i))

end LRA.Logic.FirstOrder
