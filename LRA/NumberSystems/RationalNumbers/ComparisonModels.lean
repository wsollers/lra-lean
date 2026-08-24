                                                          
                                                          

import LRA.UniversalAlgebra.Quotient.RepresentativeCompatibility
import LRA.NumberSystems.Interface.ModelTheory.Model

namespace LRA.NumberSystems.RationalNumbers

open LRA.NumberSystems.Interface.ModelTheory

   
                                                 
                                                               
                                                 
                                                     

                                                                   
                                                                     
                                                                        
                                                                
                                                                      
                                                                                    
                                                           
                                                                     
                 
  

   
                                                         

                                                                               
                           

             

       
                                                                           
                                                     
                               
                   
               
                       
                                                         
               
                
                       
                                                      
                     
                  
                         
                                                           
                                                         
   
  
def is_order_complete (rational_model : DenselyOrderedFieldModel) : Prop :=
  ∀ subset : rational_model.signature.carrier → Prop,
    (∃ member, subset member) →
    (∃ upper_bound,
      ∀ member,
        subset member →
        rational_model.signature.le member upper_bound) →
    ∃ supremum,
      (∀ member,
        subset member →
        rational_model.signature.le member supremum) ∧
      (∀ upper_bound,
        (∀ member,
          subset member →
          rational_model.signature.le member upper_bound) →
        rational_model.signature.le supremum upper_bound)

end LRA.NumberSystems.RationalNumbers
namespace LRA.NumberSystems.RationalNumbers.QuotientFractionsComparison
open LRA.NumberSystems.Interface.ModelTheory

   
                                                             

                                                                               
                                                                    

             

       
                        
                                                
                            
                              
   
  
structure Representative
    (IntegerCarrier NaturalCarrier : Type) where
  numerator : IntegerCarrier
  denominator : NaturalCarrier


                                                           

             

       
              
                                          
                             
                                                       
                                                          
                                                                           
                        
                     
                                               
                          
                      
                                            
   
  
def equivalent
    {IntegerCarrier NaturalCarrier : Type}
    (integer_multiplication :
      IntegerCarrier → IntegerCarrier → IntegerCarrier)
    (natural_to_integer : NaturalCarrier → IntegerCarrier)
    (first second : Representative IntegerCarrier NaturalCarrier) : Prop :=
  integer_multiplication
      first.numerator
      (natural_to_integer second.denominator) =
    integer_multiplication
      second.numerator
      (natural_to_integer first.denominator)


                                                                          

                             

             

       
                                          
                                          
                             
                                                       
                                                            
               
                                                            
   
  
theorem equivalent_is_equivalence_relation
    {IntegerCarrier NaturalCarrier : Type}
    (integer_multiplication :
      IntegerCarrier → IntegerCarrier → IntegerCarrier)
    (natural_to_integer : NaturalCarrier → IntegerCarrier) :
    Equivalence
      (equivalent integer_multiplication natural_to_integer) := by
  sorry

                                                                           

                             

             

       
                                                    
                                  
                                           
                              
                             
                             
                              
                                                           
                                    
   
  
theorem representative_addition_respects_equivalence
    {RepresentativeCarrier : Type}
    (setoid : Setoid RepresentativeCarrier)
    (representative_addition :
      RepresentativeCarrier →
      RepresentativeCarrier →
      RepresentativeCarrier) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      setoid representative_addition := by
  sorry

                                                                                 

                             

             

       
                                                          
                                  
                                           
                                    
                             
                             
                              
                                                           
                                          
   
  
theorem representative_multiplication_respects_equivalence
    {RepresentativeCarrier : Type}
    (setoid : Setoid RepresentativeCarrier)
    (representative_multiplication :
      RepresentativeCarrier →
      RepresentativeCarrier →
      RepresentativeCarrier) :
    LRA.UniversalAlgebra.Quotient.binary_operation_respects
      setoid representative_multiplication := by
  sorry

                                                            

                             

             

       
                             
                                                                                              
   
  
theorem rational_model_exists
    (integer_model : DiscretelyOrderedIntegralDomainModel) : Nonempty DenselyOrderedFieldModel := by
  sorry

                                                        

             

       
                                
                                                                                        
                                                        
   
  
noncomputable def rational_model
    (integer_model : DiscretelyOrderedIntegralDomainModel) : DenselyOrderedFieldModel :=
  Classical.choice (rational_model_exists integer_model)


                                                                

                             

             

       
                                 
                                                            
                                                                  
   
  
theorem rational_extension_exists
    (integer_model : DiscretelyOrderedIntegralDomainModel) :
    Nonempty (ArchimedeanDenseOrderedFieldExtension integer_model) := by
  sorry

                                                            

             

       
                                    
                                                            
                                                          
                                                            
   
  
noncomputable def rational_extension
    (integer_model : DiscretelyOrderedIntegralDomainModel) :
    ArchimedeanDenseOrderedFieldExtension integer_model :=
  Classical.choice (rational_extension_exists integer_model)


                                                                          

                             

             

       
                             
                                                            
                                                                      
   
  
theorem is_not_order_complete
    (integer_model : DiscretelyOrderedIntegralDomainModel) :
    ¬ RationalNumbers.is_order_complete (rational_model integer_model) := by
  sorry

end LRA.NumberSystems.RationalNumbers.QuotientFractionsComparison
namespace LRA.NumberSystems.RationalNumbers
open LRA.NumberSystems.Interface.ModelTheory

end LRA.NumberSystems.RationalNumbers
namespace LRA.NumberSystems.RationalNumbers.Reduced
open LRA.NumberSystems.Interface.ModelTheory


                                                      

             

       
                        
                                                
                            
                              
                   
   
  
structure Representative
    (IntegerCarrier NaturalCarrier : Type) where
  numerator : IntegerCarrier
  denominator : NaturalCarrier
  is_reduced : Prop


                                                          

                             

             

       
                             
                                                                                              
   
  
theorem rational_model_exists
    (integer_model : DiscretelyOrderedIntegralDomainModel) : Nonempty DenselyOrderedFieldModel := by
  sorry

                                                      

             

       
                                
                                                                                        
                                                        
   
  
noncomputable def rational_model
    (integer_model : DiscretelyOrderedIntegralDomainModel) : DenselyOrderedFieldModel :=
  Classical.choice (rational_model_exists integer_model)

end LRA.NumberSystems.RationalNumbers.Reduced
namespace LRA.NumberSystems.RationalNumbers
open LRA.NumberSystems.Interface.ModelTheory

end LRA.NumberSystems.RationalNumbers
namespace LRA.NumberSystems.RationalNumbers.FractionField
open LRA.NumberSystems.Interface.ModelTheory

   
                                                      

                                                                         
                     

             

       
                                               
                                                      
   
  
structure IntegralDomainFractionFieldData where
  integer_model : DiscretelyOrderedIntegralDomainModel


                                                        

                             

             

       
                             
                                                             
                                     
   
  
theorem rational_model_exists
    (fraction_field_data : IntegralDomainFractionFieldData) :
    Nonempty DenselyOrderedFieldModel := by
  sorry

                                                    

             

       
                                
                                                             
                               
                                                              
   
  
noncomputable def rational_model
    (fraction_field_data : IntegralDomainFractionFieldData) :
    DenselyOrderedFieldModel :=
  Classical.choice (rational_model_exists fraction_field_data)

end LRA.NumberSystems.RationalNumbers.FractionField
namespace LRA.NumberSystems.RationalNumbers
open LRA.NumberSystems.Interface.ModelTheory


                                                      

             

       
                          
                                                               
               
                                   
                                    
                    
                                    
                                   
                
            
                                                  
                 
            
                                                  
                  
                                            
                                 
                 
                                           
                                
                      
                   
                 
                                                    
                                  
                             
                              
                            
                   
                 
                                                         
                                       
                             
                              
                     
            
                 
                                             
                                                      
                                
                   
                               
                             
                                
                                             
   
  
structure ModelIsomorphism
    (first_model second_model : DenselyOrderedFieldModel) where
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
  preserves_inverse :
    ∀ value,
      to_function
          (first_model.signature.inv value) =
        second_model.signature.inv (to_function value)
  preserves_and_reflects_order :
    ∀ first second,
      second_model.signature.le
          (to_function first)
          (to_function second) ↔
        first_model.signature.le first second


                                                                                   

                             

             

       
                                                        
                                                            
            
                       
                                                                  
                                               
   
  
theorem rational_quotient_fractions_equiv_reduced_exists
    (integer_model : DiscretelyOrderedIntegralDomainModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (Reduced.rational_model integer_model)) := by
  sorry

                                                                               

             

       
                                                           
                                                            
                    
                                                                
                                               
                                                                                   
   
  
noncomputable def rational_quotient_fractions_equiv_reduced
    (integer_model : DiscretelyOrderedIntegralDomainModel) :
    ModelIsomorphism
      (QuotientFractionsComparison.rational_model integer_model)
      (Reduced.rational_model integer_model) :=
  Classical.choice (rational_quotient_fractions_equiv_reduced_exists integer_model)


                                                                                    

             

       
                                                              
                                                            
            
                       
                                                                  
                                               
   
  
theorem rational_quotient_fractions_and_reduced_are_isomorphic
    (integer_model : DiscretelyOrderedIntegralDomainModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (Reduced.rational_model integer_model)) := by
  sorry

                                                                                          

                             

             

       
                                                               
                                                            
            
                       
                                                                  
                                                       
   
  
theorem rational_quotient_fractions_equiv_fraction_field_exists
    (integer_model : DiscretelyOrderedIntegralDomainModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (FractionField.rational_model ⟨integer_model⟩)) := by
  sorry

                                                                                      

             

       
                                                                  
                                                            
                    
                                                                
                                                       
                                                                                          
   
  
noncomputable def rational_quotient_fractions_equiv_fraction_field
    (integer_model : DiscretelyOrderedIntegralDomainModel) :
    ModelIsomorphism
      (QuotientFractionsComparison.rational_model integer_model)
      (FractionField.rational_model ⟨integer_model⟩) :=
  Classical.choice (rational_quotient_fractions_equiv_fraction_field_exists integer_model)


                                                                                           

             

       
                                                                     
                                                            
            
                       
                                                                  
                                                       
   
  
theorem rational_quotient_fractions_and_fraction_field_are_isomorphic
    (integer_model : DiscretelyOrderedIntegralDomainModel) :
    Nonempty
      (ModelIsomorphism
        (QuotientFractionsComparison.rational_model integer_model)
        (FractionField.rational_model ⟨integer_model⟩)) := by
  sorry

end LRA.NumberSystems.RationalNumbers
