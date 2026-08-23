import Mathlib.Data.Fintype.Basic
import Mathlib.Data.Finset.Union
import LRA.Logic.Syntax.Term

namespace LRA.Logic.FirstOrder

   
                         

                                                                         
                                                                    
                                                                          
                                        

                                                
                                            
                                                                
                              

                                                                       
                                                                         
                                                                      
                                                                         
                                                                   
                                                                        
             
  

                                                                          
                                                    

             

       
                       
                                                              
                                      
                 
                 
                             
                                                                                                      
   
  
def freeVariablesInTerm
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    Term S Variable -> Finset Variable
  | .var v => {v}
  | .const _ => ∅
  | @Term.apply _ _ f args =>
      (Finset.univ : Finset (Fin (S.functionArity f))).biUnion (fun i => freeVariablesInTerm (args i))

end LRA.Logic.FirstOrder
