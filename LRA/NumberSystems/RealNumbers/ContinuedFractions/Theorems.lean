import LRA.NumberSystems.RealNumbers.ContinuedFractions.Definition

namespace LRA.NumberSystems.RealNumbers.ContinuedFractions

open LRA.NumberSystems.Models
open LRA.Arithmetic.ContinuedFractions

universe u

                                                                          
                                                                    

             

       
                                                      
                                                                                 
                                                          
                                                                                   
                                                                 
                                              
                                                                       
   
  
theorem ProperInfiniteSimpleContinuedFractionConverges
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (proper : IsProperInfiniteSimpleContinuedFraction fraction) :
    ∃ limit : realExtension.RealModel.Carrier,
      ConvergentsConvergeTo rationalSystem realExtension fraction limit := by
  sorry

                                                                               
                                                                           

             

       
                                                                 
                                                                                 
                                                          
                                               
                                                              
                                                                                      
                                                    
                                                       
                                     
   
  
theorem QuadraticIrrationalIffEventuallyPeriodicContinuedFraction
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (value : realExtension.RealModel.Carrier) :
    IsQuadraticIrrational rationalSystem realExtension value ↔
      ∃ fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model,
        IsInfiniteSimpleContinuedFractionExpansionOf
          rationalSystem realExtension fraction value ∧
        IsEventuallyPeriodic fraction := by
  sorry

end LRA.NumberSystems.RealNumbers.ContinuedFractions
