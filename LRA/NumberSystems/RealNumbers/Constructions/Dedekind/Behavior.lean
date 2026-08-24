                                                                     
                                                                          
                                                             

import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.Laws
import LRA.NumberSystems.RationalNumbers.Definition

namespace LRA.NumberSystems.RealNumbers.Dedekind
open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers

variable (rationalSystem : RationalNumberSystem)

                                                    

                                                                                                                                                                                                                                                                                                     

                             


             

       
                                    
                                                  
                      
                                                            
               
                                                  
                                                                 
                                            
                                                                      
   
  
theorem embedded_rationals_are_dense
    (first second : Cut rationalSystem.FieldModel)
    (first_lt_second :
      strict_order rationalSystem.FieldModel first second) :
    ∃ rational,
      strict_order rationalSystem.FieldModel first
        (rational_embedding rationalSystem.FieldModel rational) ∧
      strict_order rationalSystem.FieldModel
        (rational_embedding rationalSystem.FieldModel rational) second := by
  sorry

                                      

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         

                             


             

       
                            
                      
                                                            
                                                                         
                                                               
                                                              
                                           
                                                                     
                                                
                                                     
                                                            
   
  
theorem archimedean_property
    (integer_cofinal :
      ∀ value : rationalSystem.FieldModel.signature.carrier,
        ∃ integer : rationalSystem.IntegerSystem.Model.signature.carrier,
          rationalSystem.FieldModel.signature.StrictOrder value
            (rationalSystem.IntegerEmbedding.ToField integer))
    (cut : Cut rationalSystem.FieldModel) :
    ∃ integer : rationalSystem.IntegerSystem.Model.signature.carrier,
      strict_order rationalSystem.FieldModel cut
        (rational_embedding rationalSystem.FieldModel
          (rationalSystem.IntegerEmbedding.ToField integer)) := by
  sorry

                                                            

                                                                            


             

       
                                             
                                                           
                                                  
                                                         
               
                                                  
                                                                 
                                            
                                                                         
                                                         
                                                                     
                                                           
                                                          
   
  
def ReferenceRealNumberConstruction : Prop :=
  CompleteOrderedFieldStructure rationalSystem.FieldModel ∧
  (∀ first second : Cut rationalSystem.FieldModel,
    strict_order rationalSystem.FieldModel first second →
    ∃ rational,
      strict_order rationalSystem.FieldModel first
        (rational_embedding rationalSystem.FieldModel rational) ∧
      strict_order rationalSystem.FieldModel
        (rational_embedding rationalSystem.FieldModel rational) second) ∧
  (∀ value : rationalSystem.FieldModel.signature.carrier,
    ∃ integer : rationalSystem.IntegerSystem.Model.signature.carrier,
      rationalSystem.FieldModel.signature.StrictOrder value
        (rationalSystem.IntegerEmbedding.ToField integer))


                                                         

                                                                                                                             

                             


             

       
                                            
                                                  
   
  
theorem reference_real_number_construction :
    ReferenceRealNumberConstruction rationalSystem := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
