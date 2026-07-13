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
  add_assoc : ∀ x y z : Z.carrier, (x + y) + z = x + (y + z)
  add_comm : ∀ x y : Z.carrier, x + y = y + x
  zero_add : ∀ x : Z.carrier, 0 + x = x
  add_zero : ∀ x : Z.carrier, x + 0 = x
  neg_add_self : ∀ x : Z.carrier, -x + x = 0
  add_neg_self : ∀ x : Z.carrier, x + -x = 0
  neg_neg : ∀ x : Z.carrier, -(-x) = x
  neg_add : ∀ x y : Z.carrier, -(x + y) = -x + -y

structure LRAMultiplicativeLaws (Z : LRAZ) : Prop where
  one_mul : ∀ x : Z.carrier, 1 * x = x
  mul_zero : ∀ x : Z.carrier, x * 0 = 0
  zero_mul : ∀ x : Z.carrier, 0 * x = 0
  mul_succ : ∀ x y : Z.carrier, x * Z.succ y = x * y + x
  mul_pred : ∀ x y : Z.carrier, x * Z.pred y = x * y + -x

structure LRARingLaws (Z : LRAZ) : Prop extends
    LRAAdditiveLaws Z, LRAMultiplicativeLaws Z where
  mul_assoc : ∀ x y z : Z.carrier, (x * y) * z = x * (y * z)
  mul_comm : ∀ x y : Z.carrier, x * y = y * x
  distrib_left : ∀ x y z : Z.carrier, x * (y + z) = x * y + x * z
  distrib_right : ∀ x y z : Z.carrier, (x + y) * z = x * z + y * z
  mul_neg : ∀ x y : Z.carrier, x * -y = -(x * y)
  neg_mul : ∀ x y : Z.carrier, -x * y = -(x * y)

structure LRAOrderLaws (Z : LRAZ) : Prop where
  lt_irrefl : ∀ x : Z.carrier, ¬ x < x
  lt_trans : ∀ {x y z : Z.carrier}, x < y → y < z → x < z
  le_refl : ∀ x : Z.carrier, x ≤ x
  le_antisymm : ∀ {x y : Z.carrier}, x ≤ y → y ≤ x → x = y
  lt_trichotomy : ∀ x y : Z.carrier, x < y ∨ x = y ∨ y < x
  add_lt_add_right : ∀ {x y : Z.carrier}, x < y → ∀ z, x + z < y + z

structure LRAOrderedRingLaws (Z : LRAZ) : Prop extends LRARingLaws Z, LRAOrderLaws Z where
  mul_lt_mul_pos_right :
    ∀ {x y z : Z.carrier}, x < y → 0 < z → x * z < y * z

end Integers
end VolumeII
end LRA
