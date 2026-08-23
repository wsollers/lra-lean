import Mathlib.Data.Finset.Union
import Mathlib.Data.Finset.SDiff
import LRA.Logic.Syntax.FirstOrder.Formula
import LRA.Logic.Syntax.FirstOrder.FreeVariablesInTerm

namespace LRA.Logic.FirstOrder

   
                            

                                                                     
                                                                          
                                                                       
                                                                       
             

                                                                
                                                               
                                                                  
              
                                                                       
                                                                   
                                                                          
                                                                          
                                                                         
                                                             

                                                                          
                                                                         
                                                                        
                                                                           
  

                                                              

             

       
                 
                                                              
                                         
                                                                                   
                                                                   
                             
                                                  
                                             
   
  
def freeVariables
    {S : Signature} {Variable : Type} [DecidableEq Variable] :
    Formula S Variable -> Finset Variable
  | .relation _ args => Finset.univ.biUnion (fun i => freeVariablesInTerm (args i))
  | .equal t₁ t₂ => freeVariablesInTerm t₁ ∪ freeVariablesInTerm t₂
  | .neg φ => freeVariables φ
  | .impl φ ψ => freeVariables φ ∪ freeVariables ψ
  | .forallQ v φ => (freeVariables φ).erase v

end LRA.Logic.FirstOrder
