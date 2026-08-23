                                                                             
                                                                       
                                                                  

import LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs.Behavior

namespace LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs

open LRA.AlgebraicStructures

variable {R : Type u}

section RingCertificates

variable [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
variable [CommutativeRingLaws R]

instance : AdditiveSemigroupLaws (ComplexNumber R) :=
  ⟨addition_is_associative⟩

instance : AdditiveCommutativeLaws (ComplexNumber R) :=
  ⟨addition_is_commutative⟩

instance : AdditiveIdentityLaws (ComplexNumber R) :=
  ⟨zero_add_complex, add_zero_complex⟩

instance : AdditiveInverseLaws (ComplexNumber R) :=
  ⟨neg_add_cancel_complex, add_neg_cancel_complex⟩

instance : MultiplicativeSemigroupLaws (ComplexNumber R) :=
  ⟨multiplication_is_associative⟩

instance : MultiplicativeCommutativeLaws (ComplexNumber R) :=
  ⟨multiplication_is_commutative⟩

instance : MultiplicativeIdentityLaws (ComplexNumber R) :=
  ⟨one_mul_complex, mul_one_complex⟩

instance : ZeroAbsorbingLaws (ComplexNumber R) :=
  ⟨zero_mul_complex, mul_zero_complex⟩

instance : DistributiveLaws (ComplexNumber R) :=
  ⟨left_distributive_complex, right_distributive_complex⟩

instance : SubtractionCompatibilityLaw (ComplexNumber R) :=
  ⟨fun _ _ => rfl⟩

end RingCertificates

section FieldCertificates

variable [Add R] [Mul R] [Neg R] [Inv R] [OfNat R 0] [OfNat R 1] [LE R]
variable [OrderedFieldLaws R]

instance : NontrivialityLaw (ComplexNumber R) :=
  ⟨one_ne_zero_complex⟩

instance : MultiplicativeInverseLaws (ComplexNumber R) :=
  ⟨mul_inv_cancel_complex, inv_zero_complex⟩

end FieldCertificates

                                          

example : CommutativeRingLaws (ComplexNumber Int) := inferInstance
example : FieldLaws (ComplexNumber Rat) := inferInstance
example : FieldLaws (ComplexNumber Real) := inferInstance

example (a b : ComplexNumber Real) : a + b = b + a := AddCommutative a b

end LRA.NumberSystems.ComplexNumbers.Constructions.OrderedPairs
