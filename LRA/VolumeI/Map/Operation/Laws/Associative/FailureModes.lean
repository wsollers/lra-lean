import LRA.VolumeI.Map.Operation.Laws.Associative.Definition

namespace LRA.Map.Operation.Laws.Associative

open LRA.Map.Operation

universe u

/-- Failure of associativity for a binary endo-operation. -/
def FailsAssociative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  Not (Associative operation)

/-- Truncated natural-number subtraction as a concrete non-associative operation. -/
def NaturalSubtraction : BinaryEndoOperation Nat :=
  fun left right => left - right

/--
**[Failure Mode — NaturalSubtractionFailsAssociative]**

Natural-number subtraction is not associative.
-/
theorem NaturalSubtractionFailsAssociative :
    FailsAssociative NaturalSubtraction := by
  sorry

end LRA.Map.Operation.Laws.Associative
