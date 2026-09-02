
import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.Behavior

namespace LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

open LRA.AlgebraicStructures

variable {R : Type u}

section Certificates

variable [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
variable [CommutativeRingLaws R]

instance : AdditiveSemigroupLaws (GaussianInteger R) := by
  sorry
instance : AdditiveCommutativeLaws (GaussianInteger R) := by
  sorry
instance : AdditiveIdentityLaws (GaussianInteger R) := by
  sorry
instance : AdditiveInverseLaws (GaussianInteger R) := by
  sorry
instance : MultiplicativeSemigroupLaws (GaussianInteger R) := by
  sorry
instance : MultiplicativeCommutativeLaws (GaussianInteger R) := by
  sorry
instance : MultiplicativeIdentityLaws (GaussianInteger R) := by
  sorry
instance : ZeroAbsorbingLaws (GaussianInteger R) := by
  sorry
instance : DistributiveLaws (GaussianInteger R) := by
  sorry
instance : SubtractionCompatibilityLaw (GaussianInteger R) := by
  sorry
end Certificates

example : CommutativeRingLaws (GaussianInteger Int) := inferInstance

example (a b : GaussianInteger Int) : a + b = b + a :=
  AddCommutative a b

end LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs
