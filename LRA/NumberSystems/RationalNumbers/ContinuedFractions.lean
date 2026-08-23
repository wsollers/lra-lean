                                                            
                                                                

import LRA.Arithmetic.ContinuedFractions
import LRA.NumberSystems.RationalNumbers.Definition

namespace LRA.NumberSystems.RationalNumbers.ContinuedFractions

open LRA.Arithmetic.ContinuedFractions

universe u

   
                                                                     
                                                                        
                                                                              
                              
  

                                                                               
              

             

       
                           
                                               
                                                                
                                        
                                                     
   
  
def EmbedIntegerCoefficient
    (rationalSystem : RationalNumberSystem.{u})
    (coefficient : rationalSystem.IntegerSystem.Model.Carrier) :
    rationalSystem.FieldModel.Carrier :=
  rationalSystem.IntegerEmbedding.ToField coefficient

                                                                           
             

                                                                           
                                                                               
    

             

       
                          
                                                 
                                                     
                                              
   
  
def CoefficientsEvaluateTo
    (rationalSystem : RationalNumberSystem.{u}) :
    List rationalSystem.IntegerSystem.Model.Carrier →
      rationalSystem.FieldModel.Carrier → Prop
  | [], _ => False
  | [coefficient], value =>
      value = EmbedIntegerCoefficient rationalSystem coefficient
  | coefficient :: next :: rest, value =>
      ∃ tailValue : rationalSystem.FieldModel.Carrier,
        CoefficientsEvaluateTo rationalSystem (next :: rest) tailValue ∧
          tailValue ≠ 0 ∧
          value =
            EmbedIntegerCoefficient rationalSystem coefficient + tailValue⁻¹

                                                                             
                                                                        

             

       
                                            
                                               
               
                                                                       
                                                         
                                       
                                          
   
  
def FiniteSimpleContinuedFractionEvaluatesTo
    (rationalSystem : RationalNumberSystem.{u})
    (fraction :
      FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model)
    (value : rationalSystem.FieldModel.Carrier) : Prop :=
  CoefficientsEvaluateTo rationalSystem
    (fraction.Head :: fraction.Tail) value

                                                                                
                                                                         
              

             

       
                                                                    
                                               
                                                 
                
                                                                         
                                                   
                                                
                                         
                 
                                                                             
                                                    
                                                  
                                        
                          
   
  
theorem EveryRationalHasUniqueCanonicalFiniteSimpleContinuedFraction
    (rationalSystem : RationalNumberSystem.{u})
    (value : rationalSystem.FieldModel.Carrier) :
    ∃ fraction :
        FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model,
      IsCanonicalSimpleContinuedFraction fraction ∧
        FiniteSimpleContinuedFractionEvaluatesTo
          rationalSystem fraction value ∧
        ∀ other :
            FiniteSimpleContinuedFraction rationalSystem.IntegerSystem.Model,
          IsCanonicalSimpleContinuedFraction other →
          FiniteSimpleContinuedFractionEvaluatesTo
            rationalSystem other value →
          other = fraction := by
  sorry

end LRA.NumberSystems.RationalNumbers.ContinuedFractions
