import LRA.Logic.Semantics.SecondOrderMonadic.SOSatisfaction

namespace LRA.Logic.SecondOrderMonadic

   
                                                                        

                                                                         
                                                                             
                                                                   
                                                                         
                                                                        
                                                                   
                                                                    

                                                                   
                                              

                                                                          
                                                                         
                                                                     
                                                                     
                                                                   
                                                   

                                                                          
                                                                       
                                                                           
                                                                  
                                                                          
                                                                    
                            
  

                                                                       
                                                                         
                                                                         
                            

             

       
                                    
                                  
                                  
                    
   
  
def emptySignature : Signature where
  Functions := ⟨Empty, Empty.elim⟩
  Relations := ⟨Empty, Empty.elim⟩
  Constants := Empty

                                                  

             

       
                
   
  
def X : Nat := 0

                                                                        
                                                                         
                                                                        
                                                                     
                                                      

             

       
                                                           
                       
                  
                                                     
                                                                      
   
  
def henkinTestFormula : SOFormula emptySignature Nat Nat :=
  SOFormula.existsSet X
    (SOFormula.and
      (SOFormula.setMember X (FirstOrder.Term.var 0))
      (SOFormula.neg (SOFormula.setMember X (FirstOrder.Term.var 1))))

                                                                    
                                                                           
                                       

             

       
                                       
             
              

                                                                        
                            
                                                         
                                            
                             
                                
           
                    

                                                                        
                            
                                                         
                                            
                             
                                
           
                    
   
  
def testElementAssignment : Nat -> Bool
  | 0 => true
  | _ => false

                                                                            
                                                                    

             

       
                                                
                
                          
                                            
                                            
                                 
                                                 
   
  
def richModel : HenkinModel emptySignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun r => Empty.elim r
  interpretConstant := Empty.elim
  SecondOrderDomain := {∅, {true}, {true, false}}

                                                                    
                                                                            
                                                     

             

       
                                                
                
                          
                                            
                                            
                                 
                                         
   
  
def poorModel : HenkinModel emptySignature where
  Domain := Bool
  domainNonempty := ⟨true⟩
  interpretFunction := fun f => Empty.elim f
  interpretRelation := fun r => Empty.elim r
  interpretConstant := Empty.elim
  SecondOrderDomain := {∅, {true, false}}

                                                                          
                                                    

             

       
                                               
                         
                                         
                       
   
  
theorem richModel_satisfies_henkinTestFormula :
    SOSatisfies richModel
      richAssignment
      henkinTestFormula := by
  simp only [henkinTestFormula, SOFormula.existsSet, SOFormula.and, SOSatisfies,
    FirstOrder.evaluateTerm, updateAssignment, richModel, richAssignment,
    testElementAssignment]
  intro h
  have h' := h {true} (by
    exact Or.inr (Or.inl rfl))
  rw [Classical.not_not] at h'
  have h'' := h' (by
    change true = true
    rfl)
  rw [Classical.not_not] at h''
  change false = true at h''
  cases h''

                                                                          
                                                                        
                                                                      
                                                             

             

       
                                                   
                           
                                           
                         
   
  
theorem poorModel_not_satisfies_henkinTestFormula :
    ¬ SOSatisfies poorModel
        poorAssignment
        henkinTestFormula := by
  simp only [henkinTestFormula, SOFormula.existsSet, SOFormula.and, SOSatisfies,
    FirstOrder.evaluateTerm, updateAssignment, poorModel, poorAssignment,
    testElementAssignment]
  rw [Classical.not_not]
  intro Y hY
  rw [Classical.not_not]
  rcases hY with hY | hY
  · subst hY
    intro h0
    exfalso
    exact h0
  · subst hY
    intro _
    rw [Classical.not_not]
    simp only [if_true]
    exact Or.inr rfl

end LRA.Logic.SecondOrderMonadic
