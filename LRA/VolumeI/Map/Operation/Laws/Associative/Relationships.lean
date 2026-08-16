import LRA.VolumeI.Map.Operation.Laws.Associative.Theorems
import LRA.VolumeI.Map.Operation.Laws.EquationalLogic.Theorems

namespace LRA.Map.Operation.Laws.Associative

open LRA.Map.Operation

universe u

/--
**[Theorem — Associative.preserves_left_nested_shape]**

Associativity explains parenthesis movement, not operand exchange.
-/
theorem Associative.preserves_left_nested_shape {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : Associative operation)
    (first second third : Carrier) :
    operation (operation first second) third =
      operation first (operation second third) := by
  sorry

/--
**[Theorem — Associative.equality_requirements]**

An associative operation consumes the standard equality relation: the identity
relation is an equivalence relation and the operation respects it.
-/
theorem Associative.equality_requirements {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (_law : Associative operation) :
    LRA.Map.Operation.Laws.EquationalLogic.BinaryOperationEqualityRequirements
      operation :=
  LRA.Map.Operation.Laws.EquationalLogic.BinaryOperation.equality_requirements
    operation

end LRA.Map.Operation.Laws.Associative
