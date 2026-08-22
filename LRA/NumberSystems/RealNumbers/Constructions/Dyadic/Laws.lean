-- LRA/NumberSystems/RealNumbers/Constructions/Dyadic/Laws.lean
-- Transported constants, operations, and order on binary expansions.

import LRA.NumberSystems.RealNumbers.Constructions.Dyadic.WellDefinedness

namespace LRA.NumberSystems.RealNumbers.Dyadic

variable (dyadicData : RationalDyadicApproximationData)

/-- Transported additive identity. -/
noncomputable def Zero : Expansion :=
  (BinaryRealBijection dyadicData).Inverse dyadicData.cauchy_zero

/-- Transported multiplicative identity. -/
noncomputable def One : Expansion :=
  (BinaryRealBijection dyadicData).Inverse dyadicData.cauchy_one

/-- Transported addition. -/
noncomputable def Addition (first second : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.cauchy_addition
      ((BinaryRealBijection dyadicData).Forward first)
      ((BinaryRealBijection dyadicData).Forward second))

/-- Transported negation. -/
noncomputable def Negation (expansion : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.cauchy_negation
      ((BinaryRealBijection dyadicData).Forward expansion))

/-- Transported multiplication. -/
noncomputable def Multiplication (first second : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.cauchy_multiplication
      ((BinaryRealBijection dyadicData).Forward first)
      ((BinaryRealBijection dyadicData).Forward second))

/-- Transported inverse. -/
noncomputable def Inverse (expansion : Expansion) : Expansion :=
  (BinaryRealBijection dyadicData).Inverse
    (dyadicData.cauchy_inverse
      ((BinaryRealBijection dyadicData).Forward expansion))

/-- Transported strict order. -/
def StrictOrder (first second : Expansion) : Prop :=
  dyadicData.cauchy_strict_order
    ((BinaryRealBijection dyadicData).Forward first)
    ((BinaryRealBijection dyadicData).Forward second)

/-- Proposition expressing that the selected binary/Cauchy-real bijection
preserves the ordered-field structure. -/
def OrderedFieldIsomorphism : Prop :=
  (BinaryRealBijection dyadicData).Forward (Zero dyadicData) =
      dyadicData.cauchy_zero ∧
  (BinaryRealBijection dyadicData).Forward (One dyadicData) =
      dyadicData.cauchy_one ∧
  (∀ first second : Expansion,
    (BinaryRealBijection dyadicData).Forward
        (Addition dyadicData first second) =
      dyadicData.cauchy_addition
        ((BinaryRealBijection dyadicData).Forward first)
        ((BinaryRealBijection dyadicData).Forward second)) ∧
  (∀ expansion : Expansion,
    (BinaryRealBijection dyadicData).Forward
        (Negation dyadicData expansion) =
      dyadicData.cauchy_negation
        ((BinaryRealBijection dyadicData).Forward expansion)) ∧
  (∀ first second : Expansion,
    (BinaryRealBijection dyadicData).Forward
        (Multiplication dyadicData first second) =
      dyadicData.cauchy_multiplication
        ((BinaryRealBijection dyadicData).Forward first)
        ((BinaryRealBijection dyadicData).Forward second)) ∧
  (∀ expansion : Expansion,
    (BinaryRealBijection dyadicData).Forward
        (Inverse dyadicData expansion) =
      dyadicData.cauchy_inverse
        ((BinaryRealBijection dyadicData).Forward expansion)) ∧
  (∀ first second : Expansion,
    StrictOrder dyadicData first second ↔
      dyadicData.cauchy_strict_order
        ((BinaryRealBijection dyadicData).Forward first)
        ((BinaryRealBijection dyadicData).Forward second))

/-- The selected binary/Cauchy-real bijection is an ordered-field
isomorphism. -/
theorem OrderedFieldIsomorphismHolds :
    OrderedFieldIsomorphism dyadicData := by
  sorry

end LRA.NumberSystems.RealNumbers.Dyadic
