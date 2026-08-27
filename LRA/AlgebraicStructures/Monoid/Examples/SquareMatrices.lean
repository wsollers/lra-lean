import Mathlib.Data.Matrix.Mul
import Mathlib.Data.Real.Basic
import LRA.AlgebraicStructures.Monoid.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.Monoid.Examples

/-- `(M_n(ℝ), ×, I_n)` — square matrices under matrix multiplication, with the
identity matrix as `1`. Non-commutative for `n ≥ 2`, unlike every other
example in this file — included anyway since `MonoidLaws` doesn't assume
commutativity (that's `CommutativeMonoid`'s addition, tier 3). Free via the
generic Mathlib bridge: `Matrix (Fin n) (Fin n) ℝ` is already a `Monoid` in
Mathlib for any `n`, including `n = 0` (vacuously, via the empty function
type). -/
example (n : Nat) :
    LRA.AlgebraicStructures.MonoidLaws (Matrix (Fin n) (Fin n) Real) :=
  inferInstance

end LRA.AlgebraicStructures.Monoid.Examples
