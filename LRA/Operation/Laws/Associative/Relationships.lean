import LRA.Operation.Laws.Associative.Theorems

namespace LRA.Operation.Laws.Associative

open LRA.Operation

universe u

/-- Associativity explains parenthesis movement, not operand exchange. -/
theorem Associative.preserves_left_nested_shape {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third : Carrier) :
    operation (operation first second) third =
      operation first (operation second third) := by
  sorry

end LRA.Operation.Laws.Associative
