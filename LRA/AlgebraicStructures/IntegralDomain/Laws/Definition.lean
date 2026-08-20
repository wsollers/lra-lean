import LRA.AlgebraicStructures.CommutativeRing.Laws.Definition
import LRA.AlgebraicStructures.NontrivialRing.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/-! Integral domain law certificates. -/

/-- No zero divisors. -/
class NoZeroDivisorsLaw (R : Type u) [Mul R] [OfNat R 0] : Prop where
  EqZeroOfMulEqZero : ∀ a b : R, a * b = 0 → a = 0 ∨ b = 0

/-- Integral domain laws. -/
class abbrev IntegralDomainLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] : Prop :=
  CommutativeRingLaws R, NontrivialityLaw R, NoZeroDivisorsLaw R

section Wrappers

variable {R : Type u}

/-- A vanishing product has a vanishing factor. -/
theorem EqZeroOfMulEqZero [Mul R] [OfNat R 0] [NoZeroDivisorsLaw R] :
    ∀ a b : R, a * b = 0 → a = 0 ∨ b = 0 := by
  sorry

end Wrappers

end LRA.AlgebraicStructures
