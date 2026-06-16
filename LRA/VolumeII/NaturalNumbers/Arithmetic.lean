import LRA.VolumeI.Algebra.Bundles

namespace LRA.VolumeII.NaturalNumbers.Arithmetic

open LRA.VolumeI.Foundations
open LRA.VolumeI.Algebra.Operations
open LRA.VolumeI.Algebra.Laws
open LRA.VolumeI.Algebra.Bundles

def NaturalNumberAddition : BinaryOperation Nat :=
  fun tuple => tuple i₀ + tuple i₁

def NaturalNumberMultiplication : BinaryOperation Nat :=
  fun tuple => tuple i₀ * tuple i₁

theorem ApplyNaturalNumberAddition (first second : Nat) :
    ApplyBinaryOperation NaturalNumberAddition first second = first + second := by
  show pair first second i₀ + pair first second i₁ = first + second
  rw [pair_fst first second, pair_snd first second]

theorem ApplyNaturalNumberMultiplication (first second : Nat) :
    ApplyBinaryOperation NaturalNumberMultiplication first second = first * second := by
  show pair first second i₀ * pair first second i₁ = first * second
  rw [pair_fst first second, pair_snd first second]

theorem NaturalNumberAdditionIsAssociative : IsAssociative NaturalNumberAddition := by
  intro first second third
  simp only [ApplyNaturalNumberAddition]
  exact Nat.add_assoc first second third

theorem NaturalNumberAdditionIsCommutative : IsCommutative NaturalNumberAddition := by
  intro first second
  simp only [ApplyNaturalNumberAddition]
  exact Nat.add_comm first second

theorem NaturalNumberAdditionHasIdentityZero : IsIdentity NaturalNumberAddition 0 := by
  constructor
  · intro element
    simp only [ApplyNaturalNumberAddition]
    exact Nat.zero_add element
  · intro element
    simp only [ApplyNaturalNumberAddition]
    exact Nat.add_zero element

theorem NaturalNumberMultiplicationIsAssociative : IsAssociative NaturalNumberMultiplication := by
  intro first second third
  simp only [ApplyNaturalNumberMultiplication]
  exact Nat.mul_assoc first second third

theorem NaturalNumberMultiplicationIsCommutative : IsCommutative NaturalNumberMultiplication := by
  intro first second
  simp only [ApplyNaturalNumberMultiplication]
  exact Nat.mul_comm first second

theorem NaturalNumberMultiplicationHasIdentityOne : IsIdentity NaturalNumberMultiplication 1 := by
  constructor
  · intro element
    simp only [ApplyNaturalNumberMultiplication]
    exact Nat.one_mul element
  · intro element
    simp only [ApplyNaturalNumberMultiplication]
    exact Nat.mul_one element

def NaturalNumberAdditiveMonoid : CommutativeMonoid where
  Carrier := Nat
  Operation := NaturalNumberAddition
  IdentityElement := 0
  OperationIsAssociative := NaturalNumberAdditionIsAssociative
  OperationIsCommutative := NaturalNumberAdditionIsCommutative
  OperationHasIdentity := NaturalNumberAdditionHasIdentityZero

def NaturalNumberMultiplicativeMonoid : CommutativeMonoid where
  Carrier := Nat
  Operation := NaturalNumberMultiplication
  IdentityElement := 1
  OperationIsAssociative := NaturalNumberMultiplicationIsAssociative
  OperationIsCommutative := NaturalNumberMultiplicationIsCommutative
  OperationHasIdentity := NaturalNumberMultiplicationHasIdentityOne

theorem CommutativeMonoidExists : Nonempty CommutativeMonoid :=
  ⟨NaturalNumberAdditiveMonoid⟩

end LRA.VolumeII.NaturalNumbers.Arithmetic
