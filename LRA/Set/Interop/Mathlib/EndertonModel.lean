                                             
                                             

import LRA.Set.Model.Theory
import LRA.Set.ZFCSet.Instances
import LRA.Set.ZFC.Axioms
import LRA.Logic.Semantics.Satisfaction

namespace LRA.Set.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder

   
                                               
                                              
                                                               
                                                                    

                                           
                                                               
                                                                   
                                                                     
                                                                        
                                                     

                                                                    
                                                                
                                                                    
                                                             
                                                            
                          
  

                                                                 
                                                                  
       

             

       
                                                                           
                          
                       
                                                                
                                                      
                             
                                                                 
                                            
                             
                    
   
  
@[reducible] noncomputable def EndertonMembershipModel : Model MembershipSignature where
  Domain := LRA.Set.ZFCSet
  domainNonempty := ⟨∅⟩
  interpretFunction := fun functionSymbol => functionSymbol.elim
  interpretRelation := fun relationSymbol arguments =>
    match relationSymbol with
    | .mem => arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩
  interpretConstant := fun constantSymbol =>
    match constantSymbol with
    | .emptySet => ∅

   
                                                       

             

       
                             
                                                                                 
                                                              
                                                           
   
  
@[simp] theorem endertonInterpretsMem
    (arguments : Fin (MembershipSignature.relationArity .mem) → LRA.Set.ZFCSet) :
    EndertonMembershipModel.interpretRelation .mem arguments =
      (arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩) := by
  sorry

   
                                                           

             

       
                                 
                                                         
                          
   
  
@[simp] theorem endertonInterpretsEmpty :
    EndertonMembershipModel.interpretConstant .emptySet =
      (∅ : LRA.Set.ZFCSet) := by
  sorry

                                                   

                                                             
                                                                     
                                                                  
  

   
                                                                           

             

       
                                       
                                                         
                                                                      
   
  
theorem endertonSatisfiesExtensionality
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment extensionalityFormula := by
  sorry

   
                                                                

             

       
                                 
                                                         
                                                                
   
  
theorem endertonSatisfiesEmptySet
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment emptySetFormula := by
  sorry

   
                                                             

             

       
                                
                                                         
                                                               
   
  
theorem endertonSatisfiesPairing
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment pairingFormula := by
  sorry

   
                                                         

             

       
                              
                                                         
                                                             
   
  
theorem endertonSatisfiesUnion
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment unionFormula := by
  sorry

   
                                                                

             

       
                                 
                                                         
                                                                
   
  
theorem endertonSatisfiesPowerSet
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment powerSetFormula := by
  sorry

   
                                                               

             

       
                                 
                                                         
                                                                
   
  
theorem endertonSatisfiesInfinity
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment infinityFormula := by
  sorry

   
                                                                   

             

       
                                   
                                                         
                                                                  
   
  
theorem endertonSatisfiesFoundation
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment foundationFormula := by
  sorry

   
                                                           

             

       
                               
                                                         
                                                              
   
  
theorem endertonSatisfiesChoice
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment choiceFormula := by
  sorry

   
                                                                   

             

       
                                   
                                                
                                            
                                                         
                                                
                                   
   
  
theorem endertonSatisfiesSeparation
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment
      (separationInstance property) := by
  sorry

   
                                                                     

             

       
                                    
                                                
                                             
                                                         
                                                
                                    
   
  
theorem endertonSatisfiesReplacement
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → EndertonMembershipModel.Domain) :
    Satisfies EndertonMembershipModel assignment
      (replacementInstance relation) := by
  sorry

                                                                
                                

             

       
                           
                                                             
   
  
theorem endertonModelsZFC :
    EndertonMembershipModel ∈ ModelsOfFormulaTheory ZFCTheory := by
  sorry

end LRA.Set.ModelTheory
