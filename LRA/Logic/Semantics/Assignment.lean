namespace LRA.Logic

   
                       

                                                                      
                                                                          
                                                                         
                                                                         
                                            

                                                                        
                                                                          
                                                                          
                                                                        
                                                                       
                                                                        
                                                                       
                                                                     
                       
  

                                                                     
                                               

             

       
                    
                                                              
                                                                   
                         
                                               
   
  
def updateAssignment
    {Variable : Type} [DecidableEq Variable] {Domain : Type u}
    (assignment : Variable -> Domain) (v : Variable) (a : Domain) :
    Variable -> Domain :=
  fun v' => if v' = v then a else assignment v'

                                                                           
                   

             

       
                                    
                                                              
                                                                   
                                         
   
  
theorem updatedVariableTakesNewValue
    {Variable : Type} [DecidableEq Variable] {Domain : Type u}
    (assignment : Variable -> Domain) (v : Variable) (a : Domain) :
    updateAssignment assignment v a v = a := by
  simp [updateAssignment]

                                                                     
                                                                  

             

       
                                      
                                                              
                                                                    
                   
                                                      
   
  
theorem differentVariableKeepsOldValue
    {Variable : Type} [DecidableEq Variable] {Domain : Type u}
    (assignment : Variable -> Domain) (v v' : Variable) (a : Domain)
    (hv : v' ≠ v) :
    updateAssignment assignment v a v' = assignment v' := by
  simp [updateAssignment, hv]

end LRA.Logic
