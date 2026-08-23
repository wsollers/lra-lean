                                              
                                                                             

import LRA.Set.Model.Theory
import Mathlib.SetTheory.ZFC.Basic

namespace LRA.Set.ModelTheory

open LRA.Logic
open LRA.Logic.FirstOrder

   
                                            
                                           
                                                                      
                                                             

                                                                
                                                                      
                                                                      
                                                                
                                                               
                                                                     
         

                                                             
                                                                    
                                                                    
                                                                 
                                                                    
                                                        
                                                
  

                                                                   
                                                                   
               

             

       
                                                                            
                     
                       
                                                                
                                                      
                             
                                                                 
                                            
                             
                    
   
  
@[reducible] noncomputable def ZFSetMembershipModel : Model.{1} MembershipSignature where
  Domain := ZFSet.{0}
  domainNonempty := ⟨∅⟩
  interpretFunction := fun functionSymbol => functionSymbol.elim
  interpretRelation := fun relationSymbol arguments =>
    match relationSymbol with
    | .mem => arguments ⟨0, by decide⟩ ∈ arguments ⟨1, by decide⟩
  interpretConstant := fun constantSymbol =>
    match constantSymbol with
    | .emptySet => ∅

                                                   

   
                                                                      

             

       
                                                                                       
                                                                   
   
  
theorem zfSetSatisfiesExtensionality (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment extensionalityFormula := by
  sorry

   
                                                           

             

       
                                                                                 
                                                             
   
  
theorem zfSetSatisfiesEmptySet (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment emptySetFormula := by
  sorry

   
                                                        

             

       
                                                                                
                                                            
   
  
theorem zfSetSatisfiesPairing (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment pairingFormula := by
  sorry

   
                                                    

             

       
                                                                              
                                                          
   
  
theorem zfSetSatisfiesUnion (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment unionFormula := by
  sorry

   
                                                           

             

       
                                                                                 
                                                             
   
  
theorem zfSetSatisfiesPowerSet (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment powerSetFormula := by
  sorry

   
                                                          

             

       
                                                                                 
                                                             
   
  
theorem zfSetSatisfiesInfinity (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment infinityFormula := by
  sorry

   
                                                              

             

       
                                                                                   
                                                               
   
  
theorem zfSetSatisfiesFoundation (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment foundationFormula := by
  sorry

                                                                  
                                                             
                              

             

       
                                                                               
                                                           
   
  
theorem zfSetSatisfiesChoice (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment choiceFormula := by
  sorry

   
                                                              

             

       
                                
                                                
                                            
                                                      
                                             
                                   
   
  
theorem zfSetSatisfiesSeparation
    (property : Formula MembershipSignature Nat)
    (hygienic : SeparationHygienic property)
    (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment
      (separationInstance property) := by
  sorry

                                                                    
                                                           
                                                           
                                   

             

       
                                 
                                                
                                             
                                                      
                                             
                                    
   
  
theorem zfSetSatisfiesReplacement
    (relation : Formula MembershipSignature Nat)
    (hygienic : ReplacementHygienic relation)
    (assignment : Nat → ZFSetMembershipModel.Domain) :
    Satisfies ZFSetMembershipModel assignment
      (replacementInstance relation) := by
  sorry

                                                                      
                                                    

             

       
                        
                                                          
   
  
theorem zfSetModelsZFC :
    ZFSetMembershipModel ∈ ModelsOfFormulaTheory ZFCTheory := by
  sorry

end LRA.Set.ModelTheory
