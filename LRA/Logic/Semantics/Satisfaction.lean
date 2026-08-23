import Mathlib.Tactic.Tauto
import LRA.Identity
import LRA.Logic.Syntax.FirstOrder.Formula
import LRA.Logic.Semantics.TermEvaluation
import LRA.Logic.Semantics.Assignment

namespace LRA.Logic.FirstOrder

   
             

                                                                
                                                                          
                                                                         
                                                                          

                                                                      
                                                                         
                                                                     
                                                                        
                  

                                                                    

                                                                        
                                                                        
                                                              
                                                                          
                                                                               
                                                
                                                                         
                                                                         
                                                                       
                                                                        
                                                                         
        
                                                                          
                                                                          
                                                                          
                                                         
  

                                                                      
                                      

             

       
             
                                                            
                                                       
                              
                       
                                                                         
                   
                         
                                      
                                      
             
                                
                
                                                          
                   
                                                                     
   
  
def Satisfies
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S) (assignment : Variable -> M.Domain) :
    Formula S Variable -> Prop
  | .relation r args =>
      M.interpretRelation r (fun i => evaluateTerm M assignment (args i))
  | .equal t₁ t₂ =>
      M.interpretEquality
        (evaluateTerm M assignment t₁)
        (evaluateTerm M assignment t₂)
  | .neg φ =>
      ¬ Satisfies M assignment φ
  | .impl φ ψ =>
      Satisfies M assignment φ -> Satisfies M assignment ψ
  | .forallQ v φ =>
      ∀ a : M.Domain, Satisfies M (updateAssignment assignment v a) φ

                                                                    
                                                                    
                                                                         
                                                                    
                                                                      
                                                                         
                                                                     
                                                    

             

       
                                    
                                                            
                                                     
                                
                                              
                                                           
   
  
theorem satisfiesAndIffSatisfiesBoth
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S) (assignment : Variable -> M.Domain)
    (φ ψ : Formula S Variable) :
    Satisfies M assignment (Formula.and φ ψ) ↔
      (Satisfies M assignment φ ∧ Satisfies M assignment ψ) := by
  simp only [Formula.and, Satisfies]
  tauto

                                                                         
                                                                        
                                                                      
                                                                        

             

       
                                     
                                                            
                                                     
                                             
                                                  
                                                                     
   
  
theorem satisfiesExistsIffSomeWitness
    {S : Signature} {Variable : Type} [DecidableEq Variable]
    (M : Model S) (assignment : Variable -> M.Domain)
    (v : Variable) (φ : Formula S Variable) :
    Satisfies M assignment (Formula.existsQ v φ) ↔
      ∃ a : M.Domain, Satisfies M (updateAssignment assignment v a) φ := by
  simp only [Formula.existsQ, Satisfies]
  exact not_forall_not

end LRA.Logic.FirstOrder
