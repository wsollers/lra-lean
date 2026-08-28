import Mathlib.Algebra.Group.Int.Defs
import LRA.AlgebraicStructures.AdditiveGroup.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.AdditiveGroup.Examples

/-- `(ℤ, +, 0, -)` — free directly on `Int` itself: no wrapper needed here
(unlike `Group.Examples.IntegersUnderAddition`), since this subject already
uses additive notation and `Int` already carries the native `Add`/`Neg`/
`OfNat _ 0` instances `AdditiveGroupLaws` is stated in terms of. `Int` is an
`AddGroup` in Mathlib, so this comes for free via the generic bridge. -/
example : LRA.AlgebraicStructures.AdditiveGroupLaws Int := inferInstance

end LRA.AlgebraicStructures.AdditiveGroup.Examples
