import LRA.Operation.Laws.Cancellation.Definition

namespace LRA.Operation.Laws.Cancellation

open LRA.Operation

universe u

theorem LeftCancellative.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : LeftCancellative operation)
    (fixed first second : Carrier)
    (equal_products : operation fixed first = operation fixed second) :
    first = second := by
  sorry


theorem RightCancellative.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : RightCancellative operation)
    (first second fixed : Carrier)
    (equal_products : operation first fixed = operation second fixed) :
    first = second := by
  sorry


theorem LeftRegular.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {fixed : Carrier}
    (law : LeftRegular operation fixed)
    (first second : Carrier)
    (equal_products : operation fixed first = operation fixed second) :
    first = second := by
  sorry


theorem RightRegular.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {fixed : Carrier}
    (law : RightRegular operation fixed)
    (first second : Carrier)
    (equal_products : operation first fixed = operation second fixed) :
    first = second := by
  sorry


theorem LeftCancellativeOn.apply {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : LeftCancellativeOn eligible operation)
    (fixed : Carrier)
    (eligible_fixed : eligible fixed) :
    LeftRegular operation fixed := by
  sorry


theorem RightCancellativeOn.apply {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : RightCancellativeOn eligible operation)
    (fixed : Carrier)
    (eligible_fixed : eligible fixed) :
    RightRegular operation fixed := by
  sorry


theorem TwoSidedCancellativeOn.left {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : TwoSidedCancellativeOn eligible operation) :
    LeftCancellativeOn eligible operation := by
  sorry


theorem TwoSidedCancellativeOn.right {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : TwoSidedCancellativeOn eligible operation) :
    RightCancellativeOn eligible operation := by
  sorry


theorem TwoSidedCancellativeOn.of_left_right {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (leftLaw : LeftCancellativeOn eligible operation)
    (rightLaw : RightCancellativeOn eligible operation) :
    TwoSidedCancellativeOn eligible operation := by
  sorry


theorem TwoSidedCancellative.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : TwoSidedCancellative operation) :
    LeftCancellative operation := by
  sorry


theorem TwoSidedCancellative.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : TwoSidedCancellative operation) :
    RightCancellative operation := by
  sorry


theorem TwoSidedCancellative.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (leftLaw : LeftCancellative operation)
    (rightLaw : RightCancellative operation) :
    TwoSidedCancellative operation := by
  sorry

end LRA.Operation.Laws.Cancellation
