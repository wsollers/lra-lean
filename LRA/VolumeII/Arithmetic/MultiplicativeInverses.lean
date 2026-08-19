-- LRA/VolumeII/Arithmetic/MultiplicativeInverses.lean
-- Elementary multiplicative inverse facts over rationals.

import LRA.VolumeII.Switches.NumberSystems
import LRA.AlgebraicStructures

namespace LRA.NumberSystems.Arithmetic.MultiplicativeInverses

/-!
Volume II label: basic-arithmetic-multiplicative-inverses
Lean module: LRA.NumberSystems.Arithmetic.MultiplicativeInverses
Verification status: checked Mathlib-backed proofs
-/

/--
**[Abbrev — Q]**

Mathematical statement (Lean): `abbrev Q`.


Logical form:

```lean
abbrev Q := Rat
```
-/
abbrev Q := Rat


/-- Every nonzero active rational has a two-sided multiplicative inverse.

Mathematical statement (Lean): `theorem NonzeroHasMultiplicativeInverse {a : Q} (a_nonzero : a ≠ 0) : a⁻¹ * a = 1 ∧ a * a⁻¹ = 1`.

*Proof status:* proof pending


Logical form:

```lean
theorem NonzeroHasMultiplicativeInverse {a : Q} (a_nonzero : a ≠ 0) :
    a⁻¹ * a = 1 ∧ a * a⁻¹ = 1
```
-/
theorem NonzeroHasMultiplicativeInverse {a : Q} (a_nonzero : a ≠ 0) :
    a⁻¹ * a = 1 ∧ a * a⁻¹ = 1 := by
  sorry


/-- If `a*b = 1`, then `b` is the multiplicative inverse of nonzero `a`.

Mathematical statement (Lean): `theorem RightInverseIsInverse {a b : Q} (a_nonzero : a ≠ 0) (right_inverse : a * b = 1) : b = a⁻¹`.

*Proof status:* proof pending


Logical form:

```lean
theorem RightInverseIsInverse {a b : Q}
    (a_nonzero : a ≠ 0)
    (right_inverse : a * b = 1) :
    b = a⁻¹
```
-/
theorem RightInverseIsInverse {a b : Q}
    (a_nonzero : a ≠ 0)
    (right_inverse : a * b = 1) :
    b = a⁻¹ := by
  sorry


/-- Active rationals have no zero divisors.

Mathematical statement (Lean): `theorem MulEqZeroImpliesZero {a b : Q} (product_zero : a * b = 0) : a = 0 ∨ b = 0`.

*Proof status:* proof pending


Logical form:

```lean
theorem MulEqZeroImpliesZero {a b : Q}
    (product_zero : a * b = 0) :
    a = 0 ∨ b = 0
```
-/
theorem MulEqZeroImpliesZero {a b : Q}
    (product_zero : a * b = 0) :
    a = 0 ∨ b = 0 := by
  sorry


/-- If `a` is nonzero and `a*b = 0`, then `b = 0`.

Mathematical statement (Lean): `theorem EqZeroOfNonzeroMulEqZero {a b : Q} (a_nonzero : a ≠ 0) (product_zero : a * b = 0) : b = 0`.

*Proof status:* proof pending


Logical form:

```lean
theorem EqZeroOfNonzeroMulEqZero {a b : Q}
    (a_nonzero : a ≠ 0)
    (product_zero : a * b = 0) :
    b = 0
```
-/
theorem EqZeroOfNonzeroMulEqZero {a b : Q}
    (a_nonzero : a ≠ 0)
    (product_zero : a * b = 0) :
    b = 0 := by
  sorry

end LRA.NumberSystems.Arithmetic.MultiplicativeInverses
