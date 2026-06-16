import LRA.VolumeI.Algebra.Laws

namespace LRA.VolumeI.BooleanAlgebra

open LRA.VolumeI.Algebra.Operations
open LRA.VolumeI.Algebra.Laws

structure BooleanRing where

  carrier : Type

  Addition : BinaryOperation carrier

  Multiplication : BinaryOperation carrier

  AdditiveInverse : UnaryOperation carrier

  AdditiveIdentity : carrier

  MultiplicativeIdentity : carrier

  AdditiveAssociativity : IsAssociative Addition

  AdditiveCommutativity : IsCommutative Addition

  AdditiveIdentityLaw : IsRightIdentity Addition AdditiveIdentity

  AdditiveInverseLaw : IsInverse Addition AdditiveIdentity AdditiveInverse

  MultiplicativeAssociativity : IsAssociative Multiplication

  LeftDistributivity : LeftDistributesOver Multiplication Addition

  RightDistributivity : RightDistributesOver Multiplication Addition

  LeftMultiplicativeIdentityLaw : IsLeftIdentity Multiplication MultiplicativeIdentity

  RightMultiplicativeIdentityLaw : IsRightIdentity Multiplication MultiplicativeIdentity

  MultiplicativeIdempotence : IsIdempotent Multiplication

def Zero (R : BooleanRing) : R.carrier := R.AdditiveIdentity

def One (R : BooleanRing) : R.carrier := R.MultiplicativeIdentity

theorem ZeroUnique (R : BooleanRing) (e : R.carrier)
    (he : ∀ p : R.carrier, ApplyBinaryOperation R.Addition p e = p) :
    e = Zero R := by
  unfold Zero
  have h1 : ApplyBinaryOperation R.Addition (Zero R) e = Zero R := he (Zero R)
  unfold Zero at h1
  rw [R.AdditiveCommutativity R.AdditiveIdentity e] at h1
  rw [R.AdditiveIdentityLaw e] at h1
  exact h1

theorem OneUnique (R : BooleanRing) (u : R.carrier)
    (hu : ∀ p : R.carrier, ApplyBinaryOperation R.Multiplication p u = p) :
    u = One R := by
  unfold One
  have h1 : ApplyBinaryOperation R.Multiplication (One R) u = One R := hu (One R)
  unfold One at h1
  rw [R.LeftMultiplicativeIdentityLaw u] at h1
  exact h1

theorem ZeroAddLeft (R : BooleanRing) (a : R.carrier) :
    ApplyBinaryOperation R.Addition (Zero R) a = a := by
  rw [R.AdditiveCommutativity (Zero R) a]
  exact R.AdditiveIdentityLaw a

theorem AdditiveInverseLeft (R : BooleanRing) (a : R.carrier) :
    ApplyBinaryOperation R.Addition (ApplyUnaryOperation R.AdditiveInverse a) a = Zero R := by
  rw [R.AdditiveCommutativity (ApplyUnaryOperation R.AdditiveInverse a) a]
  exact R.AdditiveInverseLaw a

theorem AdditiveFixedPointIsZero (R : BooleanRing) (a : R.carrier)
    (h : ApplyBinaryOperation R.Addition a a = a) :
    a = Zero R := by
  unfold Zero
  have step1 : a = ApplyBinaryOperation R.Addition a R.AdditiveIdentity :=
    (R.AdditiveIdentityLaw a).symm
  have step2 : ApplyBinaryOperation R.Addition a R.AdditiveIdentity =
      ApplyBinaryOperation R.Addition a
        (ApplyBinaryOperation R.Addition a (ApplyUnaryOperation R.AdditiveInverse a)) := by
    rw [R.AdditiveInverseLaw a]
  have step3 : ApplyBinaryOperation R.Addition a
        (ApplyBinaryOperation R.Addition a (ApplyUnaryOperation R.AdditiveInverse a)) =
      ApplyBinaryOperation R.Addition
        (ApplyBinaryOperation R.Addition a a) (ApplyUnaryOperation R.AdditiveInverse a) := by
    rw [R.AdditiveAssociativity a a (ApplyUnaryOperation R.AdditiveInverse a)]
  have step4 : ApplyBinaryOperation R.Addition
        (ApplyBinaryOperation R.Addition a a) (ApplyUnaryOperation R.AdditiveInverse a) =
      ApplyBinaryOperation R.Addition a (ApplyUnaryOperation R.AdditiveInverse a) := by
    rw [h]
  have step5 : ApplyBinaryOperation R.Addition a (ApplyUnaryOperation R.AdditiveInverse a) =
      R.AdditiveIdentity := R.AdditiveInverseLaw a
  exact step1.trans (step2.trans (step3.trans (step4.trans step5)))

theorem SquareOfDouble (R : BooleanRing) (x : R.carrier) :
    ApplyBinaryOperation R.Multiplication
      (ApplyBinaryOperation R.Addition x x) (ApplyBinaryOperation R.Addition x x) =
    ApplyBinaryOperation R.Addition
      (ApplyBinaryOperation R.Addition x x) (ApplyBinaryOperation R.Addition x x) := by
  rw [R.RightDistributivity x x (ApplyBinaryOperation R.Addition x x),
      R.LeftDistributivity x x x,
      R.MultiplicativeIdempotence x]

theorem AdditiveIdempotence (R : BooleanRing) (x : R.carrier) :
    ApplyBinaryOperation R.Addition x x = Zero R := by
  have Step1 : ApplyBinaryOperation R.Multiplication
      (ApplyBinaryOperation R.Addition x x) (ApplyBinaryOperation R.Addition x x) =
      ApplyBinaryOperation R.Addition x x :=
    R.MultiplicativeIdempotence (ApplyBinaryOperation R.Addition x x)
  have Step2 : ApplyBinaryOperation R.Addition
      (ApplyBinaryOperation R.Addition x x) (ApplyBinaryOperation R.Addition x x) =
      ApplyBinaryOperation R.Addition x x :=
    (SquareOfDouble R x).symm.trans Step1
  exact AdditiveFixedPointIsZero R (ApplyBinaryOperation R.Addition x x) Step2

theorem MultiplicativeCommutativity (R : BooleanRing) (p q : R.carrier) :
    ApplyBinaryOperation R.Multiplication p q =
    ApplyBinaryOperation R.Multiplication q p := by

  have Equation12 : Zero R =
      ApplyBinaryOperation R.Addition
        (ApplyBinaryOperation R.Multiplication q p)
        (ApplyBinaryOperation R.Multiplication p q) := by
    sorry

  have NegationIsIdentity :
      ApplyBinaryOperation R.Addition
        (ApplyBinaryOperation R.Multiplication p q)
        (ApplyBinaryOperation R.Multiplication p q) = Zero R := by
    sorry

  sorry

end LRA.VolumeI.BooleanAlgebra
