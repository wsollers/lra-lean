import Mathlib.Algebra.Order.Field.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Archimedean
import Mathlib.Data.Complex.Basic
import Mathlib.Data.Rat.Defs
import LRA.VolumeI.AlgebraicStructures.CommutativeSemiring.Laws.Definition
import LRA.VolumeI.AlgebraicStructures.CompleteOrderedField.Laws.Definition
import LRA.VolumeI.AlgebraicStructures.DiscreteInteger.Laws.Definition
import LRA.VolumeI.AlgebraicStructures.IntegralDomain.Laws.Definition
import LRA.Order.Interop.Mathlib.Certificates

namespace LRA.AlgebraicStructures

open LRA.Order

universe u

/-!
The Mathlib bridge: generic instances deriving this layer's certificates
from Mathlib's algebra classes.

One instance per certificate, stated at the weakest Mathlib class that
supplies the law -- so certification flows to *every* Mathlib carrier at
once (`ℕ`, `ℤ`, `ℚ`, `ℝ`, `ℂ`, `ZMod p`, polynomial rings, ...), rather
than per-carrier adapter files. The bridge points one direction only:
Mathlib classes imply project certificates. The reverse (assembling
Mathlib's bundled data classes from mixins) would be a `def`, not an
instance, and is deliberately not provided -- nothing in this repo
should *depend* on constructing Mathlib structures.

Zero `sorry`, by design: this file is dispatch, like the Mathlib set
backends.
-/

instance {R : Type u} [AddSemigroup R] : AdditiveSemigroupLaws R where
  AddAssociative := add_assoc

instance {R : Type u} [AddCommMagma R] : AdditiveCommutativeLaws R where
  AddCommutative := add_comm

instance {R : Type u} [AddZeroClass R] : AdditiveIdentityLaws R where
  ZeroAdd := zero_add
  AddZero := add_zero

instance {R : Type u} [AddGroup R] : AdditiveInverseLaws R where
  NegAddCancel := neg_add_cancel
  AddNegCancel := add_neg_cancel

instance {R : Type u} [SubtractionMonoid R] :
    SubtractionCompatibilityLaw R where
  SubEqAddNeg := sub_eq_add_neg

instance {R : Type u} [Semigroup R] : MultiplicativeSemigroupLaws R where
  MulAssociative := mul_assoc

instance {R : Type u} [CommMagma R] : MultiplicativeCommutativeLaws R where
  MulCommutative := mul_comm

instance {R : Type u} [MulOneClass R] : MultiplicativeIdentityLaws R where
  OneMul := one_mul
  MulOne := mul_one

instance {R : Type u} [MulZeroClass R] : ZeroAbsorbingLaws R where
  ZeroMul := zero_mul
  MulZero := mul_zero

instance {R : Type u} [Zero R] [One R] [NeZero (1 : R)] :
    NontrivialityLaw R where
  OneNeZero := one_ne_zero

instance {R : Type u} [MulZeroClass R] [NoZeroDivisors R] :
    NoZeroDivisorsLaw R where
  EqZeroOfMulEqZero := fun _ _ h => mul_eq_zero.mp h

instance {R : Type u} [GroupWithZero R] : MultiplicativeInverseLaws R where
  MulInvCancel := fun _ ha => mul_inv_cancel₀ ha
  InvZero := inv_zero

instance {R : Type u} [DivInvMonoid R] : DivisionCompatibilityLaw R where
  DivEqMulInv := div_eq_mul_inv

instance {R : Type u} [Distrib R] : DistributiveLaws R where
  LeftDistributive := fun a b c => left_distrib a b c
  RightDistributive := fun a b c => right_distrib a b c

/-!
Shortcut instances at the bundle level. The mixin bridges above already
make every bundle *derivable*, but instance search through the
`class abbrev` conjunctions re-walks Mathlib's hierarchy per component;
these one-hop shortcuts keep synthesis instant at use sites.
-/

instance {R : Type u} [Semiring R] : SemiringLaws R := ⟨⟩

instance {R : Type u} [CommSemiring R] : CommutativeSemiringLaws R := ⟨⟩

instance {R : Type u} [Ring R] : RingLaws R := ⟨⟩

instance {R : Type u} [CommRing R] : CommutativeRingLaws R := ⟨⟩

instance {R : Type u} [CommRing R] [IsDomain R] : IntegralDomainLaws R := ⟨⟩

instance {R : Type u} [Field R] : FieldLaws R := ⟨⟩

instance {R : Type u} [Field R] [LinearOrder R] [IsStrictOrderedRing R] :
    OrderedFieldLaws R := ⟨⟩

/-!
Certified carriers, as compile-time checks that the bridge composes all
the way up the bundles.
-/

example : CommutativeSemiringLaws Nat := inferInstance
example : CommutativeRingLaws Int := inferInstance
example : IntegralDomainLaws Int := inferInstance
example : FieldLaws Rat := inferInstance
example : OrderedFieldLaws Rat := inferInstance
example : FieldLaws Real := inferInstance
example : OrderedFieldLaws Real := inferInstance
example : CompleteOrderedFieldLaws Real (Set Real) := ⟨inferInstance, inferInstance⟩
example : FieldLaws Complex := inferInstance
example : OrderDiscretenessLaw Int := inferInstance
example : DenseOrderLaw Rat := inferInstance
example : DenseOrderLaw Real := inferInstance

end LRA.AlgebraicStructures
