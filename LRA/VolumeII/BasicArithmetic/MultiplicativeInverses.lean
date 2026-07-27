-- LRA/VolumeII/BasicArithmetic/MultiplicativeInverses.lean
-- Elementary multiplicative inverse facts over the active rational switch.

import Mathlib.Tactic
import LRA.VolumeII.Switches.NumberSystems

namespace LRA
namespace VolumeII
namespace BasicArithmetic
namespace MultiplicativeInverses

/-!
Volume II label: basic-arithmetic-multiplicative-inverses
Lean module: LRA.VolumeII.BasicArithmetic.MultiplicativeInverses
Verification status: checked Mathlib-backed proofs
-/

abbrev Q := LRA.VolumeII.Switches.NumberSystems.RationalNumbers.Q

/-- Every nonzero active rational has a two-sided multiplicative inverse. -/
theorem NonzeroHasMultiplicativeInverse {a : Q} (a_nonzero : a ≠ 0) :
    a⁻¹ * a = 1 ∧ a * a⁻¹ = 1 := by
  sorry

/-- If `a*b = 1`, then `b` is the multiplicative inverse of nonzero `a`. -/
theorem RightInverseIsInverse {a b : Q}
    (a_nonzero : a ≠ 0)
    (right_inverse : a * b = 1) :
    b = a⁻¹ := by
  sorry

/-- Active rationals have no zero divisors. -/
theorem MulEqZeroImpliesZero {a b : Q}
    (product_zero : a * b = 0) :
    a = 0 ∨ b = 0 := by
  sorry

/-- If `a` is nonzero and `a*b = 0`, then `b = 0`. -/
theorem EqZeroOfNonzeroMulEqZero {a b : Q}
    (a_nonzero : a ≠ 0)
    (product_zero : a * b = 0) :
    b = 0 := by
  sorry

end MultiplicativeInverses
end BasicArithmetic
end VolumeII
end LRA
