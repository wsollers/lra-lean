import LRA.Logic.Model.Propositional.PropositionalModel
import LRA.Logic.Model.Propositional.ModelsAndTheories
import LRA.Logic.Model.Propositional.Examples

namespace LRA.Logic.Propositional

   
                                       

                                                                          
                                                                       
                                                                   
                                            
  

                                                             

             

       
                                                   
           
                
                
   
  
def modelAA : PropositionalModel testLanguage where
  valuation
    | .A => true
    | .B => true

                          

             

       
                                                   
           
                
                 
   
  
def modelTF : PropositionalModel testLanguage where
  valuation
    | .A => true
    | .B => false

                          

             

       
                                                   
           
                 
                
   
  
def modelFT : PropositionalModel testLanguage where
  valuation
    | .A => false
    | .B => true

                           

             

       
                                                   
           
                 
                 
   
  
def modelFF : PropositionalModel testLanguage where
  valuation
    | .A => false
    | .B => false

                                                                    
                                                                          
                                                                          
                                                                         
                                                                 

             

       
                                  
                                                  
   
  
theorem modelAA_mem_modelClass_A :
    modelAA ∈ modelClass (Formula.atom TestAtom.A) := by
  show evaluate modelAA.valuation (Formula.atom TestAtom.A) = true
  rfl

   
                                                                     

             

       
                                      
                                                  
   
  
theorem modelFF_not_mem_modelClass_A :
    modelFF ∉ modelClass (Formula.atom TestAtom.A) := by
  show ¬ evaluate modelFF.valuation (Formula.atom TestAtom.A) = true
  simp [modelFF, evaluate]

                                                                         
                        

             

       
                                
                                                                                          
   
  
theorem excludedMiddle_isValid :
    IsValid (Formula.or (Formula.atom TestAtom.A) (Formula.neg (Formula.atom TestAtom.A))) := by
  intro M
  show evaluate M.valuation
    (Formula.or (Formula.atom TestAtom.A) (Formula.neg (Formula.atom TestAtom.A))) = true
  rw [Formula.or_evaluatesToDisjunction]
  simp only [evaluate]
  cases M.valuation TestAtom.A <;> simp

                                                                        

             

       
                                 
                                                                                                   
   
  
theorem theory_AB_isSatisfiable :
    IsSatisfiable ({Formula.atom TestAtom.A, Formula.atom TestAtom.B} : Set (Formula testLanguage)) := by
  refine ⟨modelAA, ?_⟩
  intro φ hφ
  rcases hφ with hφ | hφ <;> subst hφ <;> rfl

                                                                      
                                                                        
                                                                   
                                  

             

       
                                           
                   
                                                                                                       
   
  
theorem theory_AAndNotA_not_isSatisfiable :
    ¬ IsSatisfiable
        ({Formula.atom TestAtom.A, Formula.neg (Formula.atom TestAtom.A)} : Set (Formula testLanguage)) := by
  rintro ⟨M, hM⟩
  have hMemA : Formula.atom TestAtom.A ∈
      ({Formula.atom TestAtom.A, Formula.neg (Formula.atom TestAtom.A)} : Set (Formula testLanguage)) :=
    Or.inl rfl
  have hMemNotA : Formula.neg (Formula.atom TestAtom.A) ∈
      ({Formula.atom TestAtom.A, Formula.neg (Formula.atom TestAtom.A)} : Set (Formula testLanguage)) :=
    Or.inr rfl
  have hA : M.satisfies (Formula.atom TestAtom.A) := hM _ hMemA
  have hNotA : M.satisfies (Formula.neg (Formula.atom TestAtom.A)) := hM _ hMemNotA
  have hAeq : evaluate M.valuation (Formula.atom TestAtom.A) = true := hA
  have hNotAeq : evaluate M.valuation (Formula.neg (Formula.atom TestAtom.A)) = true := hNotA
  simp only [evaluate] at hAeq hNotAeq
  rw [hAeq] at hNotAeq
  simp at hNotAeq

                                                                        
                  

             

       
                                     
                                                                                                    
                                  
   
  
theorem AAndB_semanticConsequence_A :
    ({Formula.and (Formula.atom TestAtom.A) (Formula.atom TestAtom.B)} : Set (Formula testLanguage))
      ⊨ₜ (Formula.atom TestAtom.A) := by
  intro M hM
  have hMemAB : Formula.and (Formula.atom TestAtom.A) (Formula.atom TestAtom.B) ∈
      ({Formula.and (Formula.atom TestAtom.A) (Formula.atom TestAtom.B)} : Set (Formula testLanguage)) :=
    rfl
  have hAB : M.satisfies (Formula.and (Formula.atom TestAtom.A) (Formula.atom TestAtom.B)) :=
    hM _ hMemAB
  have hABeq :
      evaluate M.valuation (Formula.and (Formula.atom TestAtom.A) (Formula.atom TestAtom.B)) = true :=
    hAB
  rw [Formula.and_evaluatesToConjunction] at hABeq
  show evaluate M.valuation (Formula.atom TestAtom.A) = true
  rcases Bool.and_eq_true_iff.mp hABeq with ⟨hAtrue, _⟩
  exact hAtrue

end LRA.Logic.Propositional
