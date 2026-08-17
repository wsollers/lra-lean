import LRA.VolumeI.AlgebraicStructures.CommutativeRing.Laws.Definition

namespace LRA.AlgebraicStructures

universe u

/-!
Integral domain law certificates.
-/

/-- The carrier is nontrivial: `1 ≠ 0`. -/
class NontrivialityLaw (R : Type u) [OfNat R 0] [OfNat R 1] : Prop where
  OneNeZero : (1 : R) ≠ 0

/-- No zero divisors. -/
class NoZeroDivisorsLaw (R : Type u) [Mul R] [OfNat R 0] : Prop where
  EqZeroOfMulEqZero : ∀ a b : R, a * b = 0 → a = 0 ∨ b = 0

/-- Integral domain laws. -/
class abbrev IntegralDomainLaws (R : Type u)
    [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1] : Prop :=
  AdditiveSemigroupLaws R, AdditiveIdentityLaws R,
  AdditiveInverseLaws R, AdditiveCommutativeLaws R,
  MultiplicativeSemigroupLaws R, MultiplicativeIdentityLaws R,
  MultiplicativeCommutativeLaws R,
  ZeroAbsorbingLaws R, DistributiveLaws R,
  NontrivialityLaw R, NoZeroDivisorsLaw R

section Wrappers

variable {R : Type u}

/-- One and zero are distinct. -/
theorem OneNeZero [OfNat R 0] [OfNat R 1] [NontrivialityLaw R] :
    (1 : R) ≠ 0 :=
  NontrivialityLaw.OneNeZero

/-- A vanishing product has a vanishing factor. -/
theorem EqZeroOfMulEqZero [Mul R] [OfNat R 0] [NoZeroDivisorsLaw R] :
    ∀ a b : R, a * b = 0 → a = 0 ∨ b = 0 :=
  NoZeroDivisorsLaw.EqZeroOfMulEqZero

end Wrappers

end LRA.AlgebraicStructures
