import LRA.VolumeI.Operations.Laws.Nilpotent.Definition

namespace LRA.Operation.Laws.Nilpotent

open LRA.Operation

universe u

/-- Failure of nilpotence for an element. -/
def FailsNilpotentElement {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (zero element : Carrier) : Prop :=
  Not (NilpotentElement operation zero element)

/-- Natural-number multiplication as a concrete nilpotence failure operation. -/
def NaturalMultiplicationForNilpotenceFailure : BinaryEndoOperation Nat :=
  fun left right => left * right

/--
**[Failure Mode — NaturalOneFailsNilpotentUnderMultiplication]**

One is not nilpotent under natural-number multiplication.
-/
theorem NaturalOneFailsNilpotentUnderMultiplication :
    FailsNilpotentElement NaturalMultiplicationForNilpotenceFailure 0 1 := by
  sorry

end LRA.Operation.Laws.Nilpotent
