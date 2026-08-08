-- LRA/VolumeII/BasicArithmetic/MultiplicativeInverses.lean
-- Elementary multiplicative inverse facts over the active rational switch.

import LRA.VolumeII.Switches.NumberSystems

namespace LRA.VolumeII.BasicArithmetic.MultiplicativeInverses

/-!
Volume II label: basic-arithmetic-multiplicative-inverses
Lean module: LRA.VolumeII.BasicArithmetic.MultiplicativeInverses
Verification status: checked Mathlib-backed proofs
-/

/--
**[Abbrev — Q]**

Mathematical statement (Lean): `abbrev Q`.
-/
abbrev Q := LRA.VolumeII.Switches.NumberSystems.RationalNumbers.Q


/-- Every nonzero active rational has a two-sided multiplicative inverse.

Mathematical statement (Lean): `theorem NonzeroHasMultiplicativeInverse {a : Q} (a_nonzero : a ≠ 0) : a⁻¹ * a = 1 ∧ a * a⁻¹ = 1`.

*Proof status:* proof pending
-/
theorem NonzeroHasMultiplicativeInverse {a : Q} (a_nonzero : a ≠ 0) :
    a⁻¹ * a = 1 ∧ a * a⁻¹ = 1 := by
  sorry


/-- If `a*b = 1`, then `b` is the multiplicative inverse of nonzero `a`.

Mathematical statement (Lean): `theorem RightInverseIsInverse {a b : Q} (a_nonzero : a ≠ 0) (right_inverse : a * b = 1) : b = a⁻¹`.

*Proof status:* proof pending
-/
theorem RightInverseIsInverse {a b : Q}
    (a_nonzero : a ≠ 0)
    (right_inverse : a * b = 1) :
    b = a⁻¹ := by
  sorry


/-- Active rationals have no zero divisors.

Mathematical statement (Lean): `theorem MulEqZeroImpliesZero {a b : Q} (product_zero : a * b = 0) : a = 0 ∨ b = 0`.

*Proof status:* proof pending
-/
theorem MulEqZeroImpliesZero {a b : Q}
    (product_zero : a * b = 0) :
    a = 0 ∨ b = 0 := by
  sorry


/-- If `a` is nonzero and `a*b = 0`, then `b = 0`.

Mathematical statement (Lean): `theorem EqZeroOfNonzeroMulEqZero {a b : Q} (a_nonzero : a ≠ 0) (product_zero : a * b = 0) : b = 0`.

*Proof status:* proof pending
-/
theorem EqZeroOfNonzeroMulEqZero {a b : Q}
    (a_nonzero : a ≠ 0)
    (product_zero : a * b = 0) :
    b = 0 := by
  sorry

end LRA.VolumeII.BasicArithmetic.MultiplicativeInverses
