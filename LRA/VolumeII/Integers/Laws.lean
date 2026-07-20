-- LRA/VolumeII/Integers/Laws.lean
-- Law bundles for common integer implementations.

import LRA.VolumeII.Integers.Interface

namespace LRA
namespace VolumeII
namespace Integers

/-!
Volume II label: integers-law-bundles
Lean module: LRA.VolumeII.Integers.Laws
Verification status: checked interface module

These records are deliberately smaller than Mathlib's algebraic classes. The
algebraic and order laws are generic mixins over carrier operation bundles;
integer-specific successor and discreteness laws are attached only at the
integer layer.
-/

structure AdditiveGroupLaws (additive_structure : AdditiveStructure) : Prop where
  add_assoc : Foundation.Algebra.associative (AdditiveStructure.add additive_structure)
  add_comm : Foundation.Algebra.commutative (AdditiveStructure.add additive_structure)
  zero_add :
    Foundation.Algebra.leftIdentity
      (AdditiveStructure.add additive_structure)
      (AdditiveStructure.zero additive_structure)
  add_zero :
    Foundation.Algebra.rightIdentity
      (AdditiveStructure.add additive_structure)
      (AdditiveStructure.zero additive_structure)
  neg_add_self :
    Foundation.Algebra.leftInverse
      (AdditiveStructure.add additive_structure)
      (AdditiveStructure.zero additive_structure)
      (AdditiveStructure.neg additive_structure)
  add_neg_self :
    Foundation.Algebra.rightInverse
      (AdditiveStructure.add additive_structure)
      (AdditiveStructure.zero additive_structure)
      (AdditiveStructure.neg additive_structure)
  neg_neg :
    ∀ x : additive_structure.carrier,
      AdditiveStructure.neg additive_structure
          (AdditiveStructure.neg additive_structure x) =
        x
  neg_add :
    ∀ x y : additive_structure.carrier,
      AdditiveStructure.neg additive_structure
          (AdditiveStructure.add additive_structure x y) =
        AdditiveStructure.add additive_structure
          (AdditiveStructure.neg additive_structure x)
          (AdditiveStructure.neg additive_structure y)

structure MultiplicativeMonoidLaws
    (multiplicative_structure : MultiplicativeStructure) : Prop where
  one_mul :
    Foundation.Algebra.leftIdentity
      (MultiplicativeStructure.mul multiplicative_structure)
      (MultiplicativeStructure.one multiplicative_structure)
  mul_one :
    Foundation.Algebra.rightIdentity
      (MultiplicativeStructure.mul multiplicative_structure)
      (MultiplicativeStructure.one multiplicative_structure)
  mul_zero :
    Foundation.Algebra.rightAbsorbing
      (MultiplicativeStructure.mul multiplicative_structure)
      (MultiplicativeStructure.zero multiplicative_structure)
  zero_mul :
    Foundation.Algebra.leftAbsorbing
      (MultiplicativeStructure.mul multiplicative_structure)
      (MultiplicativeStructure.zero multiplicative_structure)
  mul_assoc :
    Foundation.Algebra.associative
      (MultiplicativeStructure.mul multiplicative_structure)
  mul_comm :
    Foundation.Algebra.commutative
      (MultiplicativeStructure.mul multiplicative_structure)

structure RingLaws (ring_structure : RingStructure) : Prop extends
    AdditiveGroupLaws ring_structure.toAdditiveStructure,
    MultiplicativeMonoidLaws ring_structure.toMultiplicativeStructure where
  distrib_left :
    Foundation.Algebra.leftDistributive
      ring_structure.mul
      ring_structure.add
  distrib_right :
    Foundation.Algebra.rightDistributive
      ring_structure.mul
      ring_structure.add
  mul_neg :
    ∀ x y : ring_structure.carrier,
      ring_structure.mul x (ring_structure.neg y) =
        ring_structure.neg (ring_structure.mul x y)
  neg_mul :
    ∀ x y : ring_structure.carrier,
      ring_structure.mul (ring_structure.neg x) y =
        ring_structure.neg (ring_structure.mul x y)

structure OrderLaws (ordered_structure : OrderedStructure) : Prop where
  lt_irrefl : Foundation.Order.irreflexive (OrderedStructure.lt ordered_structure)
  lt_trans : Foundation.Order.transitive (OrderedStructure.lt ordered_structure)
  le_refl : Foundation.Order.reflexive (OrderedStructure.le ordered_structure)
  le_antisymm : Foundation.Order.antisymmetric (OrderedStructure.le ordered_structure)
  lt_trichotomy :
    ∀ x y : ordered_structure.carrier,
      OrderedStructure.lt ordered_structure x y ∨
      x = y ∨
      OrderedStructure.lt ordered_structure y x

structure OrderedRingCompatibilityLaws
    (ordered_ring_structure : OrderedRingStructure) : Prop where
  add_lt_add_right :
    Foundation.Order.strictlyPreservesRightTranslation
      ordered_ring_structure.lt
      ordered_ring_structure.add
  mul_lt_mul_pos_right :
    Foundation.Order.preservesPositiveRightMultiplication
      ordered_ring_structure.lt
      ordered_ring_structure.mul
      ordered_ring_structure.zero

structure OrderedRingLaws (ordered_ring_structure : OrderedRingStructure) : Prop
    extends
      RingLaws ordered_ring_structure.toRingStructure,
      OrderLaws ordered_ring_structure.toOrderedStructure,
      OrderedRingCompatibilityLaws ordered_ring_structure where

structure IntegerSuccessorLaws (integer_structure : IntegerStructure) : Prop where
  pred_succ :
    ∀ x : integer_structure.carrier,
      integer_structure.pred (integer_structure.succ x) = x
  succ_pred :
    ∀ x : integer_structure.carrier,
      integer_structure.succ (integer_structure.pred x) = x
  succ_injective :
    ∀ ⦃x y : integer_structure.carrier⦄,
      integer_structure.succ x = integer_structure.succ y → x = y
  pred_injective :
    ∀ ⦃x y : integer_structure.carrier⦄,
      integer_structure.pred x = integer_structure.pred y → x = y

structure IntegerMultiplicationSuccessorLaws
    (integer_structure : IntegerStructure) : Prop where
  mul_succ :
    ∀ x y : integer_structure.carrier,
      integer_structure.mul x (integer_structure.succ y) =
        integer_structure.add
          (integer_structure.mul x y)
          x
  mul_pred :
    ∀ x y : integer_structure.carrier,
      integer_structure.mul x (integer_structure.pred y) =
        integer_structure.add
          (integer_structure.mul x y)
          (integer_structure.neg x)

structure IntegerLaws (integer_structure : IntegerStructure) : Prop extends
    OrderedRingLaws integer_structure.toOrderedRingStructure,
    IntegerSuccessorLaws integer_structure,
    IntegerMultiplicationSuccessorLaws integer_structure where

abbrev IntegerAdditiveLaws (integer_structure : IntegerStructure) : Prop :=
  AdditiveGroupLaws integer_structure.toAdditiveStructure

abbrev IntegerMultiplicativeLaws (integer_structure : IntegerStructure) : Prop :=
  MultiplicativeMonoidLaws integer_structure.toMultiplicativeStructure

abbrev IntegerRingLaws (integer_structure : IntegerStructure) : Prop :=
  RingLaws integer_structure.toRingStructure

abbrev IntegerOrderLaws (integer_structure : IntegerStructure) : Prop :=
  OrderLaws integer_structure.toOrderedStructure

abbrev IntegerOrderedRingCompatibilityLaws
    (integer_structure : IntegerStructure) : Prop :=
  OrderedRingCompatibilityLaws integer_structure.toOrderedRingStructure

abbrev IntegerOrderedRingLaws (integer_structure : IntegerStructure) : Prop :=
  OrderedRingLaws integer_structure.toOrderedRingStructure

end Integers
end VolumeII
end LRA
