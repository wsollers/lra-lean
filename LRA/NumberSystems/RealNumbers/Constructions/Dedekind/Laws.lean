                                                                 
                                                                   
                                                              
                                                          
                                                                      
                                                

import LRA.NumberSystems.RealNumbers.Constructions.Dedekind.WellDefinedness

namespace LRA.NumberSystems.RealNumbers.Dedekind
open LRA.NumberSystems.Interface.ModelTheory

variable (rational_model : DenselyOrderedFieldModel)

                                                  

                                                                   


             

       
                                    
                                             
                                                                          
                                                                             
                                       
                                                                                  
                              
                                                             
                                                              
                              
                                                                                     
                                                                                    
   
  
def AdditiveGroupStructure : Prop :=
  (∀ first second third : Cut rational_model,
    addition rational_model (addition rational_model first second) third =
      addition rational_model first (addition rational_model second third)) ∧
  (∀ first second : Cut rational_model,
    addition rational_model first second = addition rational_model second first) ∧
  (∀ cut : Cut rational_model,
    addition rational_model (zero rational_model) cut = cut ∧
    addition rational_model cut (zero rational_model) = cut) ∧
  (∀ cut : Cut rational_model,
    addition rational_model cut (negation rational_model cut) = zero rational_model ∧
    addition rational_model (negation rational_model cut) cut = zero rational_model)


                                                               

                                                                                                          

                             


             

       
                                                                        
   
  
theorem additive_group_structure : AdditiveGroupStructure rational_model := by
  sorry

                                                                

                                                                              


             

       
                                               
                                             
                                                                                      
                                                                                         
                                       
                                                                                              
                              
                                                                  
                                                                   
                                             
                                                                                
                             
                                                    
                                                    
   
  
def MultiplicativeAndDistributiveLaws : Prop :=
  (∀ first second third : Cut rational_model,
    multiplication rational_model (multiplication rational_model first second) third =
      multiplication rational_model first (multiplication rational_model second third)) ∧
  (∀ first second : Cut rational_model,
    multiplication rational_model first second = multiplication rational_model second first) ∧
  (∀ cut : Cut rational_model,
    multiplication rational_model (one rational_model) cut = cut ∧
    multiplication rational_model cut (one rational_model) = cut) ∧
  (∀ first second third : Cut rational_model,
    multiplication rational_model first (addition rational_model second third) =
      addition rational_model
        (multiplication rational_model first second)
        (multiplication rational_model first third))


                                                      

                                                                                                                                 

                             


             

       
                                              
                                                    
   
  
theorem multiplicative_and_distributive_laws :
    MultiplicativeAndDistributiveLaws rational_model := by
  sorry

                                           

                                                           


             

       
                            
                                         
                                                    
                              
                               
                                                             
   
  
def FieldStructure : Prop :=
  AdditiveGroupStructure rational_model ∧
  MultiplicativeAndDistributiveLaws rational_model ∧
  (∀ cut : Cut rational_model,
    cut ≠ zero rational_model →
    ∃ reciprocal, IsReciprocal rational_model cut reciprocal)


                                             

                                                                                         

                             


             

       
                                                       
   
  
theorem field_structure : FieldStructure rational_model := by
  sorry

                                                        

                                                                                                                                                                                                                                                                                                    

                             


             

       
                              
                                                   
                                                                  
                               
                                                 
                                                  
   
  
theorem translation_invariance
    (first second translation : Cut rational_model)
    (first_lt_second : strict_order rational_model first second) :
    strict_order rational_model
      (addition rational_model first translation)
      (addition rational_model second translation) := by
  sorry

                                                

                                                                                                                                                                                                                                                                                             

                             


             

       
                                      
                                       
                                                      
                                                          
                             
                                                  
   
  
theorem positive_products_are_positive
    (first second : Cut rational_model)
    (first_positive : IsPositive rational_model first)
    (second_positive : IsPositive rational_model second) :
    IsPositive rational_model
      (multiplication rational_model first second) := by
  sorry

                                                   

                                                                  


             

       
                                   
                                 
                                   
                                                   
                                              
                               
                                                 
                                                     
                                       
                                     
                                      
                             
                                                   
   
  
def OrderedFieldStructure : Prop :=
  FieldStructure rational_model ∧
  StrictTotalOrder rational_model ∧
  (∀ first second translation : Cut rational_model,
    strict_order rational_model first second →
    strict_order rational_model
      (addition rational_model first translation)
      (addition rational_model second translation)) ∧
  (∀ first second : Cut rational_model,
    IsPositive rational_model first →
    IsPositive rational_model second →
    IsPositive rational_model
      (multiplication rational_model first second))


                                                     

                                                                                                        

                             


             

       
                                                                      
   
  
theorem ordered_field_structure : OrderedFieldStructure rational_model := by
  sorry

                                                          

                                                                    


             

       
                                     
                                       
                         
             
            
                                                                
               
             
                                                                   
               
               
                                                                  
                                                      
   
  
def LeastUpperBoundProperty : Prop :=
  ∀ family : Cut rational_model → Prop,
    (∃ cut, family cut) →
    (∃ upper,
      ∀ cut,
        family cut → nonstrict_order rational_model cut upper) →
    ∃ supremum,
      (∀ cut,
        family cut → nonstrict_order rational_model cut supremum) ∧
      (∀ upper,
        (∀ cut,
          family cut → nonstrict_order rational_model cut upper) →
        nonstrict_order rational_model supremum upper)


                                              

                                                                                                             

                             


             

       
                                                                           
   
  
theorem least_upper_bound_property : LeastUpperBoundProperty rational_model := by
  sorry

                                                            

                                                                          


             

       
                                           
                                                                               
   
  
def CompleteOrderedFieldStructure : Prop :=
  OrderedFieldStructure rational_model ∧ LeastUpperBoundProperty rational_model


                                                  

                                                                                                                         

                             


             

       
                                          
                                                
   
  
theorem complete_ordered_field_structure :
    CompleteOrderedFieldStructure rational_model := by
  sorry

end LRA.NumberSystems.RealNumbers.Dedekind
