                                                        
                                                      

import LRA.UniversalAlgebra.Quotient.RepresentativeCompatibility
import LRA.NumberSystems.Models
import LRA.NumberSystems.RationalNumbers.Constructions.RationalQuotientFractions

namespace LRA.NumberSystems.RealNumbers

open LRA.NumberSystems.Models

   
                                             
                                                             
                                             
                                                     

                                                                           
                                                                        
                                                                          
                                                                        
                                                                          
                                            

                                                                            
                                                                            
                               
  

end LRA.NumberSystems.RealNumbers
namespace LRA.NumberSystems.RealNumbers.DedekindCuts
open LRA.NumberSystems.Models


                                   

                                                                                                                                  


             

       
                                      
                                                                   
                                    
                                                       
                                                       
                   
                              
                             
                                            
                           
                           
                     
                                
                      
                                 
                                                 
   
  
structure Cut (RationalCarrier : Type)
    (strict_order : RationalCarrier → RationalCarrier → Prop) where
  lower_set : RationalCarrier → Prop
  nonempty : ∃ rational_value, lower_set rational_value
  proper : ∃ rational_value, ¬ lower_set rational_value
  downward_closed :
    ∀ upper_value lower_value,
      lower_set upper_value →
      strict_order lower_value upper_value →
      lower_set lower_value
  has_no_greatest_element :
    ∀ rational_value,
      lower_set rational_value →
      ∃ greater_value,
        lower_set greater_value ∧
        strict_order rational_value greater_value


                                              

                                                                                                                            

                             


             

       
                         
                                                                    
   
  
theorem real_model_exists
    (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel := by
  sorry

                                          

                                                                                                                      


             

       
                            
                                                              
                                                     
   
  
noncomputable def real_model
    (rational_model : DenselyOrderedFieldModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)


                                                  

                                                                                                                                                            

                             


             

       
                             
                                                 
                                                  
   
  
theorem real_extension_exists
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty (CofinalRealExtension rational_model) := by
  sorry

                                              

                                                                                                                                                    


             

       
                                
                                                 
                                          
                                                         
   
  
noncomputable def real_extension
    (rational_model : DenselyOrderedFieldModel) :
    CofinalRealExtension rational_model :=
  Classical.choice (real_extension_exists rational_model)

   
                                  

                                                                                                                                                                                                                                                                                                    


             

       
                          
                                                 
                                                                    
                                 
                     
                 
                         
                                                  
                                 
                 
                  
                         
                                                  
                              
                       
                    
                           
                                                    
                                   
                                                  
                                 
   
  
theorem reals_are_complete
    (rational_model : DenselyOrderedFieldModel) :
    ∀ subset : (real_model rational_model).signature.carrier → Prop,
      (∃ member, subset member) →
      (∃ upper_bound,
        ∀ member,
          subset member →
          (real_model rational_model).signature.le
            member upper_bound) →
      ∃ supremum,
        (∀ member,
          subset member →
          (real_model rational_model).signature.le
            member supremum) ∧
        (∀ upper_bound,
          (∀ member,
            subset member →
            (real_model rational_model).signature.le
              member upper_bound) →
          (real_model rational_model).signature.le
            supremum upper_bound) := by
  sorry

end LRA.NumberSystems.RealNumbers.DedekindCuts
namespace LRA.NumberSystems.RealNumbers
open LRA.NumberSystems.Models

end LRA.NumberSystems.RealNumbers
namespace LRA.NumberSystems.RealNumbers.CauchySequences
open LRA.NumberSystems.Models

   
                    

                                                                             


             

       
                                                                      
   
  
def Sequence (Index RationalCarrier : Type) := Index → RationalCarrier

   
                     

                                                                                                                                 


             

       
             
                                  
                                                         
                                     
                                                
   
  
def is_cauchy
    {Index RationalCarrier : Type}
    (sequence : Sequence Index RationalCarrier) : Prop :=
  ∀ first_index second_index : Index,
    sequence first_index = sequence second_index

   
                      

                                                                                                                                      


             

       
              
                                  
                                                             
                                             
   
  
def equivalent
    {Index RationalCarrier : Type}
    (first second : Sequence Index RationalCarrier) : Prop :=
  ∀ index : Index, first index = second index

   
                                                  

                                                                                                                                                             

                             


             

       
                                          
                                    
                                                   
   
  
theorem equivalent_is_equivalence_relation
    {Index RationalCarrier : Type} :
    Equivalence (@equivalent Index RationalCarrier) := by
  sorry

                                                     

                                                                                                                            

                             


             

       
                         
                                                                    
   
  
theorem real_model_exists
    (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel := by
  sorry

                                                 

                                                                                                                      


             

       
                            
                                                              
                                                     
   
  
noncomputable def real_model
    (rational_model : DenselyOrderedFieldModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)


                                                         

                                                                                                                                                            

                             


             

       
                             
                                                 
                                                  
   
  
theorem real_extension_exists
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty (CofinalRealExtension rational_model) := by
  sorry

                                                     

                                                                                                                                                    


             

       
                                
                                                 
                                          
                                                         
   
  
noncomputable def real_extension
    (rational_model : DenselyOrderedFieldModel) :
    CofinalRealExtension rational_model :=
  Classical.choice (real_extension_exists rational_model)

end LRA.NumberSystems.RealNumbers.CauchySequences
namespace LRA.NumberSystems.RealNumbers
open LRA.NumberSystems.Models

end LRA.NumberSystems.RealNumbers
namespace LRA.NumberSystems.RealNumbers.CantorNestedIntervals
open LRA.NumberSystems.Models

   
                                  

                                                                                           


             

       
                                                               
                                         
                                          
                  
                                
   
  
structure IntervalSequence (Index RationalCarrier : Type) where
  left_endpoint : Index → RationalCarrier
  right_endpoint : Index → RationalCarrier
  is_nested : Prop
  widths_converge_to_zero : Prop


                                                            

                                                                                                                            

                             


             

       
                         
                                                                    
   
  
theorem real_model_exists
    (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel := by
  sorry

                                                        

                                                                                                                      


             

       
                            
                                                              
                                                     
   
  
noncomputable def real_model
    (rational_model : DenselyOrderedFieldModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)

   
                                                         

                                                                                                                                                                                                                                                                                                                 

                             


             

       
                                                 
                                               
                                  
                                                                  
                              
                                     
                                     
   
  
theorem endpoint_sequences_determine_cauchy_class
    (rational_model : DenselyOrderedFieldModel)
    {Index RationalCarrier : Type}
    (interval_sequence : IntervalSequence Index RationalCarrier) :
    CauchySequences.equivalent
      interval_sequence.left_endpoint
      interval_sequence.left_endpoint := by
  sorry

end LRA.NumberSystems.RealNumbers.CantorNestedIntervals
namespace LRA.NumberSystems.RealNumbers
open LRA.NumberSystems.Models

end LRA.NumberSystems.RealNumbers
namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervalQuotient
open LRA.NumberSystems.Models

   
                                  

                                                                                                                                                  


             

       
                                                   
                                                                      
                                 
                                  
                         
                                                
   
  
structure RationalInterval (RationalCarrier : Type)
    (nonstrict_order : RationalCarrier → RationalCarrier → Prop) where
  left_endpoint : RationalCarrier
  right_endpoint : RationalCarrier
  endpoints_are_ordered :
    nonstrict_order left_endpoint right_endpoint

   
                      

                                                                                                                                 


             

       
              
                                    
                                                      
                
   
  
def equivalent
    {IntervalSequenceCarrier : Type}
    (first second : IntervalSequenceCarrier) : Prop :=
  first = second

   
                                                  

                                                                                                                                                                 

                             


             

       
                                          
                                      
                                                     
   
  
theorem equivalent_is_equivalence_relation
    {IntervalSequenceCarrier : Type} :
    Equivalence (@equivalent IntervalSequenceCarrier) := by
  sorry

   
                                                                  

                                                                                                                                                                                                                                                                                                      

                             


             

       
                                                          
                                    
                                             
                                    
                               
                               
                                
                                                           
                                          
   
  
theorem representative_multiplication_respects_equivalence
    {IntervalSequenceCarrier : Type}
    (setoid : Setoid IntervalSequenceCarrier)
    (representative_multiplication :
      IntervalSequenceCarrier →
      IntervalSequenceCarrier →
      IntervalSequenceCarrier) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      setoid representative_multiplication := by
  sorry

   
                                                               

                                                                                                                                                                                                                                                                                                      

                             


             

       
                                                       
                                    
                                    
                               
                               
                              
                              
                               
                               
                                
                           
                                   
               
                                                  
                               
                                                      
                                                     
   
  
theorem raw_interval_multiplication_is_not_distributive
    {IntervalSequenceCarrier : Type}
    (representative_multiplication :
      IntervalSequenceCarrier →
      IntervalSequenceCarrier →
      IntervalSequenceCarrier)
    (representative_addition :
      IntervalSequenceCarrier →
      IntervalSequenceCarrier →
      IntervalSequenceCarrier) :
    ¬ ∀ first second third,
      representative_multiplication
          first
          (representative_addition second third) =
        representative_addition
          (representative_multiplication first second)
          (representative_multiplication first third) := by
  sorry

   
                                                       

                                                                                                                                                                                                                                                                                                      

                             


             

       
                                               
                        
                                                                         
                         
                                                    
                                                                           
   
  
theorem quotient_multiplication_is_distributive
    {RealCarrier : Type}
    (multiplication addition : RealCarrier → RealCarrier → RealCarrier) :
    ∀ first second third,
      multiplication first (addition second third) =
        addition (multiplication first second) (multiplication first third) := by
  sorry

                                                                 

                                                                                                                            

                             


             

       
                         
                                                                    
   
  
theorem real_model_exists
    (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel := by
  sorry

                                                             

                                                                                                                      


             

       
                            
                                                              
                                                     
   
  
noncomputable def real_model
    (rational_model : DenselyOrderedFieldModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)

end LRA.NumberSystems.RealNumbers.PrimitiveIntervalQuotient
namespace LRA.NumberSystems.RealNumbers
open LRA.NumberSystems.Models

end LRA.NumberSystems.RealNumbers
namespace LRA.NumberSystems.RealNumbers.DyadicExpansions
open LRA.NumberSystems.Models

   
                           

                                                                    


             

       
                                        
                             
                                 
   
  
structure Expansion (Digit : Type) where
  integer_part : Digit → Prop
  fractional_digits : Nat → Digit

   
                      

                                                                                                       


             

       
              
                  
                                              
                                            
                                                      
   
  
def equivalent
    {Digit : Type}
    (first second : Expansion Digit) : Prop :=
  first.integer_part = second.integer_part ∧
    first.fractional_digits = second.fractional_digits

   
                                                  

                                                                                                                             

                             


             

       
                                          
                    
                                   
   
  
theorem equivalent_is_equivalence_relation
    {Digit : Type} :
    Equivalence (@equivalent Digit) := by
  sorry

                                                      

                                                                                                                            

                             


             

       
                         
                                                                    
   
  
theorem real_model_exists
    (rational_model : DenselyOrderedFieldModel) : Nonempty RealModel := by
  sorry

                                                  

                                                                                                                      


             

       
                            
                                                              
                                                     
   
  
noncomputable def real_model
    (rational_model : DenselyOrderedFieldModel) : RealModel :=
  Classical.choice (real_model_exists rational_model)

end LRA.NumberSystems.RealNumbers.DyadicExpansions
namespace LRA.NumberSystems.RealNumbers
open LRA.NumberSystems.Models

   
                                  

                                                                                                   


             

       
                          
                                                
               
                                   
                                    
                    
                                    
                                   
                
            
                                                  
                 
            
                                                  
                  
                                            
                                 
                 
                                           
                                
                      
                   
                 
                                                    
                                  
                             
                              
                            
                   
                 
                                                         
                                       
                             
                              
                                
                   
                               
                             
                                
                                             
   
  
structure ModelIsomorphism
    (first_model second_model : RealModel) where
  to_function :
    first_model.signature.carrier →
      second_model.signature.carrier
  inverse_function :
    second_model.signature.carrier →
      first_model.signature.carrier
  left_inverse :
    ∀ value,
      inverse_function (to_function value) = value
  right_inverse :
    ∀ value,
      to_function (inverse_function value) = value
  preserves_zero :
    to_function first_model.signature.zero =
      second_model.signature.zero
  preserves_one :
    to_function first_model.signature.one =
      second_model.signature.one
  preserves_addition :
    ∀ first second,
      to_function
          (first_model.signature.add first second) =
        second_model.signature.add
          (to_function first)
          (to_function second)
  preserves_multiplication :
    ∀ first second,
      to_function
          (first_model.signature.multiply first second) =
        second_model.signature.multiply
          (to_function first)
          (to_function second)
  preserves_and_reflects_order :
    ∀ first second,
      second_model.signature.le
          (to_function first)
          (to_function second) ↔
        first_model.signature.le first second

   
                                                                           

                                                                                                                                                                                                                                                                                                      

                             


             

       
                                                                   
                                            
                                                              
                                                                      
                
                                               
                                         
   
  
theorem complete_archimedean_ordered_fields_are_uniquely_isomorphic
    (first_model second_model : RealModel) :
    ∃ isomorphism : ModelIsomorphism first_model second_model,
      ∀ other_isomorphism : ModelIsomorphism first_model second_model,
        ∀ value,
          other_isomorphism.to_function value =
            isomorphism.to_function value := by
  sorry

                                                           

                                                                                                                                                                                                                                     

                             


             

       
                                    
                                                 
            
                       
                                                
                                                    
   
  
theorem dedekind_equiv_cauchy_exists
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CauchySequences.real_model rational_model)) := by
  sorry

   
                                 

                                                                                                                                                                                                                             


             

       
                                       
                                                 
                    
                                              
                                                    
                                                                
   
  
noncomputable def dedekind_equiv_cauchy
    (rational_model : DenselyOrderedFieldModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (CauchySequences.real_model rational_model) :=
  Classical.choice (dedekind_equiv_cauchy_exists rational_model)

   
                                                  

                                                                                                                                                                                                                                           


             

       
                                          
                                                 
            
                       
                                                
                                                    
   
  
theorem dedekind_and_cauchy_are_isomorphic
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CauchySequences.real_model rational_model)) := by
  sorry

                                                           

                                                                                                                                                                                                                                           

                             


             

       
                                    
                                                 
            
                       
                                                
                                                          
   
  
theorem dedekind_equiv_cantor_exists
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CantorNestedIntervals.real_model rational_model)) := by
  sorry

   
                                 

                                                                                                                                                                                                                                   


             

       
                                       
                                                 
                    
                                              
                                                          
                                                                
   
  
noncomputable def dedekind_equiv_cantor
    (rational_model : DenselyOrderedFieldModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (CantorNestedIntervals.real_model rational_model) :=
  Classical.choice (dedekind_equiv_cantor_exists rational_model)

   
                                                  

                                                                                                                                                                                                                                                 


             

       
                                          
                                                 
            
                       
                                                
                                                          
   
  
theorem dedekind_and_cantor_are_isomorphic
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (CantorNestedIntervals.real_model rational_model)) := by
  sorry

                                                                      

                                                                                                                                                                                                                                                          

                             


             

       
                                               
                                                 
            
                       
                                                
                                                              
   
  
theorem dedekind_equiv_interval_quotient_exists
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (PrimitiveIntervalQuotient.real_model rational_model)) := by
  sorry

   
                                            

                                                                                                                                                                                                                                                  


             

       
                                                  
                                                 
                    
                                              
                                                              
                                                                           
   
  
noncomputable def dedekind_equiv_interval_quotient
    (rational_model : DenselyOrderedFieldModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (PrimitiveIntervalQuotient.real_model rational_model) :=
  Classical.choice (dedekind_equiv_interval_quotient_exists rational_model)

   
                                                             

                                                                                                                                                                                                                                                                


             

       
                                                     
                                                 
            
                       
                                                
                                                              
   
  
theorem dedekind_and_interval_quotient_are_isomorphic
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (PrimitiveIntervalQuotient.real_model rational_model)) := by
  sorry

                                                           

                                                                                                                                                                                                                                      

                             


             

       
                                    
                                                 
            
                       
                                                
                                                     
   
  
theorem dedekind_equiv_dyadic_exists
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (DyadicExpansions.real_model rational_model)) := by
  sorry

   
                                 

                                                                                                                                                                                                                              


             

       
                                       
                                                 
                    
                                              
                                                     
                                                                
   
  
noncomputable def dedekind_equiv_dyadic
    (rational_model : DenselyOrderedFieldModel) :
    ModelIsomorphism
      (DedekindCuts.real_model rational_model)
      (DyadicExpansions.real_model rational_model) :=
  Classical.choice (dedekind_equiv_dyadic_exists rational_model)

   
                                                  

                                                                                                                                                                                                                                            


             

       
                                          
                                                 
            
                       
                                                
                                                     
   
  
theorem dedekind_and_dyadic_are_isomorphic
    (rational_model : DenselyOrderedFieldModel) :
    Nonempty
      (ModelIsomorphism
        (DedekindCuts.real_model rational_model)
        (DyadicExpansions.real_model rational_model)) := by
  sorry

end LRA.NumberSystems.RealNumbers
