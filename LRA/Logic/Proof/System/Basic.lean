namespace LRA.Logic.Proof.System

   
                          

                                                                          
                                                                     
                                      
  

   
                                                          

             

       
                           
                  
                               
                                            
   
  
structure ProofSystem where
  Judgement : Type
  IsInitial : Judgement -> Prop
  Rule : List Judgement -> Judgement -> Prop

end LRA.Logic.Proof.System
