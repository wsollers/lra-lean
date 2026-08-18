import LRA.Operation.Definition

namespace LRA.Operation.Laws.Associative

open LRA.Operation

universe u

/-- Associativity of a binary endo-operation. -/
def Associative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  ∀ first second third,
    operation (operation first second) third =
      operation first (operation second third)

end LRA.Operation.Laws.Associative
