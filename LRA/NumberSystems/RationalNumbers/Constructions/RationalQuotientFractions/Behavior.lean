                                                                                          
                                                                         
                                                                          
                                                                        
                                                             

import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions.Laws

namespace LRA.NumberSystems.RationalNumbers.RationalQuotientFractions

                                                                

             

       
                                                                          
                                                                                                       
                    
                                  
   
  
def integer_representative (rational_data : IntegerAndPositiveNaturalData)
    (value : rational_data.integer_system.Model.signature.carrier) : Representative rational_data where
  numerator := value
  denominator := rational_data.one


                                                

             

       
                                                                     
                                                                                             
                                                            
   
  
def integer_embedding (rational_data : IntegerAndPositiveNaturalData)
    (value : rational_data.integer_system.Model.signature.carrier) : Carrier rational_data :=
  Quotient.mk _ (integer_representative rational_data value)

                                                      

             

       
                                                                                  
                                 
                                                     
                                                      
                                                       
   
  
def two (rational_data : IntegerAndPositiveNaturalData) : Carrier rational_data :=
  integer_embedding rational_data
    (rational_data.integer_system.Model.signature.add
      rational_data.integer_system.Model.signature.one
      rational_data.integer_system.Model.signature.one)


                                                                                     

                             

             

       
                                                                                      
                    
                                                                                                        
                                                                                                            
                                                                                                          
                    
                                     
                                                                           
                                                                                                                  
                    
                                     
                                                                                
                                                                                                                        
                    
                                                                                                                   
                                                                              
   
  
theorem integer_embedding_properties (rational_data : IntegerAndPositiveNaturalData) :
    (∀ first second,
      integer_embedding rational_data first = integer_embedding rational_data second → first = second) ∧
    integer_embedding rational_data rational_data.integer_system.Model.signature.zero = zero rational_data ∧
    integer_embedding rational_data rational_data.integer_system.Model.signature.one = one rational_data ∧
    (∀ first second,
      integer_embedding rational_data
          (rational_data.integer_system.Model.signature.add first second) =
        addition rational_data (integer_embedding rational_data first) (integer_embedding rational_data second)) ∧
    (∀ first second,
      integer_embedding rational_data
          (rational_data.integer_system.Model.signature.multiply first second) =
        multiplication rational_data (integer_embedding rational_data first) (integer_embedding rational_data second)) ∧
    (∀ first second,
      strict_order rational_data (integer_embedding rational_data first) (integer_embedding rational_data second) ↔
        rational_data.integer_system.Model.signature.StrictOrder first second) := by
  sorry

                                                                  

                                                                           
                                                                           
                                                  

             

       
             
                                                            
                                                                                             
                   
                                                                 
                                                    
   
  
def IsReduced
    (rational_data : IntegerAndPositiveNaturalReductionData)
    (representative : Representative rational_data.toIntegerAndPositiveNaturalData) : Prop :=
  rational_data.gcd
      (rational_data.absolute_numerator representative.numerator)
      representative.denominator = rational_data.one


                                                             

                             

             

       
                                     
                                                            
                                                                     
                                                                                    
                                                                                   
   
  
theorem reduced_representative_exists
    (rational_data : IntegerAndPositiveNaturalReductionData)
    (value : Carrier rational_data.toIntegerAndPositiveNaturalData) :
    ∃ representative : Representative rational_data.toIntegerAndPositiveNaturalData,
      IsReduced rational_data representative ∧ Quotient.mk _ representative = value := by
  sorry

                                                    

                             

             

       
                                     
                                                            
                                                                                 
                                                   
                                                     
                 
                 
                                                                                       
                   
                                                                                         
                                        
                                          
   
  
theorem reduced_representative_unique
    (rational_data : IntegerAndPositiveNaturalReductionData)
    (first second : Representative rational_data.toIntegerAndPositiveNaturalData)
    (first_reduced : IsReduced rational_data first)
    (second_reduced : IsReduced rational_data second)
    (same_value :
      Quotient.mk
          (representative_setoid rational_data.toIntegerAndPositiveNaturalData) first =
        Quotient.mk
          (representative_setoid rational_data.toIntegerAndPositiveNaturalData) second) :
    first.numerator = second.numerator ∧
    first.denominator = second.denominator := by
  sorry

                                                                

                             

             

       
                               
                                                            
                                                                     
                                                                                    
                                              
                                            
                                                                             
                                       
                                     
                                                    
                                                      
   
  
theorem unique_lowest_term_form
    (rational_data : IntegerAndPositiveNaturalReductionData)
    (value : Carrier rational_data.toIntegerAndPositiveNaturalData) :
    ∃ representative : Representative rational_data.toIntegerAndPositiveNaturalData,
      IsReduced rational_data representative ∧
      Quotient.mk _ representative = value ∧
      ∀ other : Representative rational_data.toIntegerAndPositiveNaturalData,
        IsReduced rational_data other →
        Quotient.mk _ other = value →
        other.numerator = representative.numerator ∧
        other.denominator = representative.denominator := by
  sorry

                                                

                             

             

       
                                                               
                                          
                                                                 
             
                                                                                        
   
  
theorem density (rational_data : IntegerAndPositiveNaturalData)
    (first second : Carrier rational_data)
    (first_lt_second : strict_order rational_data first second) :
    ∃ middle,
      strict_order rational_data first middle ∧ strict_order rational_data middle second := by
  sorry

                                                             

                             

             

       
                                                                                                              
                                              
                                      
                                                                            
   
  
theorem archimedean_property (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) :
    ∃ natural : rational_data.natural_carrier,
      strict_order rational_data value
        (integer_embedding rational_data (rational_data.to_integer natural)) := by
  sorry

                                       

                             

             

       
                                                                                                             
                                                                     
                                                                                     
                                      
                                        
                                                           
                                                                      
   
  
theorem integer_part_bounds (rational_data : IntegerAndPositiveNaturalData) (value : Carrier rational_data) :
    ∃ integer : rational_data.integer_system.Model.signature.carrier,
      nonstrict_order rational_data (integer_embedding rational_data integer) value ∧
      strict_order rational_data value
        (integer_embedding rational_data
          (rational_data.integer_system.Model.signature.add
            integer rational_data.integer_system.Model.signature.one)) := by
  sorry

                                                         

             

       
                                                                         
                                   
              
                                                           
                              
                                                
                         
   
  
def square_root_two_cut (rational_data : IntegerAndPositiveNaturalData) :
    Carrier rational_data → Prop :=
  fun value =>
    strict_order rational_data value (zero rational_data) ∨
    strict_order rational_data
      (multiplication rational_data value value)
      (two rational_data)


                                                                            

                             

             

       
                                                                                               
                                                        
             
              
                                                 
                                                  
   
  
theorem square_root_two_cut_nonempty_bounded (rational_data : IntegerAndPositiveNaturalData) :
    (∃ value, square_root_two_cut rational_data value) ∧
    (∃ upper,
      ∀ value,
        square_root_two_cut rational_data value →
        nonstrict_order rational_data value upper) := by
  sorry

                                            

                             

             

       
                                                                                      
                                                                           
   
  
theorem no_rational_square_root_two (rational_data : IntegerAndPositiveNaturalData) :
    ¬ ∃ value, multiplication rational_data value value = two rational_data := by
  sorry

                                                              

                             

             

       
                                                                                           
                   
               
                                                 
                                                       
               
                 
                                                   
                                                      
                                                     
   
  
theorem square_root_two_cut_has_no_supremum (rational_data : IntegerAndPositiveNaturalData)
    : ¬ ∃ supremum,
      (∀ value,
        square_root_two_cut rational_data value →
        nonstrict_order rational_data value supremum) ∧
      (∀ upper,
        (∀ value,
          square_root_two_cut rational_data value →
          nonstrict_order rational_data value upper) →
        nonstrict_order rational_data supremum upper) := by
  sorry

                                                         

             

       
                                                                              
                                          
                             
             
                                                                          
                 
                                                                              
               
                                                                             
                                                     
   
  
def NotOrderComplete (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  ∃ subset : Carrier rational_data → Prop,
    (∃ value, subset value) ∧
    (∃ upper,
      ∀ value, subset value → nonstrict_order rational_data value upper) ∧
    ¬ ∃ supremum,
      (∀ value, subset value → nonstrict_order rational_data value supremum) ∧
      (∀ upper,
        (∀ value, subset value → nonstrict_order rational_data value upper) →
        nonstrict_order rational_data supremum upper)


                                                        

                             

             

       
                                                                                                           
   
  
theorem not_order_complete (rational_data : IntegerAndPositiveNaturalData) : NotOrderComplete rational_data := by
  sorry

                                                        

             

       
                                                                                     
                                       
                                          
                                             
             
                                                                                           
                                
   
  
def StructureOfTheRationals (rational_data : IntegerAndPositiveNaturalData) : Prop :=
  OrderedFieldStructure rational_data ∧
  (∀ first second : Carrier rational_data,
    strict_order rational_data first second →
    ∃ middle,
      strict_order rational_data first middle ∧ strict_order rational_data middle second) ∧
  NotOrderComplete rational_data


                                          

                             

             

       
                                                                                    
                                         
   
  
theorem structure_of_the_rationals (rational_data : IntegerAndPositiveNaturalData) :
    StructureOfTheRationals rational_data := by
  sorry

end LRA.NumberSystems.RationalNumbers.RationalQuotientFractions
