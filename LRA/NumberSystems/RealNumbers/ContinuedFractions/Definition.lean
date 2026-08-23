import LRA.Arithmetic.ContinuedFractions
import LRA.NumberSystems.RationalNumbers.ContinuedFractions
import LRA.NumberSystems.RealNumbers.Irrationals

namespace LRA.NumberSystems.RealNumbers.ContinuedFractions

open LRA.NumberSystems.Models
open LRA.Arithmetic.ContinuedFractions

universe u

                                                                      
                                                                            
                         

             

       
                
                                                             
                                                             
                                                                    
                    
                                                                    
   
  
def FinitePrefix
    {integerModel : DiscretelyOrderedIntegralDomainModel.{u}}
    (fraction : InfiniteSimpleContinuedFraction integerModel)
    (depth : Nat) : FiniteSimpleContinuedFraction integerModel where
  Head := fraction 0
  Tail := (List.range depth).map (fun index => fraction (index + 1))

                                                                               
                                                              

             

       
                  
                                                                                 
                                                                                   
                 
                                                         
                                                                                               
                                                      
   
  
def IsConvergentAt
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (depth : Nat)
    (value : rationalSystem.FieldModel.Carrier) : Prop :=
  LRA.NumberSystems.RationalNumbers.ContinuedFractions.FiniteSimpleContinuedFractionEvaluatesTo
    rationalSystem (FinitePrefix fraction depth) value

                                                                               
                                                                           
                                                                     

             

       
                         
                                                                                 
                                                          
                                                                                   
                                                       
                                              
                 
                                           
                                                         
                                                                   
                                                                                          
                                                                                       
   
  
def ConvergentsConvergeTo
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (limit : realExtension.RealModel.Carrier) : Prop :=
  ∀ epsilon : realExtension.RealModel.Carrier,
    0 < epsilon →
      ∃ N : Nat, ∀ depth : Nat, N ≤ depth →
        ∃ convergent : rationalSystem.FieldModel.Carrier,
          IsConvergentAt rationalSystem fraction depth convergent ∧
          -epsilon ≤ realExtension.DenseOrderedFieldEmbedding.ToReal convergent + -limit ∧
          realExtension.DenseOrderedFieldEmbedding.ToReal convergent + -limit ≤ epsilon

                                                                               
                                                     

             

       
                                                
                                                                                 
                                                          
                                                                                   
                                                       
                                                    
                                                                     
   
  
def IsInfiniteSimpleContinuedFractionExpansionOf
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (fraction : InfiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (value : realExtension.RealModel.Carrier) : Prop :=
  IsProperInfiniteSimpleContinuedFraction fraction ∧
    ConvergentsConvergeTo rationalSystem realExtension fraction value

                                                                         
                                                                             
                                             

             

       
                         
                                                                                 
                                                          
                                                       
                                                        
                                          
                                                         
             
                                    
                                                         
                                                       
                                          
                                                       
   
  
def IsQuadraticIrrational
    (rationalSystem : LRA.NumberSystems.RationalNumbers.RationalNumberSystem.{u})
    (realExtension : RationalRealExtension rationalSystem)
    (value : realExtension.RealModel.Carrier) : Prop :=
  LRA.NumberSystems.RealNumbers.Irrationals.IsIrrational
      rationalSystem realExtension value ∧
    ∃ a b c : rationalSystem.IntegerSystem.Model.Carrier,
      a ≠ 0 ∧
        let embedInteger := fun z =>
          realExtension.DenseOrderedFieldEmbedding.ToReal
            (rationalSystem.IntegerEmbedding.ToField z)
        embedInteger a * (value * value) +
            embedInteger b * value + embedInteger c = 0

end LRA.NumberSystems.RealNumbers.ContinuedFractions
