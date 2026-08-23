import LRA.Logic.Proof.System.Basic
import LRA.Logic.Proof.System.Takeuti.Rule

namespace LRA.Logic.Proof.System.Takeuti

   
                                                   

                                                                   
  

   
                                                  

             

       
                                                 
                                                                 
                            
                             
                                                          
   
  
def LJRule {L : Alphabet} [DecidableEq L.FreeVar]
    (uppers : List (Judgement L)) (lower : Judgement L) : Prop :=
  Rule uppers lower /\
    lower.IsIntuitionistic /\
    forall upper, upper ∈ uppers -> upper.IsIntuitionistic

   
                                         

             

       
                                               
                                            
                          
                                                                         
                
   
  
def LJ (L : Alphabet) [DecidableEq L.FreeVar] :
    LRA.Logic.Proof.System.ProofSystem where
  Judgement := Judgement L
  IsInitial := fun J => IsInitial J /\ J.IsIntuitionistic
  Rule := LJRule

end LRA.Logic.Proof.System.Takeuti
