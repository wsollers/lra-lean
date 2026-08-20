-- LRA/NumberSystems/GaussianIntegers/Constructions/OrderedPairs/Instances.lean
-- Registration into the Volume I algebraic-structure typeclasses, plus a
-- smoke test showing the instances resolve at a concrete carrier.

import LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs.Behavior

namespace LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs

open LRA.AlgebraicStructures

variable {R : Type u}

section Certificates

variable [Add R] [Mul R] [Neg R] [OfNat R 0] [OfNat R 1]
variable [CommutativeRingLaws R]

instance : AdditiveSemigroupLaws (GaussianInteger R) :=
  ⟨addition_is_associative⟩

instance : AdditiveCommutativeLaws (GaussianInteger R) :=
  ⟨addition_is_commutative⟩

instance : AdditiveIdentityLaws (GaussianInteger R) :=
  ⟨zero_add_gaussian, add_zero_gaussian⟩

instance : AdditiveInverseLaws (GaussianInteger R) :=
  ⟨neg_add_cancel_gaussian, add_neg_cancel_gaussian⟩

instance : MultiplicativeSemigroupLaws (GaussianInteger R) :=
  ⟨multiplication_is_associative⟩

instance : MultiplicativeCommutativeLaws (GaussianInteger R) :=
  ⟨multiplication_is_commutative⟩

instance : MultiplicativeIdentityLaws (GaussianInteger R) :=
  ⟨one_mul_gaussian, mul_one_gaussian⟩

instance : ZeroAbsorbingLaws (GaussianInteger R) :=
  ⟨zero_mul_gaussian, mul_zero_gaussian⟩

instance : DistributiveLaws (GaussianInteger R) :=
  ⟨left_distributive_gaussian, right_distributive_gaussian⟩

instance : SubtractionCompatibilityLaw (GaussianInteger R) :=
  ⟨fun _ _ => rfl⟩

end Certificates

/-! ## Smoke test: the generic construction over Mathlib's `Int` -/

example : CommutativeRingLaws (GaussianInteger Int) := inferInstance

example (a b : GaussianInteger Int) : a + b = b + a :=
  AddCommutative a b

end LRA.NumberSystems.GaussianIntegers.Constructions.OrderedPairs
