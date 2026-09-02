import Mathlib.Algebra.Order.Field.Defs
import Mathlib.Data.Real.Basic
import Mathlib.Data.Real.Archimedean
import Mathlib.Data.Complex.Basic
import Mathlib.Data.Rat.Defs
import LRA.AlgebraicStructures.Semigroup.Constructions.Mathlib.Laws
import LRA.AlgebraicStructures.AdditiveSemigroup.Constructions.Mathlib.Laws
import LRA.AlgebraicStructures.CommutativeRing.Constructions.Mathlib.Laws
import LRA.AlgebraicStructures.Field.Constructions.Mathlib.Laws
import LRA.AlgebraicStructures.IntegralDomain.Constructions.Mathlib.Laws
import LRA.AlgebraicStructures.NontrivialRing.Constructions.Mathlib.Laws
import LRA.AlgebraicStructures.OrderedField.Constructions.Mathlib.Laws
import LRA.AlgebraicStructures.CommutativeSemiring.Interface.Laws.Definition
import LRA.AlgebraicStructures.CompleteOrderedField.Constructions.Mathlib.Laws
import LRA.AlgebraicStructures.DiscreteInteger.Interface.Laws.Definition
import LRA.Order.Interop.Mathlib.Certificates

namespace LRA.AlgebraicStructures

open LRA.Order

universe u

-- `AdditiveSemigroupLaws` bridge moved to
-- `AdditiveSemigroup/Constructions/Mathlib/Laws.lean` (per-structure Constructions,
-- not this shared file) as part of the AdditiveSemigroup reorg. Nonemptiness is now
-- an ambient `[Nonempty R]` parameter of `AdditiveSemigroupLaws` itself (not a stored
-- field), which this file's callers don't need to know about directly.

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
instance {R : Type u} [CommMagma R] : MultiplicativeCommutativeLaws R where
  MulCommutative := mul_comm
instance {R : Type u} [MulOneClass R] : MultiplicativeIdentityLaws R where
  OneMul := one_mul
  MulOne := mul_one
instance {R : Type u} [MulZeroClass R] : ZeroAbsorbingLaws R where
  ZeroMul := zero_mul
  MulZero := mul_zero
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
example : CommutativeRingLaws Int := inferInstance
example : IntegralDomainLaws Int := inferInstance
example : FieldLaws Rat := inferInstance
example : OrderedFieldLaws Rat := inferInstance
example : FieldLaws Real := inferInstance
example : OrderedFieldLaws Real := inferInstance
example : CompleteOrderedFieldLaws Real (Set Real) :=
  by
    simpa using
      (LRA.AlgebraicStructures.ofConditionallyCompleteLinearOrder (R := Real))
example : FieldLaws Complex := inferInstance
example : OrderDiscretenessLaw Int := inferInstance
example : DenseOrderLaw Rat := inferInstance
example : DenseOrderLaw Real := inferInstance

end LRA.AlgebraicStructures
