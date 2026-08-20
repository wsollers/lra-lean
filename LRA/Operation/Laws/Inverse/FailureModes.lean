import LRA.Operation.Laws.Inverse.Definition

namespace LRA.Operation.Laws.Inverse

open LRA.Operation

universe u

def FailsTwoSidedInverse {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (identity : Carrier)
    (inverse : UnaryEndoOperation Carrier) : Prop :=
  Not (TwoSidedInverse operation identity inverse)

def NaturalAdditionForInverseFailure : BinaryEndoOperation Nat :=
  fun left right => left + right

def ConstantZeroNaturalInverseCandidate : UnaryEndoOperation Nat :=
  fun _ => 0

theorem NaturalAdditionFailsConstantZeroInverse :
    FailsTwoSidedInverse
      NaturalAdditionForInverseFailure
      0
      ConstantZeroNaturalInverseCandidate := by
  sorry


theorem NaturalAdditionHasNoTwoSidedInverseOperation :
    Not
      (∃ inverse : UnaryEndoOperation Nat,
        TwoSidedInverse NaturalAdditionForInverseFailure 0 inverse) := by
  sorry

end LRA.Operation.Laws.Inverse
