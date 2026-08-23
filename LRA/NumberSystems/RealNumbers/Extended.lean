                                              
                                                     

import LRA.NumberSystems.RealNumbers.Extensions

namespace LRA.NumberSystems.RealNumbers.Extended
open LRA.NumberSystems.Models

   
                                   
                                                   
                                                           
                                                     

                                                                        
                                                                    
                                                                        
  

open LRA.NumberSystems.Models

   
                              

                                                                                 


             

       
                                                     
                    
                                                 
                    
   
  
inductive ExtendedReal (real_model : RealModel) where
  | negativeInfinity
  | finite (value : real_model.signature.carrier)
  | positiveInfinity

   
                           

                                                                                                                                                                                                                                                                                         


             

       
                   
                              
                                                            
                                
                                
                                                                         
                 
   
  
def nonstrict_order
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → Prop
  | .negativeInfinity, _ => True
  | _, .positiveInfinity => True
  | .finite first, .finite second => real_model.signature.le first second
  | _, _ => False

   
                    

                                                                                                                                                                                                                                                                                                 


             

       
            
                              
                                                     
                                          
                                          
                                                             
   
  
def negation
    (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model
  | .negativeInfinity => .positiveInfinity
  | .positiveInfinity => .negativeInfinity
  | .finite value => .finite (real_model.signature.neg value)

   
                    

                                                                                                                                                              


             

       
            
                            
                                             
                                                   
                                                                           
                  
                                                                                 
                                                        
   
  
def supremum
    (real_model : RealModel)
    (subset : ExtendedReal real_model → Prop)
    (candidate : ExtendedReal real_model) : Prop :=
  (∀ member, subset member → nonstrict_order real_model member candidate) ∧
    ∀ upper_bound,
      (∀ member, subset member → nonstrict_order real_model member upper_bound) →
        nonstrict_order real_model candidate upper_bound

   
                                         

                                                                                                                                                                                                                    

                             


             

       
                                 
                            
                                               
                                          
                                          
   
  
theorem every_subset_has_supremum
    (real_model : RealModel)
    (subset : ExtendedReal real_model → Prop) :
    ∃ candidate : ExtendedReal real_model,
      supremum real_model subset candidate := by
  sorry

   
                                  

                                                                                                                                                                               


             

       
                          
                            
                                                                                                   
                                                                       
                          
                   
                                                   
                                                    
                                                           
                                                    
                                                              
   
  
structure PartialOperation
    (real_model : RealModel)
    (operation : ExtendedReal real_model → ExtendedReal real_model → ExtendedReal real_model) where
  defined_at : ExtendedReal real_model → ExtendedReal real_model → Prop
  respects_finite_values :
    ∀ first second,
      defined_at (.finite first) (.finite second) →
        operation (.finite first) (.finite second) =
          .finite (real_model.signature.add first second) ∨
        operation (.finite first) (.finite second) =
          .finite (real_model.signature.multiply first second)

end LRA.NumberSystems.RealNumbers.Extended
