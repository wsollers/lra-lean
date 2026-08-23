                                                 
                                                                          
                                                               

import LRA.NumberSystems.RealNumbers.Extended

namespace LRA.NumberSystems.RealNumbers.NonNegative
open LRA.NumberSystems.Models
open LRA.NumberSystems.RealNumbers.Extended

   
                                   
                                                      
                                                     

                                                                  
                                                                       
                                                                      
                                                                  
                                                                     
                                                                
                                                             
                                                                          
                                                                    
                      

                                                                        
                                                                      
                                                               
                                                                         
                                                                
                                                             
                                                                          
                                                                   
                                  

                                                                     
                                                                     
                                                                         
                                                                         
                                                                       
                                                                        
                                                                         
                                                                        
                  

                                                                           
                                                                      
                                                                    
                                                                      
                                            
  

                                                                    
                                               

             

       
                                                        
                                           
                                                               
   
  
def NonNegativeReal (real_model : RealModel) : Type _ :=
  { value : real_model.signature.carrier //
      real_model.signature.le real_model.signature.zero value }

                                                                     
                                                            
                                                                          
       

             

       
                                                                
                                      
                                                                            
   
  
def NonNegativeExtendedReal (real_model : RealModel) : Type _ :=
  { value : ExtendedReal real_model //
      nonstrict_order real_model (.finite real_model.signature.zero) value }

                         

                             

             

       
                                                    
                                                                               
   
  
theorem ZeroIsNonNegative (real_model : RealModel) :
    real_model.signature.le real_model.signature.zero real_model.signature.zero := by
  sorry

                                                           

             

       
                                                                 
                                                           
   
  
def zero (real_model : RealModel) : NonNegativeReal real_model :=
  ⟨real_model.signature.zero, ZeroIsNonNegative real_model⟩

                                                                          
                                                     

                             

             

       
                                                                
                              
                                                             
   
  
theorem PositiveInfinityIsNonNegative (real_model : RealModel) :
    nonstrict_order real_model
      (.finite real_model.signature.zero) (.positiveInfinity) := by
  sorry

                                                                          

             

       
                                                                             
                                                               
   
  
def infinity (real_model : RealModel) : NonNegativeExtendedReal real_model :=
  ⟨.positiveInfinity, PositiveInfinityIsNonNegative real_model⟩

                                                                      

                             

             

       
                                                            
                                          
                                                                              
                              
                                                         
   
  
theorem FiniteIsNonNegativeExtended (real_model : RealModel)
    (value : real_model.signature.carrier)
    (value_nonneg : real_model.signature.le real_model.signature.zero value) :
    nonstrict_order real_model
      (.finite real_model.signature.zero) (.finite value) := by
  sorry

                                                      
                                     

             

       
                                       
                                                                                
                                                                                      
   
  
def toExtended (real_model : RealModel)
    (value : NonNegativeReal real_model) : NonNegativeExtendedReal real_model :=
  ⟨.finite value.val, FiniteIsNonNegativeExtended real_model value.val value.property⟩

                                                              

                             

             

       
                                                      
                                                 
                                                                            
                                                                                
                                                     
                                             
   
  
theorem AdditionIsNonNegative (real_model : RealModel)
    (first second : real_model.signature.carrier)
    (first_nonneg : real_model.signature.le real_model.signature.zero first)
    (second_nonneg : real_model.signature.le real_model.signature.zero second) :
    real_model.signature.le real_model.signature.zero
      (real_model.signature.add first second) := by
  sorry

                                             

             

       
                                
                                                                               
                                                 
                                                         
                                     
   
  
def add (real_model : RealModel)
    (first second : NonNegativeReal real_model) : NonNegativeReal real_model :=
  ⟨real_model.signature.add first.val second.val,
    AdditionIsNonNegative real_model first.val second.val
      first.property second.property⟩

                                                                        
                                                                     
                                                                         
                                                                         
                                                                     
                               

             

       
                                             
                                                                               
                                             
                                             
                                             
                                             
                                                                                    
   
  
def addExtendedRaw (real_model : RealModel) :
    ExtendedReal real_model → ExtendedReal real_model → ExtendedReal real_model
  | .positiveInfinity, _ => .positiveInfinity
  | _, .positiveInfinity => .positiveInfinity
  | .negativeInfinity, _ => .negativeInfinity
  | _, .negativeInfinity => .negativeInfinity
  | .finite first, .finite second => .finite (real_model.signature.add first second)

                                                                        
     

                             

             

       
                                                            
                                            
                   
                                                                           
                    
                                                                              
                              
                                         
                                              
   
  
theorem AddExtendedRawIsNonNegative (real_model : RealModel)
    (first second : ExtendedReal real_model)
    (first_nonneg :
      nonstrict_order real_model (.finite real_model.signature.zero) first)
    (second_nonneg :
      nonstrict_order real_model (.finite real_model.signature.zero) second) :
    nonstrict_order real_model
      (.finite real_model.signature.zero)
      (addExtendedRaw real_model first second) := by
  sorry

                                                                   
                                     

             

       
                                        
                                                         
                                         
                                                  
                                                               
                                     
   
  
def addExtended (real_model : RealModel)
    (first second : NonNegativeExtendedReal real_model) :
    NonNegativeExtendedReal real_model :=
  ⟨addExtendedRaw real_model first.val second.val,
    AddExtendedRawIsNonNegative real_model first.val second.val
      first.property second.property⟩

                                                                           

             

       
                               
                                                         
                                              
   
  
def le (real_model : RealModel)
    (first second : NonNegativeReal real_model) : Prop :=
  real_model.signature.le first.val second.val

                                                                     
                       

             

       
                                       
                                                                 
                                                 
   
  
def leExtended (real_model : RealModel)
    (first second : NonNegativeExtendedReal real_model) : Prop :=
  nonstrict_order real_model first.val second.val

                                                     

             

       
                                   
                                                                          
           
   
  
def toReal (real_model : RealModel)
    (value : NonNegativeReal real_model) : real_model.signature.carrier :=
  value.val

                                                                       

             

       
                                           
                                                                             
           
   
  
def toExtendedReal (real_model : RealModel)
    (value : NonNegativeExtendedReal real_model) : ExtendedReal real_model :=
  value.val

end LRA.NumberSystems.RealNumbers.NonNegative
