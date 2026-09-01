import Mathlib.Order.BooleanAlgebra.Defs
import LRA.AlgebraicStructures.BooleanAlgebra.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.BooleanAlgebra.Examples

/-- `Bool` as a Boolean algebra, free via Mathlib's native `BooleanAlgebra Bool`
instance and the subject-local bridge. -/
example :
    LRA.AlgebraicStructures.BooleanAlgebraLaws
      (Carrier := Bool) (· ⊔ ·) (· ⊓ ·) Compl.compl ⊥ ⊤ :=
  LRA.AlgebraicStructures.ofBooleanAlgebra

end LRA.AlgebraicStructures.BooleanAlgebra.Examples
