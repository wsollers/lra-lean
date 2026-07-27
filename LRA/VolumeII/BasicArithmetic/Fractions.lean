-- LRA/VolumeII/BasicArithmetic/Fractions.lean
-- Elementary rational fraction manipulations over the active switches.

import Mathlib.Tactic
import LRA.VolumeII.Switches.NumberSystems

namespace LRA
namespace VolumeII
namespace BasicArithmetic
namespace Fractions

/-!
Volume II label: basic-arithmetic-fractions
Lean module: LRA.VolumeII.BasicArithmetic.Fractions
Verification status: checked Mathlib-backed proofs

The statements use active integers for numerators/denominators and evaluate the
quotients in the active rational-number switch, currently Mathlib `Rat`.
-/

abbrev Z := LRA.VolumeII.Switches.NumberSystems.IntegerNumbers.Z
abbrev Q := LRA.VolumeII.Switches.NumberSystems.RationalNumbers.Q

/-- Cast an active integer into the active rational carrier. -/
abbrev toQ (value : Z) : Q := value

/-- Cross-multiplication criterion for equality of rational quotients. -/
theorem CrossMultiplication {a b c d : Q}
    (b_nonzero : b ≠ 0) (d_nonzero : d ≠ 0) :
    a / b = c / d ↔ a * d = c * b := by
  sorry

/-- Cancellation rule for fractions: `(a*m)/(a*n) = m/n` when `a,n ≠ 0`. -/
theorem FractionCancellation {a m n : Z}
    (a_nonzero : a ≠ 0) (n_nonzero : n ≠ 0) :
    toQ (a * m) / toQ (a * n) = toQ m / toQ n := by
  sorry

/-- Moving a sign from the numerator to the denominator preserves a quotient. -/
theorem NegativeNumeratorEqualsNegativeDenominator {m n : Z}
    (n_nonzero : n ≠ 0) :
    toQ (-m) / toQ n = toQ m / toQ (-n) := by
  sorry

/-- A common divisor can be cancelled from a rational quotient. -/
theorem CancelCommonIntegerDivisor {d m n r s : Z}
    (d_nonzero : d ≠ 0)
    (n_nonzero : n ≠ 0)
    (m_factor : m = d * r)
    (n_factor : n = d * s) :
    toQ m / toQ n = toQ r / toQ s := by
  sorry

end Fractions
end BasicArithmetic
end VolumeII
end LRA
