import Mathlib.Algebra.Group.Nat.Defs
import LRA.AlgebraicStructures.Monoid.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.Monoid.Examples

/-- `(ℕ, ×, 1)` — free directly on `Nat` itself (no wrapper needed, unlike the
additive example): `Nat` already carries the native `Mul`/`OfNat _ 1`
instances this subject's `MonoidLaws` is stated in terms of, and `Nat` is a
`Monoid` in Mathlib, so this comes for free via
`Constructions/Mathlib/Laws.lean`'s generic bridge. -/
example : LRA.AlgebraicStructures.MonoidLaws Nat := inferInstance

end LRA.AlgebraicStructures.Monoid.Examples
