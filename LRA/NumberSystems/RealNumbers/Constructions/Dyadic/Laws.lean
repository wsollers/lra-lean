-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Laws.lean
-- Transported constants, operations, and order on binary expansions.

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.WellDefinedness

namespace LRA.NumberSystems.RealNumbers.Dyadic

variable (dyadicData : RationalDyadicApproximationData)

/-- Transported additive identity. -/
noncomputable def Zero : Expansion :=
  (BinaryRealBijection dyadicData).Inverse dyadicData.CauchyZero

/-- Transported multiplicative identity. -/
noncomputable def One : Expansion :=
  (BinaryRealBijection dyadicData).Inverse dyadicData.CauchyOne

/-- Transported addition. -/
noncomputable def Addition (first second : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyAddition
      ((BinaryRealBijection dyadicData).Forward first)
      ((BinaryRealBijection dyadicData).Forward second))

/-- Transported negation. -/
noncomputable def Negation (expansion : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyNegation
      ((BinaryRealBijection dyadicData).Forward expansion))

/-- Transported multiplication. -/
noncomputable def Multiplication (first second : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyMultiplication
      ((BinaryRealBijection dyadicData).Forward first)
      ((BinaryRealBijection dyadicData).Forward second))

/-- Transported inverse. -/
noncomputable def Inverse (expansion : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.CauchyInverse
      ((BinaryRealBijection dyadicData).Forward expansion))

/-- Transported strict order. -/
def StrictOrder (first second : Expansion) : Prop :=
  dyadicData.CauchyStrictOrder
    ((BinaryRealBijection dyadicData).Forward first)
    ((BinaryRealBijection dyadicData).Forward second)

/-- Proposition expressing that the selected binary/Cauchy-real bijection
preserves the transported operations and strict order. -/
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

/-- The selected binary/Cauchy-real bijection preserves the transported
ordered-field structure. -/
theorem OrderedFieldIsomorphismHolds :
    OrderedFieldIsomorphism dyadicData := by
  sorry

end LRA.NumberSystems.RealNumbers.Dyadic
