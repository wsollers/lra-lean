import LRA.Operation.Laws.Idempotent.Definition

namespace LRA.Operation.Laws.Idempotent

open LRA.Operation

universe u

                                                          
def FailsIdempotent {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  Not (Idempotent operation)

                                                                 
def NaturalAddition : BinaryEndoOperation Nat :=
  fun left right => left + right

theorem NaturalAdditionFailsIdempotent :
    FailsIdempotent NaturalAddition := by
  sorry

end LRA.Operation.Laws.Idempotent
