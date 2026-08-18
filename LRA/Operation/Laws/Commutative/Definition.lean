import LRA.Operation.Definition

namespace LRA.Operation.Laws.Commutative

open LRA.Operation

universe u

/-- Commutativity of a binary endo-operation. -/
def Commutative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall first second, operation first second = operation second first

end LRA.Operation.Laws.Commutative
