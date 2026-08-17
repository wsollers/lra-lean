import LRA.Operation.Laws.Cancellation.Definition

namespace LRA.Operation.Laws.Cancellation

open LRA.Operation

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

theorem NaturalMultiplicationFailsLeftCancellative :
    FailsLeftCancellative NaturalMultiplication := by
  sorry

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

theorem NaturalZeroFailsLeftRegularUnderMultiplication :
    FailsLeftRegular NaturalMultiplication 0 := by
  sorry

theorem NaturalZeroFailsRightRegularUnderMultiplication :
    FailsRightRegular NaturalMultiplication 0 := by
  sorry

end LRA.Operation.Laws.Cancellation
