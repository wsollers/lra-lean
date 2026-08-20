import LRA.Operation.Laws.Cancellation.Theorems
import LRA.Operation.Laws.Commutative.Definition
import LRA.Operation.Laws.Absorbing.Definition

namespace LRA.Operation.Laws.Cancellation

open LRA.Operation

universe u

theorem Commutative.left_cancellative_to_right_cancellative {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (leftLaw : LeftCancellative operation) :
    RightCancellative operation := by
  sorry


theorem Commutative.right_cancellative_to_left_cancellative {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (commutative :
      LRA.Operation.Laws.Commutative.Commutative operation)
    (rightLaw : RightCancellative operation) :
    LeftCancellative operation := by
  sorry


theorem LeftCancellative.left_regular {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : LeftCancellative operation)
    (fixed : Carrier) :
    LeftRegular operation fixed := by
  sorry


theorem RightCancellative.right_regular {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : RightCancellative operation)
    (fixed : Carrier) :
    RightRegular operation fixed := by
  sorry


theorem LeftCancellative.to_left_cancellative_on {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : LeftCancellative operation) :
    LeftCancellativeOn eligible operation := by
  sorry


theorem RightCancellative.to_right_cancellative_on {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : RightCancellative operation) :
    RightCancellativeOn eligible operation := by
  sorry


theorem LeftAbsorbing.not_left_regular_of_distinct {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {absorber first second : Carrier}
    (absorbing :
      LRA.Operation.Laws.Absorbing.LeftAbsorbing operation absorber)
    (distinct : first ≠ second) :
    Not (LeftRegular operation absorber) := by
  sorry

end LRA.Operation.Laws.Cancellation
