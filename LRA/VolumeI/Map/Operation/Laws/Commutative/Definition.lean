import LRA.VolumeI.Map.Operation.Definition

namespace LRA.Map.Operation.Laws.Commutative

open LRA.Map.Operation

universe u

/--
Commutativity of a binary endo-operation.
-/
def Commutative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall first second, operation first second = operation second first

end LRA.Map.Operation.Laws.Commutative
