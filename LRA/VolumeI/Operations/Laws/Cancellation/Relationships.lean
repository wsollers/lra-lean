import LRA.VolumeI.Operations.Laws.Cancellation.Theorems
import LRA.VolumeI.Operations.Laws.Commutative.Definition
import LRA.VolumeI.Operations.Laws.Absorbing.Definition

namespace LRA.Operation.Laws.Cancellation

open LRA.Operation

universe u

/--
**[Theorem — Commutative.left_cancellative_to_right_cancellative]**

For a commutative operation, left cancellation transfers to right
cancellation.
-/
theorem Commutative.left_cancellative_to_right_cancellative {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (leftLaw : LeftCancellative operation) :
    RightCancellative operation := by
  sorry

/--
**[Theorem — Commutative.right_cancellative_to_left_cancellative]**

For a commutative operation, right cancellation transfers to left
cancellation.
-/
theorem Commutative.right_cancellative_to_left_cancellative {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (rightLaw : RightCancellative operation) :
    LeftCancellative operation := by
  sorry

/-- Global left cancellation makes every element left-regular. -/
theorem LeftCancellative.left_regular {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : LeftCancellative operation)
    (fixed : Carrier) :
    LeftRegular operation fixed := by
  sorry

/-- Global right cancellation makes every element right-regular. -/
theorem RightCancellative.right_regular {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : RightCancellative operation)
    (fixed : Carrier) :
    RightRegular operation fixed := by
  sorry

/-- Global left cancellation restricts to any eligibility predicate. -/
theorem LeftCancellative.to_left_cancellative_on {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : LeftCancellative operation) :
    LeftCancellativeOn eligible operation := by
  sorry

/-- Global right cancellation restricts to any eligibility predicate. -/
theorem RightCancellative.to_right_cancellative_on {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : RightCancellative operation) :
    RightCancellativeOn eligible operation := by
  sorry

/-- A left-absorbing element cannot be left-regular on a carrier with two distinct elements. -/
theorem LeftAbsorbing.not_left_regular_of_distinct {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber first second : Carrier}
    (absorbing :
      LRA.Operation.Laws.Absorbing.LeftAbsorbing operation absorber)
    (distinct : first ≠ second) :
    Not (LeftRegular operation absorber) := by
  sorry

end LRA.Operation.Laws.Cancellation
