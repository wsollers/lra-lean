import LRA.VolumeI.Map.Operation.Laws.Idempotent.Definition

namespace LRA.Map.Operation.Laws.Idempotent

open LRA.Map.Operation

universe u

/-- Failure of idempotence for a binary endo-operation. -/
def FailsIdempotent {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  Not (Idempotent operation)

/-- Natural-number addition as a concrete idempotence failure. -/
def NaturalAddition : BinaryEndoOperation Nat :=
  fun left right => left + right

/--
**[Failure Mode — NaturalAdditionFailsIdempotent]**

Natural-number addition is not idempotent.
-/
theorem NaturalAdditionFailsIdempotent :
    FailsIdempotent NaturalAddition := by
  sorry

end LRA.Map.Operation.Laws.Idempotent
