import LRA.VolumeI.Map.Operation.Laws.Commutative.Definition

namespace LRA.Map.Operation.Laws.Commutative

open LRA.Map.Operation

universe u

/-- Failure of commutativity for a binary endo-operation. -/
def FailsCommutative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  Not (Commutative operation)

/-- Natural-number subtraction as a concrete non-commutative operation. -/
def NaturalSubtraction : BinaryEndoOperation Nat :=
  fun left right => left - right

/--
**[Failure Mode — NaturalSubtractionFailsCommutative]**

Natural-number subtraction is not commutative.
-/
theorem NaturalSubtractionFailsCommutative :
    FailsCommutative NaturalSubtraction := by
  sorry

end LRA.Map.Operation.Laws.Commutative
