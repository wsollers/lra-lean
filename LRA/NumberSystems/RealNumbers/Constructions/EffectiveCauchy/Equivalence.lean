                                                                              

import LRA.NumberSystems.RealNumbers.Constructions.EffectiveCauchy.Carrier

namespace LRA.NumberSystems.RealNumbers.EffectiveCauchy

open LRA.NumberSystems.RationalNumbers

universe u

                                                                          
                                                                        
       

             

       
              
                                           
                                                                          
                    
                               
                                                                   
                                                              
                                                             
   
  
def Equivalent
    {rationalSystem : RationalNumberSystem.{u}}
    (first second : EffectiveCauchyApproximation rationalSystem) : Prop :=
  ∀ precision : Nat,
    ∃ index : Nat, ∀ n ≥ index,
      let difference := first.Approximate n + -second.Approximate n;
      -PrecisionRadius rationalSystem precision < difference ∧
        difference < PrecisionRadius rationalSystem precision

                                                                         
                  
theorem EquivalentIsEquivalence
    (rationalSystem : RationalNumberSystem.{u}) :
    Equivalence (@Equivalent rationalSystem) := by
  sorry

                                                                           
def ApproximationSetoid
    (rationalSystem : RationalNumberSystem.{u}) :
    Setoid (EffectiveCauchyApproximation rationalSystem) where
  r := Equivalent
  iseqv := EquivalentIsEquivalence rationalSystem

                                                                              

                                                                   
  
abbrev EffectiveCauchyReal
    (rationalSystem : RationalNumberSystem.{u}) :=
  Quotient (ApproximationSetoid rationalSystem)

end LRA.NumberSystems.RealNumbers.EffectiveCauchy
