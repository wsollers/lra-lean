                                                  

import LRA.NumberSystems.RationalNumbers.Definition

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy

open LRA.NumberSystems.RationalNumbers

universe u

                                                            

             

       
                   
                                                                                     
          
                                                         
   
  
def PrecisionRadius
    (rationalSystem : RationalNumberSystem.{u}) :
    Nat → rationalSystem.FieldModel.Carrier
  | 0 => 1
  | n + 1 => PrecisionRadius rationalSystem n * (1 + 1)⁻¹

                                                                          
                                           

                                                                           
                                                                            
                                                              

             

       
                                      
                                                 
                                                       
                     
                     
                                             
                                      
                                       
                                                                            
                                                                
                                                               
   
  
structure EffectiveCauchyApproximation
    (rationalSystem : RationalNumberSystem.{u}) where
  Approximate : Nat → rationalSystem.FieldModel.Carrier
  Modulus : Nat → Nat
  CauchyAtPrecision :
    ∀ precision firstIndex secondIndex : Nat,
      Modulus precision ≤ firstIndex →
      Modulus precision ≤ secondIndex →
        let difference := Approximate firstIndex + -Approximate secondIndex;
        -PrecisionRadius rationalSystem precision < difference ∧
          difference < PrecisionRadius rationalSystem precision

end LRA.NumberSystems.RealNumbers.EffectiveCauchy
