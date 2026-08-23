import LRA.NumberSystems.Models

namespace LRA.Arithmetic.ContinuedFractions

open LRA.NumberSystems.Models

universe u

                                                                     

                                                                            
                                                                        
                                     

             

       
                                       
                                                                   
                             
                                  
   
  
structure FiniteSimpleContinuedFraction
    (integerModel : DiscretelyOrderedIntegralDomainModel.{u}) where
  Head : integerModel.Carrier
  Tail : List integerModel.Carrier

                                                                  
             

             

       
                                   
                                                                         
                            
   
  
def InfiniteSimpleContinuedFraction
    (integerModel : DiscretelyOrderedIntegralDomainModel.{u}) : Type u :=
  Nat → integerModel.Carrier

                                                                   
                                                                             
                             

                                                          
                                                                   

             

       
                                      
                                                             
                                                                     
                                                    
                         
                                                   
                                    
                                                            
   
  
def IsCanonicalSimpleContinuedFraction
    {integerModel : DiscretelyOrderedIntegralDomainModel.{u}}
    (fraction : FiniteSimpleContinuedFraction integerModel) : Prop :=
  (∀ coefficient ∈ fraction.Tail, 0 < coefficient) ∧
    (fraction.Tail = [] ∨
      ∃ initialSegment : List integerModel.Carrier,
        ∃ last : integerModel.Carrier,
          fraction.Tail = initialSegment ++ [last] ∧ 1 < last)

                                                                          
                                                                 

             

       
                                           
                                                             
                                                                       
                                         
   
  
def IsProperInfiniteSimpleContinuedFraction
    {integerModel : DiscretelyOrderedIntegralDomainModel.{u}}
    (fraction : InfiniteSimpleContinuedFraction integerModel) : Prop :=
  ∀ index : Nat, 0 < fraction (index + 1)

                                                                         
                                                                        

             

       
                        
                                                             
                                                                       
                       
                
                    
                                                                  
   
  
def IsEventuallyPeriodic
    {integerModel : DiscretelyOrderedIntegralDomainModel.{u}}
    (fraction : InfiniteSimpleContinuedFraction integerModel) : Prop :=
  ∃ start period : Nat,
    period ≠ 0 ∧
      ∀ index : Nat,
        start ≤ index → fraction (index + period) = fraction index

end LRA.Arithmetic.ContinuedFractions
