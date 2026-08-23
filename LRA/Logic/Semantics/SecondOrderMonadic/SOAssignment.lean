import LRA.Logic.Model.SecondOrderMonadic.HenkinModel
import LRA.Logic.Semantics.Assignment

namespace LRA.Logic.SecondOrderMonadic

   
                         

                                                                        
                                                                         
                                                                      
                                         

                                                                       
                                                           
                                                                          
                                                                           
                                                                         
                                                                     
                      

                                                                   
                                                                         
                                                                  
  

                                                                 
                                                                        
                                                  

             

       
                      
                                                                           
                                          
                                             
   
  
structure SOAssignment
    {S : Signature} (M : HenkinModel S) (Variable SetVariable : Type) where
  elementAssignment : Variable -> M.Domain
  setAssignment : SetVariable -> Set M.Domain
  setAssignment_admissible :
    ∀ setVariable : SetVariable, setAssignment setVariable ∈ M.SecondOrderDomain

                                                                           
                                                                        
                    

             

       
                                    
                                                                           
                       
                                                      
                                                    
                                                        
                                       
   
  
def SOAssignment.updateSetAssignment
    {S : Signature} {Variable SetVariable : Type} [DecidableEq SetVariable]
    {M : HenkinModel S}
    (assignment : SOAssignment M Variable SetVariable)
    (targetVariable : SetVariable) (subset : Set M.Domain)
    (subset_admissible : subset ∈ M.SecondOrderDomain) :
    SOAssignment M Variable SetVariable where
  elementAssignment := assignment.elementAssignment
  setAssignment := updateAssignment assignment.setAssignment targetVariable subset
  setAssignment_admissible := by
    intro other
    by_cases h : other = targetVariable
    · subst h
      simp [updateAssignment]
      exact subset_admissible
    · simp [updateAssignment, h]
      exact assignment.setAssignment_admissible other

end LRA.Logic.SecondOrderMonadic
