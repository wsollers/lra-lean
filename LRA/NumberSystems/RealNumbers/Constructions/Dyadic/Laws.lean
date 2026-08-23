                                                               
                                                                     

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.WellDefinedness

namespace LRA.NumberSystems.RealNumbers.Dyadic

variable (dyadicData : RationalDyadicApproximationData)

                                     
noncomputable def Zero : Expansion :=
  (BinaryRealBijection dyadicData).Inverse dyadicData.CauchyZero

                                           
noncomputable def One : Expansion :=
  (BinaryRealBijection dyadicData).Inverse dyadicData.CauchyOne

                            
noncomputable def Addition (first second : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyAddition
      ((BinaryRealBijection dyadicData).Forward first)
      ((BinaryRealBijection dyadicData).Forward second))

                            
noncomputable def Negation (expansion : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyNegation
      ((BinaryRealBijection dyadicData).Forward expansion))

                                  
noncomputable def Multiplication (first second : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyMultiplication
      ((BinaryRealBijection dyadicData).Forward first)
      ((BinaryRealBijection dyadicData).Forward second))

                           
noncomputable def Inverse (expansion : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyInverse
      ((BinaryRealBijection dyadicData).Forward expansion))

                                
def StrictOrder (first second : Expansion) : Prop :=
  dyadicData.CauchyStrictOrder
    ((BinaryRealBijection dyadicData).Forward first)
    ((BinaryRealBijection dyadicData).Forward second)

                                                                         
                                                         
def OrderedFieldIsomorphism : Prop :=
  (BinaryRealBijection dyadicData).Forward (Zero dyadicData) =
      dyadicData.CauchyZero ∧
  (BinaryRealBijection dyadicData).Forward (One dyadicData) =
      dyadicData.CauchyOne ∧
  (∀ first second : Expansion,
    (BinaryRealBijection dyadicData).Forward
        (Addition dyadicData first second) =
      dyadicData.CauchyAddition
        ((BinaryRealBijection dyadicData).Forward first)
        ((BinaryRealBijection dyadicData).Forward second)) ∧
  (∀ expansion : Expansion,
    (BinaryRealBijection dyadicData).Forward
        (Negation dyadicData expansion) =
      dyadicData.CauchyNegation
        ((BinaryRealBijection dyadicData).Forward expansion)) ∧
  (∀ first second : Expansion,
    (BinaryRealBijection dyadicData).Forward
        (Multiplication dyadicData first second) =
      dyadicData.CauchyMultiplication
        ((BinaryRealBijection dyadicData).Forward first)
        ((BinaryRealBijection dyadicData).Forward second)) ∧
  (∀ expansion : Expansion,
    (BinaryRealBijection dyadicData).Forward
        (Inverse dyadicData expansion) =
      dyadicData.CauchyInverse
        ((BinaryRealBijection dyadicData).Forward expansion)) ∧
  (∀ first second : Expansion,
    StrictOrder dyadicData first second ↔
      dyadicData.CauchyStrictOrder
        ((BinaryRealBijection dyadicData).Forward first)
        ((BinaryRealBijection dyadicData).Forward second))

                                                                       
                           
theorem OrderedFieldIsomorphismHolds :
    OrderedFieldIsomorphism dyadicData := by
  sorry

end LRA.NumberSystems.RealNumbers.Dyadic
