                                                                          
                                                                       
              

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.Operations

namespace LRA.NumberSystems.RealNumbers.Dyadic

variable (dyadicData : RationalDyadicApproximationData)

                                                             
theorem FractionalPartialSumsAreCauchy
    (digits : FractionalDigits) :
    Cauchy.is_cauchy
      dyadicData.RationalSystem
      dyadicData.AbsoluteValueData
      (FractionalPartialSum dyadicData digits) := by
  sorry

                                                                            
def FractionalValue
    (fraction : CanonicalFraction) : CauchyCarrier dyadicData :=
  Quotient.mk _
    ⟨FractionalPartialSum dyadicData fraction.Digits,
      FractionalPartialSumsAreCauchy dyadicData fraction.Digits⟩

                                                       
def WholeNumeralValue : WholeBinaryNumeral → CauchyCarrier dyadicData
  | WholeBinaryNumeral.zero => dyadicData.CauchyZero
  | WholeBinaryNumeral.positive numeral =>
      dyadicData.RationalToCauchy
        (PositiveBinaryNumeralValue dyadicData.RationalSystem numeral)

                                      
def UnsignedValue
    (expansion : UnsignedExpansion) : CauchyCarrier dyadicData :=
  dyadicData.CauchyAddition
    (WholeNumeralValue dyadicData expansion.IntegerPart)
    (FractionalValue dyadicData expansion.FractionalPart)

                               
def Value : Expansion → CauchyCarrier dyadicData
  | Expansion.zero => dyadicData.CauchyZero
  | Expansion.nonzero Sign.positive magnitude =>
      UnsignedValue dyadicData magnitude.Magnitude
  | Expansion.nonzero Sign.negative magnitude =>
      dyadicData.CauchyNegation
        (UnsignedValue dyadicData magnitude.Magnitude)

                                                                 
theorem RepresentationExists
    (realValue : CauchyCarrier dyadicData) :
    ∃ expansion : Expansion,
      Value dyadicData expansion = realValue := by
  sorry

                                                          
theorem ValueIsInjective :
    ∀ first second : Expansion,
      Value dyadicData first = Value dyadicData second → first = second := by
  sorry

                                                          
theorem ValueIsBijective :
    (∀ realValue : CauchyCarrier dyadicData,
      ∃ expansion : Expansion,
        Value dyadicData expansion = realValue) ∧
    (∀ first second : Expansion,
      Value dyadicData first = Value dyadicData second → first = second) := by
  sorry

                                                                        
structure Bijection (α β : Type) where
  Forward : α → β
  Inverse : β → α
  LeftInverse : ∀ value : α, Inverse (Forward value) = value
  RightInverse : ∀ value : β, Forward (Inverse value) = value

                                                                             
           
theorem BinaryRealBijectionExists :
    ∃ bridge : Bijection Expansion (CauchyCarrier dyadicData),
      ∀ expansion : Expansion,
        bridge.Forward expansion = Value dyadicData expansion := by
  sorry

                                             
noncomputable def BinaryRealBijection :
    Bijection Expansion (CauchyCarrier dyadicData) :=
  Classical.choose (BinaryRealBijectionExists dyadicData)

end LRA.NumberSystems.RealNumbers.Dyadic
