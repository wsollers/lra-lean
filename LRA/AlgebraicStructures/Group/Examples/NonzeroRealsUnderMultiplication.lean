import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.Group.Constructions.Set.ClosedSubset
import LRA.AlgebraicStructures.Monoid.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.Group.Examples

/-- `(ℝ \ {0}, ×)` — the nonzero reals under multiplication, built via the
`ClosedSubset` builder rather than the generic Mathlib bridge: `ℝ` itself is
only a `Monoid` under `×` (`0` has no inverse — `MonoidLaws ℝ` is free via
the generic Mathlib bridge, but `GroupLaws ℝ` would be false), so the group
structure genuinely lives on the *closed subset* excluding `0`, not on `ℝ` as
a whole. Closure (`mul_ne_zero`), identity membership (`one_ne_zero`),
inverse-closure, and inverse-cancellation (`inv_mul_cancel₀`/
`mul_inv_cancel₀`, both needing `x ≠ 0`) are exactly the four hypotheses
`ClosedSubsetGroupLaws` needs. -/
def NonzeroReals : LRA.Set.LRA_Set Real := {x | x ≠ 0}

theorem nonzeroRealsClosedUnderMultiplication :
    ∀ a b, a ∈ NonzeroReals → b ∈ NonzeroReals → a * b ∈ NonzeroReals := by
  sorry

theorem oneIsNonzero : (1 : Real) ∈ NonzeroReals := by
  sorry

theorem nonzeroRealsClosedUnderInverse :
    ∀ a, a ∈ NonzeroReals → a⁻¹ ∈ NonzeroReals := by
  sorry

theorem nonzeroRealsInverseCancel :
    ∀ a, a ∈ NonzeroReals → a⁻¹ * a = 1 ∧ a * a⁻¹ = 1 := by
  sorry

noncomputable instance : Mul {x // x ∈ NonzeroReals} :=
  LRA.AlgebraicStructures.Magma.Constructions.ClosedSubsetMul
    nonzeroRealsClosedUnderMultiplication

noncomputable instance : OfNat {x // x ∈ NonzeroReals} 1 :=
  LRA.AlgebraicStructures.Monoid.Constructions.ClosedSubsetOfNat oneIsNonzero

noncomputable instance : Inv {x // x ∈ NonzeroReals} :=
  LRA.AlgebraicStructures.Group.Constructions.ClosedSubsetInv
    nonzeroRealsClosedUnderInverse

noncomputable instance : Nonempty {x // x ∈ NonzeroReals} :=
  LRA.AlgebraicStructures.Monoid.Constructions.ClosedSubsetNonempty oneIsNonzero

noncomputable instance :
    LRA.AlgebraicStructures.GroupLaws {x // x ∈ NonzeroReals} :=
  LRA.AlgebraicStructures.Group.Constructions.ClosedSubsetGroupLaws
    nonzeroRealsClosedUnderMultiplication oneIsNonzero nonzeroRealsClosedUnderInverse
    nonzeroRealsInverseCancel

end LRA.AlgebraicStructures.Group.Examples
