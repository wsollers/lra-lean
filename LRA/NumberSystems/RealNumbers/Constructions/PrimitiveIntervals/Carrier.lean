                                                                              
                                                                      
                                                                
                                                              

import LRA.UniversalAlgebra.Quotient.RepresentativeCompatibility
import LRA.VolumeII.NumberSystems.Models

namespace LRA.NumberSystems.RealNumbers.PrimitiveIntervals

open LRA.NumberSystems.Models

   
                                                             
                                                                                                                  
                                                                                      

                                                                        
                                                                            
                                                            
                                                       
                            

                                                                         
                                                                         
                                                                          
                                                                    
                                                                         
                                                                     
                                                                          
                                                                     
                                                   

                                                                             
                                                                           
  

variable (rational_model : DenselyOrderedFieldModel)

   
                       

                                                 


             

       
                                                   
   
  
abbrev Rational := rational_model.signature.carrier


                                                 

                                                                                                                                               

                             


             

       
                                 
                                       
                                           
   
  
theorem nonstrict_order_reflexive
    (value : Rational rational_model) :
    rational_model.signature.le value value := by
  sorry

                                               

                                                            


             

       
                                
                                         
                                          
                         
                                                            
   
  
structure RationalInterval where
  left_endpoint : Rational rational_model
  right_endpoint : Rational rational_model
  endpoints_are_ordered :
    rational_model.signature.le left_endpoint right_endpoint


                                                             

                                                                                                                                    


             

       
            
                                                
                                               
                                                            
                                                           
   
  
def contains
    (interval : RationalInterval rational_model)
    (value : Rational rational_model) : Prop :=
  rational_model.signature.le interval.left_endpoint value ∧
  rational_model.signature.le value interval.right_endpoint


                                       

                                                                                                   


             

       
          
                                                             
                             
                                               
                             
                                               
   
  
def subset
    (inner outer : RationalInterval rational_model) : Prop :=
  rational_model.signature.le
      outer.left_endpoint inner.left_endpoint ∧
  rational_model.signature.le
      inner.right_endpoint outer.right_endpoint


                                     

                                                                                                      


             

       
            
                                                              
          
                                         
                                        
   
  
def overlaps
    (first second : RationalInterval rational_model) : Prop :=
  ∃ value,
    contains rational_model first value ∧
    contains rational_model second value


                                   

                                                                                                                  


             

       
         
                                                                             
                                      
                                                  
   
  
def width
    (interval : RationalInterval rational_model) : Rational rational_model :=
  rational_model.signature.Subtraction
    interval.right_endpoint interval.left_endpoint

   
                               

                                                         


             

       
                                                                
   
  
abbrev IntervalSequence := Nat → RationalInterval rational_model


                                                                     

                                                          


             

       
                              
                                            
          
            
                                                                   
                           
              
                                          
                                               
                        
                
                             
                                              
                                                           
   
  
structure Representative where
  interval : IntervalSequence rational_model
  nested :
    ∀ index,
      subset rational_model (interval (index + 1)) (interval index)
  widths_converge_to_zero :
    ∀ epsilon,
      rational_model.signature.StrictOrder
        rational_model.signature.zero epsilon →
      ∃ threshold : Nat,
        ∀ index,
          threshold ≤ index →
          rational_model.signature.StrictOrder
            (width rational_model (interval index)) epsilon


                                                                

                                                                                                                             


             

       
                       
                                                                             
                        
                         
                                                                         
   
  
def degenerate_interval
    (value : Rational rational_model) : RationalInterval rational_model where
  left_endpoint := value
  right_endpoint := value
  endpoints_are_ordered := nonstrict_order_reflexive rational_model value

end LRA.NumberSystems.RealNumbers.PrimitiveIntervals
