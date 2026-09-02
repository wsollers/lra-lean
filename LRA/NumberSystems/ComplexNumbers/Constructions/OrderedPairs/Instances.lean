
import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Behavior

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

open LRA.AlgebraicStructures

variable {R : Type u}

section RingCertificates

variable [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
variable [CommutativeRingLaws R]

instance : AdditiveSemigroupLaws (ComplexNumber R) := by
  sorry
instance : AdditiveCommutativeLaws (ComplexNumber R) := by
  sorry
instance : AdditiveIdentityLaws (ComplexNumber R) := by
  sorry
instance : AdditiveInverseLaws (ComplexNumber R) := by
  sorry
instance : MultiplicativeSemigroupLaws (ComplexNumber R) := by
  sorry
instance : MultiplicativeCommutativeLaws (ComplexNumber R) := by
  sorry
instance : MultiplicativeIdentityLaws (ComplexNumber R) := by
  sorry
instance : ZeroAbsorbingLaws (ComplexNumber R) := by
  sorry
instance : DistributiveLaws (ComplexNumber R) := by
  sorry
instance : SubtractionCompatibilityLaw (ComplexNumber R) := by
  sorry
end RingCertificates

section FieldCertificates

variable [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
variable [OrderedFieldLaws R]

instance : NontrivialityLaw (ComplexNumber R) := by
  sorry
instance : MultiplicativeInverseLaws (ComplexNumber R) := by
  sorry
end FieldCertificates

example : CommutativeRingLaws (ComplexNumber Int) := inferInstance
example : FieldLaws (ComplexNumber Rat) := inferInstance
example : FieldLaws (ComplexNumber Real) := inferInstance

example (a b : ComplexNumber Real) : a + b = b + a := AddCommutative a b

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
