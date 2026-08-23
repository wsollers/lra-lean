import LRA.Logic.Proof.System.Basic
import LRA.Logic.Proof.System.Takeuti.Rule

namespace LRA.Logic.Proof.System.Takeuti

   
                                                          
  

   
                                         

             

       
                                               
                                            
                          
                                                   
                    
   
  
def LK (L : Alphabet) [DecidableEq L.FreeVar] :
    LRA.Logic.Proof.System.ProofSystem where
  Judgement := Judgement L
  IsInitial := IsInitial
  Rule := Rule

end LRA.Logic.Proof.System.Takeuti
