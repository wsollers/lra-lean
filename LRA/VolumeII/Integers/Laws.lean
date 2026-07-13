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

These records are deliberately smaller than Mathlib's algebraic classes. They
use Mathlib-compatible operation notation, but they let each Volume II source
variant expose checked progress incrementally.
-/

structure LRASuccessorLaws (Z : LRAZ) : Prop where
  pred_succ : ∀ x : Z.carrier, Z.pred (Z.succ x) = x
  succ_pred : ∀ x : Z.carrier, Z.succ (Z.pred x) = x
  succ_injective : ∀ ⦃x y : Z.carrier⦄, Z.succ x = Z.succ y → x = y
  pred_injective : ∀ ⦃x y : Z.carrier⦄, Z.pred x = Z.pred y → x = y

structure LRAAdditiveLaws (Z : LRAZ) : Prop where
  add_assoc : Foundation.Algebra.associative (LRAZ.add Z)
  add_comm : Foundation.Algebra.commutative (LRAZ.add Z)
  zero_add : Foundation.Algebra.leftIdentity (LRAZ.add Z) (LRAZ.zero Z)
  add_zero : Foundation.Algebra.rightIdentity (LRAZ.add Z) (LRAZ.zero Z)
  neg_add_self :
    Foundation.Algebra.leftInverse (LRAZ.add Z) (LRAZ.zero Z) (LRAZ.neg Z)
  add_neg_self :
    Foundation.Algebra.rightInverse (LRAZ.add Z) (LRAZ.zero Z) (LRAZ.neg Z)
  neg_neg : ∀ x : Z.carrier, -(-x) = x
  neg_add : ∀ x y : Z.carrier, -(x + y) = -x + -y

structure LRAMultiplicativeLaws (Z : LRAZ) : Prop where
  one_mul : Foundation.Algebra.leftIdentity (LRAZ.mul Z) (LRAZ.one Z)
  mul_zero : Foundation.Algebra.rightAbsorbing (LRAZ.mul Z) (LRAZ.zero Z)
  zero_mul : Foundation.Algebra.leftAbsorbing (LRAZ.mul Z) (LRAZ.zero Z)
  mul_succ : ∀ x y : Z.carrier, x * Z.succ y = x * y + x
  mul_pred : ∀ x y : Z.carrier, x * Z.pred y = x * y + -x

structure LRARingLaws (Z : LRAZ) : Prop extends
    LRAAdditiveLaws Z, LRAMultiplicativeLaws Z where
  mul_assoc : Foundation.Algebra.associative (LRAZ.mul Z)
  mul_comm : Foundation.Algebra.commutative (LRAZ.mul Z)
  distrib_left : Foundation.Algebra.leftDistributive (LRAZ.mul Z) (LRAZ.add Z)
  distrib_right : Foundation.Algebra.rightDistributive (LRAZ.mul Z) (LRAZ.add Z)
  mul_neg : ∀ x y : Z.carrier, x * -y = -(x * y)
  neg_mul : ∀ x y : Z.carrier, -x * y = -(x * y)

structure LRAOrderLaws (Z : LRAZ) : Prop where
  lt_irrefl : Foundation.Order.irreflexive (LRAZ.lt Z)
  lt_trans : Foundation.Order.transitive (LRAZ.lt Z)
  le_refl : Foundation.Order.reflexive (LRAZ.le Z)
  le_antisymm : Foundation.Order.antisymmetric (LRAZ.le Z)
  lt_trichotomy : ∀ x y : Z.carrier, x < y ∨ x = y ∨ y < x
  add_lt_add_right :
    Foundation.Order.strictlyPreservesRightTranslation (LRAZ.lt Z) (LRAZ.add Z)

structure LRAOrderedRingLaws (Z : LRAZ) : Prop extends LRARingLaws Z, LRAOrderLaws Z where
  mul_lt_mul_pos_right :
    Foundation.Order.preservesPositiveRightMultiplication
      (LRAZ.lt Z) (LRAZ.mul Z) (LRAZ.zero Z)

end Integers
end VolumeII
end LRA
