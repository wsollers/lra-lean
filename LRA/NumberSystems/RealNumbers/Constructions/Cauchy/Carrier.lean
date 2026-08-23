                                                                  
                                                                          
                                                                       
                            

import LRA.UniversalAlgebra.Quotient.RepresentativeCompatibility
import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.Models

namespace LRA.NumberSystems.RealNumbers.Cauchy

open LRA.NumberSystems.Models
open LRA.NumberSystems.RationalNumbers

   
                                                 
                                            
                                                         

                                                                          
                                                                 
                                                                          
                                                         
  


                                                                       
                          

                                                                                                      


             

       
                                                                          
                  
                                                 
                                                 
                       
                                                             
                                              
                           
            
                                                                      
                            
                       
                   
                                            
                       
                                                                 
                                                
                                
                                  
                              
            
                                            
                                                
                              
                              
            
                                                                       
                                                        
                                 
                   
                    
                                                                     
                                                      
                                  
                                   
                              
            
                                    
                              
                                                       
                 
              
                                                     
                                                          
                
                                                       
                                                            
                                              
                                                                   
                 
   
  
structure RationalMetricData (rationalSystem : RationalNumberSystem) where
  absolute_value :
    rationalSystem.FieldModel.signature.carrier →
      rationalSystem.FieldModel.signature.carrier
  absolute_value_zero :
    absolute_value rationalSystem.FieldModel.signature.zero =
      rationalSystem.FieldModel.signature.zero
  absolute_value_negation :
    ∀ value,
      absolute_value (rationalSystem.FieldModel.signature.neg value) =
        absolute_value value
  triangle_inequality :
    ∀ first second,
      rationalSystem.FieldModel.signature.le
        (absolute_value
          (rationalSystem.FieldModel.signature.add first second))
        (rationalSystem.FieldModel.signature.add
          (absolute_value first)
          (absolute_value second))
  absolute_value_nonnegative :
    ∀ value,
      rationalSystem.FieldModel.signature.le
        rationalSystem.FieldModel.signature.zero
        (absolute_value value)
  absolute_value_eq_zero_iff :
    ∀ value,
      absolute_value value = rationalSystem.FieldModel.signature.zero ↔
        value = rationalSystem.FieldModel.signature.zero
  absolute_value_multiplication :
    ∀ first second,
      absolute_value
        (rationalSystem.FieldModel.signature.multiply first second) =
          rationalSystem.FieldModel.signature.multiply
            (absolute_value first)
            (absolute_value second)
  absolute_value_self_or_neg :
    ∀ value,
      absolute_value value = value ∨
        absolute_value value =
          rationalSystem.FieldModel.signature.neg value
  epsilon_split :
    ∀ epsilon,
      rationalSystem.FieldModel.signature.StrictOrder
        rationalSystem.FieldModel.signature.zero epsilon →
      ∃ smaller,
        rationalSystem.FieldModel.signature.StrictOrder
          rationalSystem.FieldModel.signature.zero smaller ∧
        rationalSystem.FieldModel.signature.le
          (rationalSystem.FieldModel.signature.add smaller smaller)
          epsilon


                                                                                       

                                                                                         


             

       
                                                          
                                                   
   
  
abbrev Sequence (rationalSystem : RationalNumberSystem) :=
  Nat → rationalSystem.FieldModel.signature.carrier


                                                                    

                                                                                                                                                                                                                                                           


             

       
            
                                           
                                                             
                                                                  
                                                  
                                    
                                                                  
   
  
def distance
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : rationalSystem.FieldModel.signature.carrier) :
    rationalSystem.FieldModel.signature.carrier :=
  absolute_value_data.absolute_value
    (rationalSystem.FieldModel.signature.Subtraction first second)


                                                                        

                                                                                                                                                      


             

       
               
                                           
                                                                   
                                                 
                                                  
   
  
def is_positive
    (rationalSystem : RationalNumberSystem)
    (value : rationalSystem.FieldModel.signature.carrier) : Prop :=
  rationalSystem.FieldModel.signature.StrictOrder
    rationalSystem.FieldModel.signature.zero value


                                                              

                                                                                                                                                                                             


             

       
             
                                           
                                                             
                                                  
            
                                        
                      
                                       
                                 
                                  
                                                       
                                                      
                                  
                                    
                 
   
  
def is_cauchy
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (sequence : Sequence rationalSystem) : Prop :=
  ∀ epsilon,
    is_positive rationalSystem epsilon →
    ∃ threshold : Nat,
      ∀ first_index second_index : Nat,
        threshold ≤ first_index →
        threshold ≤ second_index →
        rationalSystem.FieldModel.signature.StrictOrder
          (distance rationalSystem absolute_value_data
            (sequence first_index)
            (sequence second_index))
          epsilon


                                               

                                                                                                                                                                                           


             

       
           
                                           
                                                             
                                                  
            
                                        
                      
                    
                           
                                                       
                                                               
                 
   
  
def is_null
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (sequence : Sequence rationalSystem) : Prop :=
  ∀ epsilon,
    is_positive rationalSystem epsilon →
    ∃ threshold : Nat,
      ∀ index : Nat,
        threshold ≤ index →
        rationalSystem.FieldModel.signature.StrictOrder
          (absolute_value_data.absolute_value (sequence index))
          epsilon


                                                                                  

                                                                                                                                                                                                  


             

       
              
                                           
                                                             
                                                      
                                            
                 
                                                     
                     
                       
   
  
def equivalent
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem)
    (first second : Sequence rationalSystem) : Prop :=
  is_null rationalSystem absolute_value_data
    (fun index =>
      rationalSystem.FieldModel.signature.Subtraction
        (first index)
        (second index))


                                                              

                                                                                                                                                            


             

       
                        
                                           
                                                                   
                                    
                      
                                                         
   
  
structure Representative
    (rationalSystem : RationalNumberSystem)
    (absolute_value_data : RationalMetricData rationalSystem) where
  sequence : Sequence rationalSystem
  sequence_is_cauchy :
    is_cauchy rationalSystem absolute_value_data sequence

end LRA.NumberSystems.RealNumbers.Cauchy
