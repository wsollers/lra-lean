import Mathlib.Order.BooleanAlgebra.Defs
import LRA.AlgebraicStructures.BooleanAlgebra.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.BooleanAlgebra.Examples

/-- `Prop` as a Boolean algebra: `∨`, `∧`, `¬`, `False`, `True`, free via
Mathlib's native `BooleanAlgebra Prop` instance and the subject-local bridge. -/
example :
    LRA.AlgebraicStructures.BooleanAlgebraLaws
      (Carrier := Prop) (· ⊔ ·) (· ⊓ ·) Compl.compl ⊥ ⊤ :=
  LRA.AlgebraicStructures.ofBooleanAlgebra

end LRA.AlgebraicStructures.BooleanAlgebra.Examples
