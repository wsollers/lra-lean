                                            
                                   

import LRA.Set.Interface.ModelTheory.LStructure
import LRA.Logic.Syntax.FirstOrder.Substitute
import LRA.Logic.Syntax.FirstOrder.AllVariables
import LRA.Logic.Theory

namespace LRA.Set.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder

   
                                       
                                                 
                                                                  

                                                                    
                                                                    
                                                                  
                                                              

                                                             
                                                                    
                                                                     
                                                                 
                                                                    
                                                                  
                                                                  
                                                                 
                                                                 
                                                                     
                                                                     
                                                                 
                                                              
                                                                   
                                            

                                                                    
                                    
  

                                                     

             

       
                                                              
                        
          
                                               
                 
   
  
def extensionalityFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.forallQ 1
    (.impl
      (.forallQ 2 (iffF (memF 2 0) (memF 2 1)))
      (eqF 0 1)))

                                                                  

             

       
                                                        
                                          
   
  
def emptySetFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.neg (memT (varT 0) emptyT))

                                                   

             

       
                                                       
                                                       
                                                  
   
  
def pairingFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.forallQ 1 (Formula.existsQ 2 (.forallQ 3
    (iffF (memF 3 2) (orF (eqF 3 0) (eqF 3 1))))))

                                             

             

       
                                                     
                                           
                    
                                                                
   
  
def unionFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (Formula.existsQ 1 (.forallQ 2
    (iffF (memF 2 1)
      (Formula.existsQ 3 (Formula.and (memF 3 0) (memF 2 3))))))

                                                 

             

       
                                                        
                                           
                    
                                                   
   
  
def powerSetFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (Formula.existsQ 1 (.forallQ 2
    (iffF (memF 2 1)
      (.forallQ 3 (.impl (memF 3 2) (memF 3 0))))))

                                                                       
                                                                       
         

             

       
                                                        
                                
                          
                                 
                                     
                                                                 
                       
   
  
def infinityFormula : Formula MembershipSignature Nat :=
  Formula.existsQ 0 (Formula.and
    (memT emptyT (varT 0))
    (.forallQ 1 (.impl (memF 1 0)
      (Formula.existsQ 2 (Formula.and
        (.forallQ 3 (iffF (memF 3 2) (orF (memF 3 1) (eqF 3 1))))
        (memF 2 0))))))

                                                                
                                        

             

       
                                                          
                   
                                   
                                   
                
                                                          
   
  
def foundationFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.impl
    (.neg (.equal (varT 0) emptyT))
    (Formula.existsQ 1 (Formula.and
      (memF 1 0)
      (.forallQ 2 (.impl (memF 2 1) (.neg (memF 2 0)))))))

                                                                     
                                                                     
                                                                     
                     

             

       
                                                   
   
  
def choiceFormula : Formula MembershipSignature Nat :=
  .forallQ 0 (.impl
    (Formula.and
                                 
      (.forallQ 1 (.impl (memF 1 0) (.neg (.equal (varT 1) emptyT))))
                                      
      (.forallQ 1 (.forallQ 2 (.impl
        (Formula.and (Formula.and (memF 1 0) (memF 2 0))
          (.neg (eqF 1 2)))
        (.neg (Formula.existsQ 3
          (Formula.and (memF 3 1) (memF 3 2))))))))
                             
    (Formula.existsQ 4 (.forallQ 1 (.impl (memF 1 0)
      (Formula.existsQ 3 (Formula.and
        (Formula.and (memF 3 1) (memF 3 4))
        (.forallQ 2 (.impl
          (Formula.and (memF 2 1) (memF 2 4))
          (eqF 2 3)))))))))

                                                                    
                                                                     
                                                                     
                           

             

       
                                                                             
                                                         
   
  
def SeparationHygienic (property : Formula MembershipSignature Nat) : Prop :=
  1 ∉ freeVariables property ∧ 2 ∉ freeVariables property

                                                                 
                                                        
                                                    

             

       
                                                                     
                                      
                                           
                                                         
   
  
def separationInstance (property : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .forallQ 1 (Formula.existsQ 2 (.forallQ 0
    (iffF (memF 0 2) (Formula.and (memF 0 1) property))))

                                                              
                                                                  
                                                                   
                                                                    
                          

             

       
                                                                              
                                                           
                             
   
  
def ReplacementHygienic (relation : Formula MembershipSignature Nat) : Prop :=
  2 ∉ freeVariables relation ∧ 3 ∉ freeVariables relation ∧
    4 ∉ allVariables relation

                                                                  
                                                                   
                                                                  
                                                                   
      

             

       
                                                                      
                                      
                   
                                 
                  
                                    
                                      
                                                                 
                         
                                  
                      
                                                                 
   
  
def replacementInstance (relation : Formula MembershipSignature Nat) :
    Formula MembershipSignature Nat :=
  .forallQ 2 (.impl
    (.forallQ 0 (.impl (memF 0 2)
      (Formula.and
        (Formula.existsQ 1 relation)
        (.forallQ 1 (.forallQ 4 (.impl
          (Formula.and relation (substitute 1 (varT 4) relation))
          (eqF 1 4)))))))
    (Formula.existsQ 3 (.forallQ 1
      (iffF (memF 1 3)
        (Formula.existsQ 0 (Formula.and (memF 0 2) relation))))))

                                                             

   
                                                         

             

       
                                                                      
   
  
theorem extensionalityIsClosed : IsClosedFormula extensionalityFormula := by
  sorry

   
                                              

             

       
                                                          
   
  
theorem emptySetIsClosed : IsClosedFormula emptySetFormula := by
  sorry

   
                                           

             

       
                                                        
   
  
theorem pairingIsClosed : IsClosedFormula pairingFormula := by
  sorry

   
                                       

             

       
                                                    
   
  
theorem unionIsClosed : IsClosedFormula unionFormula := by
  sorry

   
                                              

             

       
                                                          
   
  
theorem powerSetIsClosed : IsClosedFormula powerSetFormula := by
  sorry

   
                                             

             

       
                                                          
   
  
theorem infinityIsClosed : IsClosedFormula infinityFormula := by
  sorry

   
                                                 

             

       
                                                              
   
  
theorem foundationIsClosed : IsClosedFormula foundationFormula := by
  sorry

   
                                         

             

       
                                                      
   
  
theorem choiceIsClosed : IsClosedFormula choiceFormula := by
  sorry

                                 

             

       
                                                                
                                                 
   
  
def extensionalitySentence : Sentence MembershipSignature Nat :=
  ⟨extensionalityFormula, extensionalityIsClosed⟩

                            

             

       
                                                          
                                     
   
  
def emptySetSentence : Sentence MembershipSignature Nat :=
  ⟨emptySetFormula, emptySetIsClosed⟩

                          

             

       
                                                         
                                   
   
  
def pairingSentence : Sentence MembershipSignature Nat :=
  ⟨pairingFormula, pairingIsClosed⟩

                        

             

       
                                                       
                               
   
  
def unionSentence : Sentence MembershipSignature Nat :=
  ⟨unionFormula, unionIsClosed⟩

                            

             

       
                                                          
                                     
   
  
def powerSetSentence : Sentence MembershipSignature Nat :=
  ⟨powerSetFormula, powerSetIsClosed⟩

                           

             

       
                                                          
                                     
   
  
def infinitySentence : Sentence MembershipSignature Nat :=
  ⟨infinityFormula, infinityIsClosed⟩

                             

             

       
                                                            
                                         
   
  
def foundationSentence : Sentence MembershipSignature Nat :=
  ⟨foundationFormula, foundationIsClosed⟩

                         

             

       
                                                        
                                 
   
  
def choiceSentence : Sentence MembershipSignature Nat :=
  ⟨choiceFormula, choiceIsClosed⟩

                    

                                                                    
                                  

             

       
                                                                   
                                                     
                                         
                                       
                                   
                                         
                                         
                                             
                                     
                                                           
                                                
                                              
                                                            
                                                 
                                               
   
  
inductive IsZFCAxiom : Formula MembershipSignature Nat → Prop where
  | extensionality : IsZFCAxiom extensionalityFormula
  | emptySet : IsZFCAxiom emptySetFormula
  | pairing : IsZFCAxiom pairingFormula
  | union : IsZFCAxiom unionFormula
  | powerSet : IsZFCAxiom powerSetFormula
  | infinity : IsZFCAxiom infinityFormula
  | foundation : IsZFCAxiom foundationFormula
  | choice : IsZFCAxiom choiceFormula
  | separation (property : Formula MembershipSignature Nat)
      (hygienic : SeparationHygienic property) :
      IsZFCAxiom (separationInstance property)
  | replacement (relation : Formula MembershipSignature Nat)
      (hygienic : ReplacementHygienic relation) :
      IsZFCAxiom (replacementInstance relation)

                                                                    
                                                                   
                                                            
         

             

       
                                                        
                                   
   
  
def ZFCTheory : FormulaTheory MembershipSignature Nat :=
  fun formula => IsZFCAxiom formula

                                                          

                                                         

             

       
                                                     
                                 
                                             
                                       
                                                           
   
  
theorem satisfiesIffF {M : Model MembershipSignature}
    {assignment : Nat → M.Domain}
    {φ ψ : Formula MembershipSignature Nat} :
    Satisfies M assignment (iffF φ ψ) ↔
      (Satisfies M assignment φ ↔ Satisfies M assignment ψ) := by
  sorry

                                                      

             

       
                                                    
                                 
                                             
                                      
                                                           
   
  
theorem satisfiesOrF {M : Model MembershipSignature}
    {assignment : Nat → M.Domain}
    {φ ψ : Formula MembershipSignature Nat} :
    Satisfies M assignment (orF φ ψ) ↔
      (Satisfies M assignment φ ∨ Satisfies M assignment ψ) := by
  sorry

end LRA.Set.ModelTheory
