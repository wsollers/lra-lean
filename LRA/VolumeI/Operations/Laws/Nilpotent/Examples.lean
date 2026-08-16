import LRA.VolumeI.Operations.Laws.Nilpotent.Theorems

namespace LRA.Operation.Laws.Nilpotent

open LRA.Operation

/-- Natural-number multiplication as a concrete nilpotence example operation. -/
def NaturalMultiplicationForNilpotenceExample : BinaryEndoOperation Nat :=
  fun left right => left * right

/--
**[Example — NaturalZeroNilpotentUnderMultiplication]**

Zero is nilpotent under natural-number multiplication.
-/
theorem NaturalZeroNilpotentUnderMultiplication :
    NilpotentElement NaturalMultiplicationForNilpotenceExample 0 0 := by
  sorry

end LRA.Operation.Laws.Nilpotent
