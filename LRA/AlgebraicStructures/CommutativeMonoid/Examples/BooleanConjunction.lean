import Mathlib.Algebra.Ring.BooleanRing
import LRA.AlgebraicStructures.CommutativeMonoid.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.CommutativeMonoid.Examples

/-- `(𝔹, ∧, True)` — Booleans under conjunction, with `True` as identity.
Free via the generic Mathlib bridge: Mathlib gives `Bool` a full
`BooleanRing` instance (`Mathlib.Algebra.Ring.BooleanRing`) with `Mul := and`,
`One := true`, hence a `CommMonoid`. -/
example : LRA.AlgebraicStructures.CommutativeMonoidLaws Bool := inferInstance

end LRA.AlgebraicStructures.CommutativeMonoid.Examples
