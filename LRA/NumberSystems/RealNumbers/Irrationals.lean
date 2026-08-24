                                                 
                                                                

import LRA.NumberSystems.RationalNumbers.RationalNumberSystem
import LRA.NumberSystems.RealNumbers.Definition

namespace LRA.NumberSystems.RealNumbers.Irrationals

open LRA.NumberSystems.Interface.ModelTheory
open LRA.NumberSystems.RationalNumbers
open LRA.NumberSystems.RealNumbers

   
                                                      
                                                         
                                                                 

                                                                          
                                                                       
                                                                   
                                                                  
                                                                         
                                                                        
                                                                 

                                                                                         
                                                                               
                                                                          
                        
  

variable
    (rational_system : LRA.NumberSystems.RationalNumbers.RationalNumberSystem)
    (real_extension : RationalRealExtension rational_system)

   
                          

                                                    


             

       
                  
                                                                              
                                                               
                                            
   
  
abbrev RealCarrier
    (rational_system : RationalNumberSystem)
    (real_extension : RationalRealExtension rational_system) :=
  real_extension.RealModel.signature.carrier
   
                              

                                                        


             

       
                      
                                                                                 
                                              
   
  
abbrev RationalCarrier
    (rational_system : RationalNumberSystem) :=
  rational_system.FieldModel.signature.carrier


                                                              

                                                                                                                                          


             

       
                                                             
                                                 
                                                        
   
  
def embedRational (value : RationalCarrier rational_system) :
    RealCarrier rational_system real_extension :=
  real_extension.DenseOrderedFieldEmbedding.ToReal value


                                                                                  

                                                                                                            


             

       
                                                                             
                                                     
                                                                       
   
  
def IsRational (value : RealCarrier rational_system real_extension) : Prop :=
  ∃ rational_value : RationalCarrier rational_system,
    embedRational rational_system real_extension rational_value = value


                                                        

                                                                                                              


             

       
                                                                               
                                                   
   
  
def IsIrrational (value : RealCarrier rational_system real_extension) : Prop :=
  ¬ IsRational rational_system real_extension value


                                           

                                                


             

       
              
                                                                              
                                                               
                                                         
                                                         
   
  
abbrev Carrier
    (rational_system : RationalNumberSystem)
    (real_extension : RationalRealExtension rational_system) :=
  { value : RealCarrier rational_system real_extension //
      IsIrrational rational_system real_extension value }


                                    

                                                                                                                                                                                                                  

                             


             

       
                                     
                                               
                                             
                                                          
   
  
theorem embedded_rational_is_rational
    (value : RationalCarrier rational_system) :
    IsRational rational_system real_extension
      (embedRational rational_system real_extension value) := by
  sorry

                          

                                                                                                                                              

                             


             

       
                          
                                             
                                             
   
  
theorem zero_is_rational :
    IsRational rational_system real_extension
      real_extension.RealModel.signature.zero := by
  sorry

                         

                                                                                                                                            

                             


             

       
                         
                                             
                                            
   
  
theorem one_is_rational :
    IsRational rational_system real_extension
      real_extension.RealModel.signature.one := by
  sorry

                                                                      

                                                                                    


             

       
                                                     
                                          
                                            
                                            
   
  
def rational_two : RationalCarrier rational_system :=
  rational_system.FieldModel.signature.add
    rational_system.FieldModel.signature.one
    rational_system.FieldModel.signature.one

                                                                

                                                                                           


             

       
                                                            
                                                                             
   
  
def real_two : RealCarrier rational_system real_extension :=
  embedRational rational_system real_extension (rational_two rational_system)

                                                    

                                                                                                                                                                                                                                                                                                         

                             


             

       
                                     
                                                               
                                                                         
                                                                             
                                             
                                                           
   
  
theorem rational_addition_is_rational
    {first second : RealCarrier rational_system real_extension}
    (first_is_rational : IsRational rational_system real_extension first)
    (second_is_rational : IsRational rational_system real_extension second) :
    IsRational rational_system real_extension
      (real_extension.RealModel.signature.add first second) := by
  sorry

                                                    

                                                                                                                                                                                                                                                                                             

                             


             

       
                                     
                                                        
                                                                           
                                             
                                                    
   
  
theorem rational_negation_is_rational
    {value : RealCarrier rational_system real_extension}
    (value_is_rational : IsRational rational_system real_extension value) :
    IsRational rational_system real_extension
      (real_extension.RealModel.signature.neg value) := by
  sorry

                                                       

                                                                                                                                                                                                                                                                                                         

                             


             

       
                                        
                                                               
                                                                         
                                                                             
                                             
                                                                   
   
  
theorem rational_subtraction_is_rational
    {first second : RealCarrier rational_system real_extension}
    (first_is_rational : IsRational rational_system real_extension first)
    (second_is_rational : IsRational rational_system real_extension second) :
    IsRational rational_system real_extension
      (real_extension.RealModel.signature.Subtraction first second) := by
  sorry

                                                          

                                                                                                                                                                                                                                                                                                         

                             


             

       
                                           
                                                               
                                                                         
                                                                             
                                             
                                                                
   
  
theorem rational_multiplication_is_rational
    {first second : RealCarrier rational_system real_extension}
    (first_is_rational : IsRational rational_system real_extension first)
    (second_is_rational : IsRational rational_system real_extension second) :
    IsRational rational_system real_extension
      (real_extension.RealModel.signature.multiply first second) := by
  sorry

                                                 

                                                                                                                                                                                                                                                                                                        

                             


             

       
                                    
                                                        
                                                                         
                                                                          
                                             
                                                    
   
  
theorem rational_inverse_is_rational
    {value : RealCarrier rational_system real_extension}
    (value_is_rational : IsRational rational_system real_extension value)
    (value_is_nonzero : value ≠ real_extension.RealModel.signature.zero) :
    IsRational rational_system real_extension
      (real_extension.RealModel.signature.inv value) := by
  sorry

                                                                          

                                                                                                                                                                                                                                                                                                         

                             


             

       
                                     
                                                                        
                                                                                 
                                                                                     
                                                                                      
                                             
                                                  
                 
                                                             
   
  
theorem rational_division_is_rational
    {numerator denominator : RealCarrier rational_system real_extension}
    (numerator_is_rational : IsRational rational_system real_extension numerator)
    (denominator_is_rational : IsRational rational_system real_extension denominator)
    (denominator_is_nonzero : denominator ≠ real_extension.RealModel.signature.zero) :
    IsRational rational_system real_extension
      (real_extension.RealModel.signature.multiply
        numerator
        (real_extension.RealModel.signature.inv denominator)) := by
  sorry

                                                

                                                                                                                                                                                                                                                                                            

                             


             

       
                              
                                                        
                                                                               
                                               
                                                    
   
  
theorem negation_is_irrational
    {value : RealCarrier rational_system real_extension}
    (value_is_irrational : IsIrrational rational_system real_extension value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.neg value) := by
  sorry

                                           

                                                                                                                                                                                                                                                                                                        

                             


             

       
                                             
                                                                                  
                                                                                     
                                                                                               
                                               
                                                                              
   
  
theorem rational_add_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_system real_extension}
    (rational_is_rational : IsRational rational_system real_extension rational_value)
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.add rational_value irrational_value) := by
  sorry

                                           

                                                                                                                                                                                                                                                                                                        

                             


             

       
                                             
                                                                                  
                                                                                             
                                                                                       
                                               
                                                                              
   
  
theorem irrational_add_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_system real_extension}
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value)
    (rational_is_rational : IsRational rational_system real_extension rational_value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.add irrational_value rational_value) := by
  sorry

                                            

                                                                                                                                                                                                                                                                                                        

                             


             

       
                                             
                                                                                  
                                                                                     
                                                                                               
                                               
                                                                                      
   
  
theorem rational_sub_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_system real_extension}
    (rational_is_rational : IsRational rational_system real_extension rational_value)
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.Subtraction rational_value irrational_value) := by
  sorry

                                            

                                                                                                                                                                                                                                                                                                        

                             


             

       
                                             
                                                                                  
                                                                                             
                                                                                       
                                               
                                                                                      
   
  
theorem irrational_sub_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_system real_extension}
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value)
    (rational_is_rational : IsRational rational_system real_extension rational_value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.Subtraction irrational_value rational_value) := by
  sorry

                                                         

                                                                                                                                                                                                                                                                                                        

                             


             

       
                                                     
                                                                                  
                                                                                     
                                                                                    
                                                                                               
                                               
                                                                                   
   
  
theorem nonzero_rational_mul_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_system real_extension}
    (rational_is_rational : IsRational rational_system real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero)
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.multiply rational_value irrational_value) := by
  sorry

                                                         

                                                                                                                                                                                                                                                                                                        

                             


             

       
                                                     
                                                                                  
                                                                                             
                                                                                     
                                                                                      
                                               
                                                                                   
   
  
theorem irrational_mul_nonzero_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_system real_extension}
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value)
    (rational_is_rational : IsRational rational_system real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.multiply irrational_value rational_value) := by
  sorry

                                                              

                                                                                                                                                                                                                                                                                                        

                             


             

       
                                                     
                                                                                  
                                                                                             
                                                                                     
                                                                                      
                                               
                                                  
                        
                                                                
   
  
theorem irrational_div_nonzero_rational_is_irrational
    {irrational_value rational_value : RealCarrier rational_system real_extension}
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value)
    (rational_is_rational : IsRational rational_system real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.multiply
        irrational_value
        (real_extension.RealModel.signature.inv rational_value)) := by
  sorry

                                                              

                                                                                                                                                                                                                                                                                                        

                             


             

       
                                                     
                                                                                  
                                                                                     
                                                                                    
                                                                                               
                                               
                                                  
                      
                                                                  
   
  
theorem nonzero_rational_div_irrational_is_irrational
    {rational_value irrational_value : RealCarrier rational_system real_extension}
    (rational_is_rational : IsRational rational_system real_extension rational_value)
    (rational_is_nonzero : rational_value ≠ real_extension.RealModel.signature.zero)
    (irrational_is_irrational : IsIrrational rational_system real_extension irrational_value) :
    IsIrrational rational_system real_extension
      (real_extension.RealModel.signature.multiply
        rational_value
        (real_extension.RealModel.signature.inv irrational_value)) := by
  sorry

                                                              

                                                                                                                                                                                                                                                

                             


             

       
                             
                                                        
                                                                               
                                                   
   
  
theorem irrational_is_nonzero
    {value : RealCarrier rational_system real_extension}
    (value_is_irrational : IsIrrational rational_system real_extension value) :
    value ≠ real_extension.RealModel.signature.zero := by
  sorry

                                                                             

                                                                


             

       
                              
                                                                              
                                                                  
                                                    
                 
                                                             
                                             
                                                                   
   
  
structure SquareRootTwoWitness
    (rational_system : RationalNumberSystem)
    (real_extension : RationalRealExtension rational_system) where
  value : RealCarrier rational_system real_extension
  square_is_two :
    real_extension.RealModel.signature.multiply value value =
      real_two rational_system real_extension
  is_irrational : IsIrrational rational_system real_extension value


                                                            

                                                                                                                                                                                                                                                                                                          

                             


             

       
                                             
                                                                     
                                                                
                                                         
                                                          
                                               
                                                             
   
  
theorem irrationals_not_closed_under_addition
    (witness : SquareRootTwoWitness rational_system real_extension) :
    ∃ first second : RealCarrier rational_system real_extension,
      IsIrrational rational_system real_extension first ∧
      IsIrrational rational_system real_extension second ∧
      IsRational rational_system real_extension
        (real_extension.RealModel.signature.add first second) := by
  sorry

                                                            

                                                                                                                                                                                                                                                                                                          

                             


             

       
                                                
                                                                     
                                                                
                                                         
                                                          
                                               
                                                                     
   
  
theorem irrationals_not_closed_under_subtraction
    (witness : SquareRootTwoWitness rational_system real_extension) :
    ∃ first second : RealCarrier rational_system real_extension,
      IsIrrational rational_system real_extension first ∧
      IsIrrational rational_system real_extension second ∧
      IsRational rational_system real_extension
        (real_extension.RealModel.signature.Subtraction first second) := by
  sorry

                                                                 

                                                                                                                                                                                                                                                                                                          

                             


             

       
                                                   
                                                                     
                                                                
                                                         
                                                          
                                               
                                                                  
   
  
theorem irrationals_not_closed_under_multiplication
    (witness : SquareRootTwoWitness rational_system real_extension) :
    ∃ first second : RealCarrier rational_system real_extension,
      IsIrrational rational_system real_extension first ∧
      IsIrrational rational_system real_extension second ∧
      IsRational rational_system real_extension
        (real_extension.RealModel.signature.multiply first second) := by
  sorry

                                                           

                                                                                                                                                                                                                                                                                                          

                             


             

       
                                             
                                                                     
                                                                
                                                         
                                                          
                                               
                                                    
               
                                                          
   
  
theorem irrationals_not_closed_under_division
    (witness : SquareRootTwoWitness rational_system real_extension) :
    ∃ first second : RealCarrier rational_system real_extension,
      IsIrrational rational_system real_extension first ∧
      IsIrrational rational_system real_extension second ∧
      IsRational rational_system real_extension
        (real_extension.RealModel.signature.multiply
          first
          (real_extension.RealModel.signature.inv second)) := by
  sorry

end LRA.NumberSystems.RealNumbers.Irrationals
