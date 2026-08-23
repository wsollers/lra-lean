import LRA.Logic.Syntax.SecondOrderMonadic.Formula
import LRA.Logic.Semantics.SecondOrderMonadic.SOAssignment
import LRA.Logic.Semantics.TermEvaluation
import LRA.Logic.Semantics.Assignment

namespace LRA.Logic.SecondOrderMonadic

   
                          

                                                                      
                                                               
                                                                     
                                                                       
                                                                         
                      

                                                            
                                                               
                                                        
                                                                            
                                                                           
                                                                    
                               

                                                                          
                                                                          
                                                                          
                                                                           
                                                    
  

                                                                       
                                                                        

             

       
               
                                                                                                  
                                                                            
                                            
                       
                           
                                                                                          
                   
                                                                         
                                                                         
             
                                  
                
                                                              
                   
                     
                     
                                                                                                    
           
                     
                                                                                                   
                     
                                          
                     
                                                 
           
   
  
def SOSatisfies
    {S : Signature} {Variable SetVariable : Type} [DecidableEq Variable] [DecidableEq SetVariable]
    (M : HenkinModel S) (assignment : SOAssignment M Variable SetVariable) :
    SOFormula S Variable SetVariable -> Prop
  | .relation r args =>
      M.interpretRelation r
        (fun i => FirstOrder.evaluateTerm M.toModel assignment.elementAssignment (args i))
  | .equal t₁ t₂ =>
      FirstOrder.evaluateTerm M.toModel assignment.elementAssignment t₁ =
        FirstOrder.evaluateTerm M.toModel assignment.elementAssignment t₂
  | .neg φ =>
      ¬ SOSatisfies M assignment φ
  | .impl φ ψ =>
      SOSatisfies M assignment φ -> SOSatisfies M assignment ψ
  | .forallQ v φ =>
      ∀ a : M.Domain,
        SOSatisfies M
          { assignment with elementAssignment := updateAssignment assignment.elementAssignment v a }
          φ
  | .setMember X t =>
      FirstOrder.evaluateTerm M.toModel assignment.elementAssignment t ∈ assignment.setAssignment X
  | .forallSet X φ =>
      ∀ Y, ∀ hY : Y ∈ M.SecondOrderDomain,
        SOSatisfies M
          (assignment.updateSetAssignment X Y hY)
          φ

end LRA.Logic.SecondOrderMonadic
