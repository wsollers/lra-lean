import LRA.VolumeI.Map.Operation.Laws.Cancellation.Definition

namespace LRA.Map.Operation.Laws.Cancellation

open LRA.Map.Operation

universe u

/-- Failure of left cancellation for a binary endo-operation. -/
def FailsLeftCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  Not (LeftCancellative operation)

/-- Failure of right cancellation for a binary endo-operation. -/
def FailsRightCancellative {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier) : Prop :=
  Not (RightCancellative operation)

/-- Natural-number multiplication as a concrete cancellation failure. -/
def NaturalMultiplication : BinaryEndoOperation Nat :=
  fun left right => left * right

/--
**[Failure Mode — NaturalMultiplicationFailsLeftCancellative]**

Natural-number multiplication is not left cancellative because multiplication
by zero collapses distinct inputs.
-/
theorem NaturalMultiplicationFailsLeftCancellative :
    FailsLeftCancellative NaturalMultiplication := by
  sorry

/--
**[Failure Mode — NaturalMultiplicationFailsRightCancellative]**

Natural-number multiplication is not right cancellative because multiplication
by zero collapses distinct inputs.
-/
theorem NaturalMultiplicationFailsRightCancellative :
    FailsRightCancellative NaturalMultiplication := by
  sorry

/-- Failure of left-regularity for a fixed element. -/
def FailsLeftRegular {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (fixed : Carrier) : Prop :=
  Not (LeftRegular operation fixed)

/-- Failure of right-regularity for a fixed element. -/
def FailsRightRegular {Carrier : Type u}
    (operation : BinaryEndoOperation Carrier)
    (fixed : Carrier) : Prop :=
  Not (RightRegular operation fixed)

/-- Zero is not left-regular for natural-number multiplication. -/
theorem NaturalZeroFailsLeftRegularUnderMultiplication :
    FailsLeftRegular NaturalMultiplication 0 := by
  sorry

/-- Zero is not right-regular for natural-number multiplication. -/
theorem NaturalZeroFailsRightRegularUnderMultiplication :
    FailsRightRegular NaturalMultiplication 0 := by
  sorry

end LRA.Map.Operation.Laws.Cancellation
