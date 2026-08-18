import LRA.Operation.Laws.Nilpotent.Definition

namespace LRA.Operation.Laws.Nilpotent

open LRA.Operation

universe u

def FailsNilpotentElement {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (zero element : Carrier) : Prop :=
  Not (NilpotentElement operation zero element)

def NaturalMultiplicationForNilpotenceFailure : BinaryEndoOperation Nat :=
  fun left right => left * right

theorem NaturalOneFailsNilpotentUnderMultiplication :
    FailsNilpotentElement NaturalMultiplicationForNilpotenceFailure 0 1 := by
  sorry

end LRA.Operation.Laws.Nilpotent
