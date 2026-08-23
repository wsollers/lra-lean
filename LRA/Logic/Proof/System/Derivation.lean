import LRA.Logic.Proof.System.Basic

namespace LRA.Logic.Proof.System

   
                                               

                                                                   
                                                                             
  

   
                                                                     

             

       
                                                           
                               
                      
                   
                                                             
                            
                                                
                       
   
  
inductive Derivable (P : ProofSystem) : P.Judgement -> Prop
  | initial {J : P.Judgement} :
      P.IsInitial J ->
      Derivable P J
  | infer {uppers : List P.Judgement} {lower : P.Judgement} :
      P.Rule uppers lower ->
      (forall J, J ∈ uppers -> Derivable P J) ->
      Derivable P lower

end LRA.Logic.Proof.System
