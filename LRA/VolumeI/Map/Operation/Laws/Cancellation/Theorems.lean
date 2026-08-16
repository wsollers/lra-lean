import LRA.VolumeI.Map.Operation.Laws.Cancellation.Definition

namespace LRA.Map.Operation.Laws.Cancellation

open LRA.Map.Operation

universe u

/--
**[Theorem — LeftCancellative]**

Apply a left-cancellation law.
-/
theorem LeftCancellative.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : LeftCancellative operation)
    (fixed first second : Carrier)
    (equal_products : operation fixed first = operation fixed second) :
    first = second := by
  sorry

/--
**[Theorem — RightCancellative]**

Apply a right-cancellation law.
-/
theorem RightCancellative.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : RightCancellative operation)
    (first second fixed : Carrier)
    (equal_products : operation first fixed = operation second fixed) :
    first = second := by
  sorry

/-- Apply a left-regular element. -/
theorem LeftRegular.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {fixed : Carrier}
    (law : LeftRegular operation fixed)
    (first second : Carrier)
    (equal_products : operation fixed first = operation fixed second) :
    first = second := by
  sorry

/-- Apply a right-regular element. -/
theorem RightRegular.apply {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    {fixed : Carrier}
    (law : RightRegular operation fixed)
    (first second : Carrier)
    (equal_products : operation first fixed = operation second fixed) :
    first = second := by
  sorry

/-- Apply a restricted left-cancellation law. -/
theorem LeftCancellativeOn.apply {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : LeftCancellativeOn eligible operation)
    (fixed : Carrier)
    (eligible_fixed : eligible fixed) :
    LeftRegular operation fixed := by
  sorry

/-- Apply a restricted right-cancellation law. -/
theorem RightCancellativeOn.apply {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : RightCancellativeOn eligible operation)
    (fixed : Carrier)
    (eligible_fixed : eligible fixed) :
    RightRegular operation fixed := by
  sorry

/-- A restricted two-sided cancellation law supplies restricted left cancellation. -/
theorem TwoSidedCancellativeOn.left {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : TwoSidedCancellativeOn eligible operation) :
    LeftCancellativeOn eligible operation := by
  sorry

/-- A restricted two-sided cancellation law supplies restricted right cancellation. -/
theorem TwoSidedCancellativeOn.right {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (law : TwoSidedCancellativeOn eligible operation) :
    RightCancellativeOn eligible operation := by
  sorry

/-- Restricted left and right cancellation assemble into restricted two-sided cancellation. -/
theorem TwoSidedCancellativeOn.of_left_right {Carrier : Type u}
    {eligible : Carrier -> Prop}
    {operation : BinaryEndoOperation Carrier}
    (leftLaw : LeftCancellativeOn eligible operation)
    (rightLaw : RightCancellativeOn eligible operation) :
    TwoSidedCancellativeOn eligible operation := by
  sorry

/--
**[Theorem — TwoSidedCancellative]**

A two-sided cancellation law supplies left cancellation.
-/
theorem TwoSidedCancellative.left {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : TwoSidedCancellative operation) :
    LeftCancellative operation := by
  sorry

/--
**[Theorem — TwoSidedCancellative]**

A two-sided cancellation law supplies right cancellation.
-/
theorem TwoSidedCancellative.right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (law : TwoSidedCancellative operation) :
    RightCancellative operation := by
  sorry

/--
**[Theorem — TwoSidedCancellative]**

Left and right cancellation laws assemble into a two-sided cancellation law.
-/
theorem TwoSidedCancellative.of_left_right {Carrier : Type u}
    {operation : BinaryEndoOperation Carrier}
    (leftLaw : LeftCancellative operation)
    (rightLaw : RightCancellative operation) :
    TwoSidedCancellative operation := by
  sorry

end LRA.Map.Operation.Laws.Cancellation
