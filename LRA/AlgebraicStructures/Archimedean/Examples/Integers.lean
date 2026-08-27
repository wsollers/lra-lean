import Mathlib.Algebra.Order.Archimedean.Basic
import LRA.AlgebraicStructures.Archimedean.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.Archimedean.Examples

/-- `ℤ` is Archimedean — for the ordered additive group case, this is the
textbook example: given any `a > 0` and any `b`, enough copies of `a` eventually
exceed `b`. Comes for free from the Mathlib bridge, since `Int` is already a
Mathlib `Archimedean` ordered ring. -/
example : LRA.AlgebraicStructures.ArchimedeanLaw Int := inferInstance

end LRA.AlgebraicStructures.Archimedean.Examples
