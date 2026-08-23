                                                                  
                                                                     

import LRA.NumberSystems.RationalNumbers.Definition
import LRA.NumberSystems.RealNumbers.Definition
import LRA.NumberSystems.RealNumbers.Constructions.Cauchy

namespace LRA.NumberSystems.RealNumbers.Dyadic

open LRA.NumberSystems.Models
open LRA.NumberSystems.RationalNumbers

universe u

   
                                                                              
                                                                              
                                                                   
                                                                             
                                                            

                                                                         
                                                                              
                                                                        
                                
  

                      
inductive Digit where
  | zero
  | one
  deriving DecidableEq

                                              
abbrev FractionalDigits := Nat → Digit

                                                            
def IsBinaryDigitSequence (digits : FractionalDigits) : Prop :=
  ∀ index, digits index = Digit.zero ∨ digits index = Digit.one

                                                                             

                                                                           
                                                
  
def IsCanonicalFractionalDigits (digits : FractionalDigits) : Prop :=
  IsBinaryDigitSequence digits ∧
  ¬ ∃ threshold,
    ∀ index,
      threshold ≤ index → digits index = Digit.one

                                               
structure CanonicalFraction where
  Digits : FractionalDigits
  IsCanonical : IsCanonicalFractionalDigits Digits

                                     

                                                                            
                
  
structure PositiveBinaryNumeral where
  HighestExponent : Nat
  DigitAt : Fin (HighestExponent + 1) → Digit
  LeadingDigitIsOne :
    DigitAt ⟨HighestExponent, Nat.lt_succ_self HighestExponent⟩ = Digit.one

                                                            
inductive WholeBinaryNumeral where
  | zero
  | positive (Numeral : PositiveBinaryNumeral)

                                               
def IsZeroCanonicalFraction (fraction : CanonicalFraction) : Prop :=
  ∀ index, fraction.Digits index = Digit.zero

                                                                         
                   
structure UnsignedExpansion where
  IntegerPart : WholeBinaryNumeral
  FractionalPart : CanonicalFraction

                                                                         
                             
def IsZeroUnsignedExpansion (expansion : UnsignedExpansion) : Prop :=
  expansion.IntegerPart = WholeBinaryNumeral.zero ∧
    IsZeroCanonicalFraction expansion.FractionalPart

                                           
structure NonzeroUnsignedExpansion where
  Magnitude : UnsignedExpansion
  IsNonzero : ¬ IsZeroUnsignedExpansion Magnitude

                                               
inductive Sign where
  | negative
  | positive
  deriving DecidableEq

                                      

                                                                            
                         
  
inductive Expansion where
  | zero
  | nonzero (Sign : Sign) (Magnitude : NonzeroUnsignedExpansion)

                                                      
def DigitValue
    (rationalSystem : RationalNumberSystem.{u}) :
    Digit → rationalSystem.FieldModel.Carrier
  | Digit.zero => 0
  | Digit.one => 1

                                                 
def PowerOfTwo
    (rationalSystem : RationalNumberSystem.{u}) :
    Nat → rationalSystem.FieldModel.Carrier
  | 0 => 1
  | exponent + 1 =>
      PowerOfTwo rationalSystem exponent * (1 + 1)

                                                                        
def PositiveBinaryNumeralPartialValue
    (rationalSystem : RationalNumberSystem.{u})
    (numeral : PositiveBinaryNumeral) :
    Nat → rationalSystem.FieldModel.Carrier
  | 0 => 0
  | count + 1 =>
      if indexBound : count < numeral.HighestExponent + 1 then
        PositiveBinaryNumeralPartialValue rationalSystem numeral count +
          DigitValue rationalSystem (numeral.DigitAt ⟨count, indexBound⟩) *
            PowerOfTwo rationalSystem count
      else
        PositiveBinaryNumeralPartialValue rationalSystem numeral count

                                                                    
def PositiveBinaryNumeralValue
    (rationalSystem : RationalNumberSystem.{u})
    (numeral : PositiveBinaryNumeral) :
    rationalSystem.FieldModel.Carrier :=
  PositiveBinaryNumeralPartialValue rationalSystem numeral
    (numeral.HighestExponent + 1)

                                                                          
                                  

                                                                               
                                                                            
                                                                                
                                                                 
                                                                            
                                                                              
               
  
structure RationalDyadicApproximationData where
  RationalSystem : RationalNumberSystem.{u}
  AbsoluteValueData : Cauchy.RationalMetricData RationalSystem
  CauchyRealExtension :
    LRA.NumberSystems.RealNumbers.RationalRealExtension RationalSystem
  CauchyCarrierEq :
    CauchyRealExtension.RealModel.Carrier =
      Cauchy.Carrier RationalSystem AbsoluteValueData

variable (dyadicData : RationalDyadicApproximationData.{u})

                                                        
abbrev Rational := dyadicData.RationalSystem.FieldModel.Carrier

                                                              
abbrev Integer := dyadicData.RationalSystem.IntegerSystem.Model.Carrier

                                                                            
abbrev CauchyCarrier :=
  Cauchy.Carrier dyadicData.RationalSystem dyadicData.AbsoluteValueData

                                                                    
abbrev RationalDyadicApproximationData.SelectedRealCarrier
    (dyadicData : RationalDyadicApproximationData.{u}) :=
  dyadicData.CauchyRealExtension.RealModel.Carrier

                                                                                  
def RationalDyadicApproximationData.ToCauchyCarrier
    (dyadicData : RationalDyadicApproximationData.{u}) :
    dyadicData.SelectedRealCarrier → CauchyCarrier dyadicData :=
  cast dyadicData.CauchyCarrierEq

                                                                          
           
def RationalDyadicApproximationData.FromCauchyCarrier
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData → dyadicData.SelectedRealCarrier :=
  cast dyadicData.CauchyCarrierEq.symm

                                                                      
                               
def RationalDyadicApproximationData.RationalToCauchy
    (dyadicData : RationalDyadicApproximationData.{u}) :
    Rational dyadicData → CauchyCarrier dyadicData :=
  fun value =>
    dyadicData.ToCauchyCarrier
      (LRA.NumberSystems.RealNumbers.RationalRealExtension.EmbedRational
        dyadicData.CauchyRealExtension value)

                                                                                
def RationalDyadicApproximationData.CauchyZero
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData :=
  dyadicData.ToCauchyCarrier (0 : dyadicData.SelectedRealCarrier)

                                                                               
def RationalDyadicApproximationData.CauchyOne
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData :=
  dyadicData.ToCauchyCarrier (1 : dyadicData.SelectedRealCarrier)

                                                                      
             
def RationalDyadicApproximationData.CauchyAddition
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun first second =>
    dyadicData.ToCauchyCarrier
      (dyadicData.FromCauchyCarrier first +
        dyadicData.FromCauchyCarrier second)

                                                                      
             
def RationalDyadicApproximationData.CauchyNegation
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun value =>
    dyadicData.ToCauchyCarrier (-dyadicData.FromCauchyCarrier value)

                                                                            
             
def RationalDyadicApproximationData.CauchyMultiplication
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun first second =>
    dyadicData.ToCauchyCarrier
      (dyadicData.FromCauchyCarrier first *
        dyadicData.FromCauchyCarrier second)

                                                                       
             
def RationalDyadicApproximationData.CauchyInverse
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData :=
  fun value =>
    dyadicData.ToCauchyCarrier (dyadicData.FromCauchyCarrier value)⁻¹

                                                                          
             
def RationalDyadicApproximationData.CauchyStrictOrder
    (dyadicData : RationalDyadicApproximationData.{u}) :
    CauchyCarrier dyadicData →
      CauchyCarrier dyadicData → Prop :=
  fun first second =>
    dyadicData.FromCauchyCarrier first <
      dyadicData.FromCauchyCarrier second

                                                           
def IsDyadicRational (value : Rational dyadicData) : Prop :=
  ∃ numerator : Integer dyadicData,
    ∃ exponent : Nat,
      value =
        dyadicData.RationalSystem.IntegerEmbedding.ToField numerator *
          (PowerOfTwo dyadicData.RationalSystem exponent)⁻¹

end LRA.NumberSystems.RealNumbers.Dyadic
