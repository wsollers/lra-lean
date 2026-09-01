import Mathlib.Data.Complex.Basic
import LRA.AlgebraicStructures.Field.Constructions.Mathlib.Laws

namespace LRA.AlgebraicStructures.Field.Examples

/-- `Complex` gives a standard non-ordered field example through Mathlib without
adding a wrapper carrier. -/
example : LRA.AlgebraicStructures.FieldLaws Complex := inferInstance

end LRA.AlgebraicStructures.Field.Examples
