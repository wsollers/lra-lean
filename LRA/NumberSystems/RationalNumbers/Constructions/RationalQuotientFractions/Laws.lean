                                                                                      
                                                                          
                                                                  
                               

import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.WellDefinedness

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

                                                   

             

       
                                                                               
                                                
                                                                        
                                                                           
                                          
                                                                                
                                   
                                                               
                                                                
                                   
                                                                                      
                                                                                     
   
  
def AdditiveGroupLaws (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  (∀ first second third : Carrier rational_data,
    addition rational_data (addition rational_data first second) third =
      addition rational_data first (addition rational_data second third)) ∧
  (∀ first second : Carrier rational_data,
    addition rational_data first second = addition rational_data second first) ∧
  (∀ value : Carrier rational_data,
    addition rational_data (zero rational_data) value = value ∧
    addition rational_data value (zero rational_data) = value) ∧
  (∀ value : Carrier rational_data,
    addition rational_data value (negation rational_data value) = zero rational_data ∧
    addition rational_data (negation rational_data value) value = zero rational_data)


                                     

                             

             

       
                                                                                                             
   
  
theorem additive_group_laws (rational_data : IntegerAndPositiveNaturalData) : AdditiveGroupLaws rational_data := by
  sorry

                                                                

             

       
                                                                                               
                                                
                                                                                    
                                                                                       
                                          
                                                                                            
                                   
                                                                    
                                                                     
                                                
                                                                              
                            
                                                   
                                                   
   
  
def MultiplicativeAndDistributiveLaws (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  (∀ first second third : Carrier rational_data,
    multiplication rational_data (multiplication rational_data first second) third =
      multiplication rational_data first (multiplication rational_data second third)) ∧
  (∀ first second : Carrier rational_data,
    multiplication rational_data first second = multiplication rational_data second first) ∧
  (∀ value : Carrier rational_data,
    multiplication rational_data (one rational_data) value = value ∧
    multiplication rational_data value (one rational_data) = value) ∧
  (∀ first second third : Carrier rational_data,
    multiplication rational_data first (addition rational_data second third) =
      addition rational_data
        (multiplication rational_data first second)
        (multiplication rational_data first third))


                                                      

                             

             

       
                                                                                              
                                                   
   
  
theorem multiplicative_and_distributive_laws (rational_data : IntegerAndPositiveNaturalData) :
    MultiplicativeAndDistributiveLaws rational_data := by
  sorry

                                                                     

             

       
                                                                
                                                        
                                                                     
                                                                   
   
  
def IsReciprocal (rational_data : IntegerAndPositiveNaturalData)
    (value reciprocal : Carrier rational_data) : Prop :=
  multiplication rational_data value reciprocal = one rational_data ∧
  multiplication rational_data reciprocal value = one rational_data


                                                                 

                             

             

       
                                                                                  
                                                                                  
                                         
                                                   
                                                                          
   
  
theorem reciprocal_exists_uniquely (rational_data : IntegerAndPositiveNaturalData)
    (value : Carrier rational_data) (value_nonzero : value ≠ zero rational_data) :
    ∃ reciprocal : Carrier rational_data,
      IsReciprocal rational_data value reciprocal ∧
      ∀ other, IsReciprocal rational_data value other → other = reciprocal := by
  sorry

                                         

             

       
                                                                         
                                                                                                           
                                                                                 
   
  
noncomputable def inverse (rational_data : IntegerAndPositiveNaturalData)
    (value : Carrier rational_data) (value_nonzero : value ≠ zero rational_data) : Carrier rational_data :=
  Classical.choose (reciprocal_exists_uniquely rational_data value value_nonzero)


                                         

                             

             

       
                                                                            
                                                                                  
                                                                                
   
  
theorem inverse_is_two_sided (rational_data : IntegerAndPositiveNaturalData)
    (value : Carrier rational_data) (value_nonzero : value ≠ zero rational_data) :
    IsReciprocal rational_data value (inverse rational_data value value_nonzero) := by
  sorry

                                               

             

       
                                                                            
                                   
                                                   
                                          
                                   
                                                                                           
   
  
def FieldStructure (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  AdditiveGroupLaws rational_data ∧
  MultiplicativeAndDistributiveLaws rational_data ∧
  zero rational_data ≠ one rational_data ∧
  (∀ value : Carrier rational_data,
    value ≠ zero rational_data → ∃ reciprocal, IsReciprocal rational_data value reciprocal)


                                             

                             

             

       
                                                                                                      
   
  
theorem field_structure (rational_data : IntegerAndPositiveNaturalData) : FieldStructure rational_data := by
  sorry

                                              

             

       
                                                                              
                                                                               
                                                
                                             
                                             
                                             
                                          
                    
                                                                                      
   
  
def StrictTotalOrder (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  (∀ value : Carrier rational_data, ¬ strict_order rational_data value value) ∧
  (∀ first second third : Carrier rational_data,
    strict_order rational_data first second →
    strict_order rational_data second third →
    strict_order rational_data first third) ∧
  (∀ first second : Carrier rational_data,
    first ≠ second →
    strict_order rational_data first second ∨ strict_order rational_data second first)


                                                               

                             

             

       
                                                                                                           
   
  
theorem strict_total_order (rational_data : IntegerAndPositiveNaturalData) : StrictTotalOrder rational_data := by
  sorry

                                                       

             

       
                                                                                       
                                                      
                                             
                              
                                                
                                                    
                                          
                                                           
                                                            
                                                                                                
   
  
def OrderedFieldCompatibility (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  (∀ first second translation : Carrier rational_data,
    strict_order rational_data first second →
    strict_order rational_data
      (addition rational_data first translation)
      (addition rational_data second translation)) ∧
  (∀ first second : Carrier rational_data,
    strict_order rational_data (zero rational_data) first →
    strict_order rational_data (zero rational_data) second →
    strict_order rational_data (zero rational_data) (multiplication rational_data first second))


                                                                                        

                             

             

       
                                                                                     
                                           
   
  
theorem ordered_field_compatibility (rational_data : IntegerAndPositiveNaturalData) :
    OrderedFieldCompatibility rational_data := by
  sorry

                                                   

             

       
                                                                                   
                                                                                                         
   
  
def OrderedFieldStructure (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  FieldStructure rational_data ∧ StrictTotalOrder rational_data ∧ OrderedFieldCompatibility rational_data


                                                     

                             

             

       
                                                                                                                     
   
  
theorem ordered_field_structure (rational_data : IntegerAndPositiveNaturalData) : OrderedFieldStructure rational_data := by
  sorry

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
