import Mathlib.Data.ZMod.Defs
import LRA.AlgebraicStructures.AdditiveGroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.AdditiveGroup.Examples

/-- `(ℤ/nℤ, +, 0, -)` — Mathlib's own `ZMod n`, free via the generic Mathlib
bridge (`ZMod n` is a `CommRing`, hence an `AddGroup`, for every `n`
including `n = 0`, where `ZMod 0 := ℤ`). -/
example (n : Nat) : LRA.AlgebraicStructures.AdditiveGroupLaws (ZMod n) := inferInstance

end LRA.AlgebraicStructures.AdditiveGroup.Examples
