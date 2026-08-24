                                                                           
                                                                           
                                                                           
                                                                        
                                                                          
                                                                           
                                  

import LRA.NumberSystems.RealNumbers.Constructions.PrimitiveIntervals.WellDefinedness

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals
open LRA.NumberSystems.Interface.ModelTheory

variable (rational_model : DenselyOrderedFieldModel)

                                              

                                                             


             

       
                              
                                    
                                                
                                                 
                                              
                                              
                                              
                                           
                    
                                              
                                             
   
  
def StrictTotalOrder : Prop :=
  (∀ value : Carrier rational_model,
    ¬ strict_order rational_model value value) ∧
  (∀ first second third : Carrier rational_model,
    strict_order rational_model first second →
    strict_order rational_model second third →
    strict_order rational_model first third) ∧
  (∀ first second : Carrier rational_model,
    first ≠ second →
    strict_order rational_model first second ∨
    strict_order rational_model second first)


                                                            

                                                                                              

                             


             

       
                                                            
   
  
theorem strict_total_order : StrictTotalOrder rational_model := by
  sorry

                                               

                                                               


             

       
                                
                                                       
                                              
                               
                                                 
                                                     
                                                    
                                              
                                                                
                               
                                                    
                                                      
   
  
def OrderCompatibility : Prop :=
  (∀ first second translation : Carrier rational_model,
    strict_order rational_model first second →
    strict_order rational_model
      (addition rational_model first translation)
      (addition rational_model second translation)) ∧
  (∀ first second positive : Carrier rational_model,
    strict_order rational_model first second →
    strict_order rational_model (zero rational_model) positive →
    strict_order rational_model
      (multiplication rational_model first positive)
      (multiplication rational_model second positive))


                                                                               

                                                                                                 

                             


             

       
                                                               
   
  
theorem order_compatibility : OrderCompatibility rational_model := by
  sorry

                                                

                                                                                                                                                                                                                                                                                                      

                             


             

       
                                      
                                                            
                         
                                                   
                                                        
                                       
                                                             
                                                             
   
  
theorem raw_interval_subdistributivity
    (first second third : RationalInterval rational_model) :
    subset rational_model
      (interval_multiplication rational_model first
        (interval_addition rational_model second third))
      (interval_addition rational_model
        (interval_multiplication rational_model first second)
        (interval_multiplication rational_model first third)) := by
  sorry

                                                               

                                                                                                                                                                                                                                                                                                      

                             


             

       
                                              
                                                           
                           
                                                     
                                                          
                                         
                                                               
                                                                 
                             
                                         
                                                               
                                                               
                                                     
                                                          
   
  
theorem raw_interval_distributivity_can_fail :
    ∃ first second third : RationalInterval rational_model,
      subset rational_model
        (interval_multiplication rational_model first
          (interval_addition rational_model second third))
        (interval_addition rational_model
          (interval_multiplication rational_model first second)
          (interval_multiplication rational_model first third)) ∧
      ¬ subset rational_model
        (interval_addition rational_model
          (interval_multiplication rational_model first second)
          (interval_multiplication rational_model first third))
        (interval_multiplication rational_model first
          (interval_addition rational_model second third)) := by
  sorry

                                                                                

                                                                                                                                                                                                                                                                                                      

                             


             

       
                                    
                                                          
                             
                                                         
                                                              
                                             
                                                                   
                                                                   
   
  
theorem distributive_defect_vanishes
    (first second third : Representative rational_model) :
    equivalent rational_model
      (representative_multiplication rational_model first
        (representative_addition rational_model second third))
      (representative_addition rational_model
        (representative_multiplication rational_model first second)
        (representative_multiplication rational_model first third)) := by
  sorry

                                                        

                                                                                                                                                                                                                                                                                                     

                             


             

       
                               
                                                   
                                       
                                                
                             
                                                    
                                                   
   
  
theorem quotient_distributivity
    (first second third : Carrier rational_model) :
    multiplication rational_model first
        (addition rational_model second third) =
      addition rational_model
        (multiplication rational_model first second)
        (multiplication rational_model first third) := by
  sorry

                                                                                    

                                                                                                                                                                                                                                                                                                      

                             


             

       
                                              
                                    
                                                   
                                                     
                                            
              
                                            
                                               
                      
                  
                               
                                             
                                                              
                      
                  
                               
                                       
                                                            
                                                    
   
  
theorem nonzero_eventually_separated_from_zero
    (value : Carrier rational_model)
    (value_nonzero : value ≠ zero rational_model) :
    ∃ representative : Representative rational_model,
      Quotient.mk _ representative = value ∧
      ∃ delta,
        rational_model.signature.StrictOrder
          rational_model.signature.zero delta ∧
        ((∃ threshold,
          ∀ index,
            threshold ≤ index →
            rational_model.signature.le delta
              (representative.interval index).left_endpoint) ∨
         (∃ threshold,
          ∀ index,
            threshold ≤ index →
            rational_model.signature.le
              (representative.interval index).right_endpoint
              (rational_model.signature.neg delta))) := by
  sorry

                                                                     

                                                                                                                         


             

       
                        
                                                                     
                                                                    
                            
                                                            
                             
                                                         
   
  
def IsReciprocalInterval
    (interval reciprocal : RationalInterval rational_model) : Prop :=
  ¬ contains rational_model interval rational_model.signature.zero ∧
  reciprocal.left_endpoint =
      rational_model.signature.inv interval.right_endpoint ∧
  reciprocal.right_endpoint =
      rational_model.signature.inv interval.left_endpoint


                                                                             

                                                                                                                                                                                                                                                                                                     

                             


             

       
                                  
                                    
                                                   
                    
                                                                              
              
                                                                        
                             
   
  
theorem reciprocal_exists_uniquely
    (value : Carrier rational_model)
    (value_nonzero : value ≠ zero rational_model) :
    ∃ inverse_value,
      multiplication rational_model value inverse_value = one rational_model ∧
      ∀ other,
        multiplication rational_model value other = one rational_model →
        other = inverse_value := by
  sorry

                                                              

                                                                                                                                                                   


             

       
                         
                                    
                                                                             
                  
                                                                   
   
  
noncomputable def inverse
    (value : Carrier rational_model)
    (value_nonzero : value ≠ zero rational_model) : Carrier rational_model :=
  Classical.choose
    (reciprocal_exists_uniquely rational_model value value_nonzero)


                                                          

                                                                    


             

       
                                     
                                            
                                
                   
               
                        
                                                           
               
                
                        
                                                        
                     
                  
                          
                                                             
                                                           
   
  
def LeastUpperBoundProperty : Prop :=
  ∀ members : Carrier rational_model → Prop,
    (∃ member, members member) →
    (∃ upper_bound,
      ∀ member,
        members member →
        ¬ strict_order rational_model upper_bound member) →
    ∃ supremum,
      (∀ member,
        members member →
        ¬ strict_order rational_model supremum member) ∧
      (∀ upper_bound,
        (∀ member,
          members member →
          ¬ strict_order rational_model upper_bound member) →
        ¬ strict_order rational_model upper_bound supremum)


                                                                

                                                                                                             

                             


             

       
                                                                           
   
  
theorem least_upper_bound_property : LeastUpperBoundProperty rational_model := by
  sorry

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
