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
  sorry

                                                                          
                                                                        
                                                                      
                                                             

             

       
                                                   
                           
                                           
                         
   
  
theorem poorModel_not_satisfies_henkinTestFormula :
    ¬ SOSatisfies poorModel
        poorAssignment
        henkinTestFormula := by
  sorry

end LRA.Logic.SecondOrderMonadic
