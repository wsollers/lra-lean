namespace LRA.Analysis.Completeness

universe u

                                                                       
                                    

                                                                          
                                                                             
                                                                            
                                                                              
                                                                           
                                             

                                                                            
           

             

       
                           
                                                             
                
                             
                                             
                                               
                                     
                                   
                                    
   
  
def CauchySequencesConverge
    (F : Type u) [Add F] [Neg F] [OfNat F 0] [LE F] : Prop :=
  ∀ a : Nat → F,
    (∀ ε : F, 0 ≤ ε → ε ≠ 0 →
      ∃ N : Nat, ∀ m n : Nat, N ≤ m → N ≤ n →
        -ε ≤ a m + -(a n) ∧ a m + -(a n) ≤ ε) →
    ∃ L : F, ∀ ε : F, 0 ≤ ε → ε ≠ 0 →
      ∃ N : Nat, ∀ n : Nat, N ≤ n →
        -ε ≤ a n + -L ∧ a n + -L ≤ ε

end LRA.Analysis.Completeness
