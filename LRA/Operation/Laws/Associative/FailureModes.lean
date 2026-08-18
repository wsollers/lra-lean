import LRA.Operation.Laws.Associative.Definition

namespace LRA.Operation.Laws.Associative

open LRA.Operation

universe u

/-- Failure of associativity for a binary endo-operation. -/
def FailsAssociative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  ¬ Associative operation

/-- Truncated natural-number subtraction as a concrete non-associative operation. -/
def NaturalSubtraction : BinaryEndoOperation Nat :=
  fun left right => left - right

/-- Natural-number subtraction is not associative. -/
theorem NaturalSubtractionFailsAssociative :
    FailsAssociative NaturalSubtraction := by
  sorry

end LRA.Operation.Laws.Associative
