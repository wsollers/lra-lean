import LRA.Operation.Definition

namespace LRA.Operation.Laws.Idempotent

open LRA.Operation

universe u

                                              
def Idempotent {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  forall element, operation element element = element

end LRA.Operation.Laws.Idempotent
