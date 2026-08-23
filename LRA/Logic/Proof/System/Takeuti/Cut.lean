import LRA.Logic.Proof.System.Derivation
import LRA.Logic.Proof.System.Takeuti.LK
import LRA.Logic.Proof.System.Takeuti.LJ

namespace LRA.Logic.Proof.System.Takeuti

   
                                                     

                                                                          
                                                                  
  

   
                                                                    

             

       
                                 
                                                                 
                        
                                                                    
                          
            
                                                
                                                    
             
                                                                            
   
  
def IsCutRuleShape {L : Alphabet}
    (uppers : List (Judgement L)) (lower : Judgement L) : Prop :=
  exists (A : Formula L)
      (leftAntecedent leftSuccedent rightAntecedent rightSuccedent :
        List (Formula L)),
    uppers =
        [⟨leftAntecedent, leftSuccedent ++ [A]⟩,
          ⟨A :: rightAntecedent, rightSuccedent⟩] /\
      lower =
        ⟨leftAntecedent ++ rightAntecedent, leftSuccedent ++ rightSuccedent⟩

end LRA.Logic.Proof.System.Takeuti
